
library(tidyverse)
library(stringi)

# find duplicated input taxa
test <- LCPspecies_table$Input.Taxon[duplicated(LCPspecies_table$Input.Taxon)]
test2 <- LCPspecies_table %>%  filter(Input.Taxon %in% test)

# for now remove all duplicated input anmes, BUT THIS HAS TO BE FIXED BY THE OTHERS BEFORE FINAL COMPILATION
LCPspecies_table <- LCPspecies_table %>% filter(!duplicated(LCPspecies_table$Input.Taxon))

LCPspecies_table$input_genus <- str_split_fixed(LCPspecies_table$Input.Taxon, pattern = " ", n = 2)[,1] 
LCPspecies_table$input_species <- str_split_fixed(LCPspecies_table$Input.Taxon, pattern = " ", n = 2)[,2]

# individual tables
ref_status <- data.frame(status_ID = sort(unique(as.integer(as.factor(LCPspecies_table$Status)))),
                         status = levels(as.factor(LCPspecies_table$Status)))
ref_family <-  data.frame(family_ID = sort(unique(as.integer(as.factor(LCPspecies_table$Family)))),
                          family = levels(as.factor(LCPspecies_table$Family)))
ref_order <-  data.frame(order_ID = sort(unique(as.integer(as.factor(LCPspecies_table$Order)))),
                         order = levels(as.factor(LCPspecies_table$Order)))
ref_tplcomp <- data.frame(tplcomp_ID = sort(unique(as.integer(as.factor(LCPspecies_table$PL.comparison)))),
                          tpl_comp = levels(as.factor(LCPspecies_table$PL.comparison)))
ref_tplalt <- data.frame(tplcomp_ID = sort(unique(as.integer(as.factor(LCPspecies_table$PL.alternative)))),
                          tpl_comp = levels(as.factor(LCPspecies_table$PL.alternative)))
ref_inpgen <- data.frame(tplcomp_ID = sort(unique(as.integer(as.factor(LCPspecies_table$input_genus)))),
                          tpl_comp = levels(as.factor(LCPspecies_table$input_genus)))
ref_matched_inp <- data.frame(matched_ID = sort(unique(as.integer(as.factor(LCPspecies_table$Output.Taxon)))),
                          matched = levels(as.factor(LCPspecies_table$Output.Taxon)))
ref_matched <- ref_matched_inp$matched
names(ref_matched) <-  ref_matched_inp$matched_ID

tab_base <- LCPspecies_table %>% 
  mutate(status_ID = as.integer(as.factor(Status)),
         tplcomp_ID = as.integer(as.factor(PL.comparison)),
         tplalt_ID = as.integer(as.factor(PL.alternative)),
         family_ID = as.integer(as.factor(Family)),
         family_ID = as.integer(as.factor(Order)),
         inputgenus_ID = as.integer(as.factor(input_genus)),
         matched_ID = as.integer(as.factor(Output.Taxon))) %>% 
  select(contains("ID")) %>% 
  as.matrix()

tab_species <- LCPspecies_table %>% 
  select(input_species) %>% 
  unlist(use.names = FALSE)

# save to disk 
saveRDS(ref_status, file = "data/ref_status.rds", compress = "xz")
saveRDS(ref_family, file = "data/ref_family.rds", compress = "xz")
saveRDS(ref_order, file = "data/ref_order.rds", compress = "xz")
saveRDS(ref_tplcomp , file = "data/ref_tplcomp .rds", compress = "xz")
saveRDS(ref_tplalt, file = "data/tab_tplalt.rds", compress = "xz")
saveRDS(ref_inpgen, file = "data/ref_inpgen.rds", compress = "xz")
saveRDS(ref_outgen, file = "data/ref_outgen.rds", compress = "xz")
saveRDS(ref_matched, file = "data/ref_matched.rds", compress = "xz")
saveRDS(tab_base, file = "data/tab_base.rds", compress = "xz")
saveRDS(tab_species, file = "data/input_psecies_names.rds", compress = "xz")

# Now a function to put everything back together


tab_names <- data.frame(name_ID = sort(unique(as.integer(as.factor(LCPspecies_table$Input.Taxon)))),
                        name = levels(as.factor(LCPspecies_table$Input.Taxon)),
                        plalt = LCPspecies_table$PL.alternative)

tab_tplalt <- tab_names %>% 
  select(name_ID, tpl_alt = plalt) %>% 
  filter(tpl_alt != "")

tab_names <- select(tab_names, -plalt)

tab_base <- data.frame(tab_names,
                       status_ID = as.integer(as.factor(LCPspecies_table$Status)),
                       pl_comaprison_ID = as.integer(as.factor(LCPspecies_table$PL.comparison)),
                       family_ID = as.integer(as.factor(LCPspecies_table$Family)), 
                       order_ID = as.integer(as.factor(LCPspecies_table$Order)))

tab_base2 <- tab_base %>% select(-name) %>%  as.matrix()

input_names <- LCPspecies_table %>% select(input_species) %>%  unlist() %>%  as.character()
names(input_names) <-  NULL


# function to combine the full table







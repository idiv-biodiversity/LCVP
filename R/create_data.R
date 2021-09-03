# #------- This should go to LCVP package --------------
# # ATENTION QUICK FIX OF THE NAMES
# remove_for_now <- c(258521, 669979, 1133520) 
# # Duplicates
# # Acacia oshanesii F.Muell. & Maiden (5146, 5147) are the same
# # Acacia brownii (Poir.) Steud. (3183, 3184) are the same
# 
# 
# # All upper case to avoid problems
# #pos_para_teste <- 1:nrow()
# tab_lcvp[remove_for_now[1], 1] <-  c("Centrosema virginianum subsp. angustifolium (DC.) Hadac",
#          "Jungia gunnerifolia (S.Díaz) Diazgr. & F.Ávila",
#          "Senecio piedrahitae J.Calvo & F.Ávila")
# # tab_lcvp$Output.Taxon[remove_for_now[2:3]] <- c("Jungia gunnerifolia (S.Díaz) Diazgr. & F.Ávila",
# # "Senecio piedrahitae J.Calvo & F.Ávila")
# 
# # Make names standard
# .standardize <- function(splist) {
#   fixed <- toupper(splist) # all up
#   fixed2 <- trimws(fixed) # remove trailing and leading space
#   fixed3 <- gsub("_", " ", fixed2) # change names separated by _ to space
#   return(fixed3)
# }
# 
# 
# ## Fix original table
# lcvp_sps <- .standardize(tab_lcvp[,1]) # ATENTION QUICK FIX OF THE NAMES
# 
# lcvp_sps_class <- .splist_classify(lcvp_sps)
# lcvp_sps_class <- cbind(lcvp_sps_class, ID = 1:nrow(lcvp_sps_class))
# 
# usethis::use_data(lcvp_sps_class, lcvp_sps_class)
# usethis::use_data(tab_lcvp, tab_lcvp, overwrite = TRUE)
# 
# 
# 
# # Genus
# tab_position
# c("Position", "Triphthong", "Genus")
# 
# Position <- which(!duplicated(lcvp_sps_class[, 2]))
# Genus <- lcvp_sps_class[Position, 2]
# Triphthong <- substr(genus, 1, 3)
# 
# tab_position <-  data.frame(Position, Triphthong, Genus)
# usethis::use_data(tab_position, tab_position, overwrite = TRUE)
# 
# 
# # Family
# Family <- unique(tab_lcvp$Family)
# Family <- Family[Family != '']
# 
# position_family <- list()
# 
# for (i in 1:length(Family)) {
#   print(i)
#   position_family[[i]] <- which(tab_lcvp$Family == Family[i])
# }
# names(position_family) <- toupper(Family)
# lcvp_family <-  position_family
# 
# usethis::use_data(lcvp_family, lcvp_family, overwrite = T)
# 
# tab_lcvp[121, ]
# 
# 
# check <- which(tab_lcvp$Family == Family[2])
# any((check[2:length(check)] - check[1:(length(check) - 1)]) != 1)
# 
# check[1:10]
# 
# 
# 
# # Order
# Order <- unique(tab_lcvp$Order)
# Order <- Order[Order != '']
# 
# position_Order <- list()
# 
# for (i in 1:length(Order)) {
#   print(i)
#   position_Order[[i]] <- which(tab_lcvp$Order == Order[i])
# }
# names(position_Order) <- toupper(Order)
# lcvp_order <-  position_Order
# 
# usethis::use_data(lcvp_order, lcvp_order, overwrite = T)
# 
# Order <- unique(tab_lcvp$Order)
# Order <- Order[Order != '']
# 
# position_Order <- list()
# 
# for (i in 1:length(Order)) {
#   print(i)
#   position_Order[[i]] <- which(tab_lcvp$Order == Order[i])
# }
# names(position_Order) <- toupper(Order)
# lcvp_order <-  position_Order
# 
# usethis::use_data(lcvp_order, lcvp_order, overwrite = T)
# 
# AUTHORS
# authors <- strsplit(LCVP::lcvp_sps_class[, 4], " ")
# 
# all_authors <- authors
# all_authors <- lapply(all_authors, function(x){x[x != "&"]})
# all_authors <- lapply(all_authors, function(x){gsub("\\(", "", x)})
# all_authors <- lapply(all_authors, function(x){gsub("\\)", "", x)})
# all_authors <- lapply(all_authors, function(x){gsub("\\]", "", x)})
# all_authors <- lapply(all_authors, function(x){gsub("\\[", "", x)})
# all_authors <- lapply(all_authors, function(x){gsub("[[:digit:]]", "", x)})
# all_authors <- lapply(all_authors, function(x){x[x != "EX"]})
# all_authors <- lapply(all_authors, function(x){x[x != "IN"]})
# all_authors <- lapply(all_authors, function(x){x[x != "X"]})
# all_authors <- lapply(all_authors, function(x){x[x != "_"]})
# all_authors <- lapply(all_authors, function(x){x[x != "."]})
# all_authors <- lapply(all_authors, function(x){x[x != "&."]})
# all_authors <- lapply(all_authors, function(x){x[x != "-"]})
# all_authors <- lapply(all_authors, function(x){x[x != ""]})
# 
# all_authors_uniques <- sort(unique(unlist(all_authors)))
# n <- length(all_authors_uniques)
# lcvp_authors <- list()
# for (i in 1:n) {
#   print(n - i)
#   lcvp_authors[[i]] <- which(sapply(all_authors, function(x){any(x %in% all_authors_uniques[i])}))
# }
# 
# names(lcvp_authors) <- all_authors_uniques
# usethis::use_data(lcvp_authors, lcvp_authors, overwrite = T)
# 
# 
# sum(sapply(all_authors, function(x){any(x == "VAR")}))

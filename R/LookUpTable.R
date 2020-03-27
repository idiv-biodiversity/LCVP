# This function is made to create the .csv file ListTable_3LetterPos_vrs20190903.csv

#encoding = "UTF-8"

LCP_pos_search <-
  function(start=0, encoding = "UTF-8")  {
  print(start)
  setwd("C://Users//Gentile//Documents//LCP")
  wd_path <- paste(getwd(), "//raw_data_LCP//tmp",sep = "")
  #in_path <- "/LPL4dev/data"
  
  LCP_table_name <- paste("/LCVP_1.01.txt",sep = "")
  #pathstring <- file.choose()
  pathstring <- paste(wd_path, LCP_table_name, sep = "")
  LCPspecies_table <- try(read.csv(pathstring, header = TRUE, sep = "\t", fill = TRUE, colClasses = "character", as.is = TRUE, encoding = encoding), silent = TRUE)
  
  table_name <- paste("/ListTable_3LetterPos_LCVP1.01.csv",sep = "")
  pathstring <- paste(wd_path, table_name, sep = "")
  
  col <- dim(LCPspecies_table)[2]
  row <- dim(LCPspecies_table)[1]
  
  Position_table_tmp <- data.frame(Position = NULL, Triphthong = NULL, Genus = NULL)
  Position_table_final <- data.frame(Position = NULL, Triphthong = NULL, Genus = NULL)
  
  triplet <- "Zero"
  
  for (i in 1:row)  {
    LCP_genus <- unlist(strsplit(LCPspecies_table[i,1], " "))[1]
    if (nchar(LCP_genus) < 3){
      LCP_ini = substring(LCP_genus, 1, 2)
    } else {LCP_ini = substring(LCP_genus, 1, 3)}
    if (LCP_ini != triplet) {
      print(i)
      print(LCP_ini)
      print(LCP_genus)
      triplet = LCP_ini
      Position_table_tmp <- data.frame(Position = i, Triphthong = LCP_ini, Genus = LCP_genus)
      write.table(Position_table_tmp, pathstring, sep = ",", col.names = FALSE, row.names = FALSE, append = TRUE, quote = FALSE)
      Position_table_final <- rbind(Position_table_final, Position_table_tmp)
    }
  }
  LCPspecies_table <- try(read.csv(path_Name_Tab, header = TRUE, sep = "\t", fill = TRUE, colClasses = "character", as.is = TRUE, encoding = "ANSI"), silent = TRUE)
  save(LCPspecies_table, file = "C://Users//Gentile//Documents//Taxonomization_prj//LCP_TaxaSystem//LCP_list//LCVP_1.01\\tab_lcp.rda", compress = "xz")
  
  LCPposition_table <- try(read.csv(path_Pos_Tab, header = TRUE, sep = ",", fill = TRUE, colClasses = "character", as.is = TRUE, encoding = "UTF-8"), silent = TRUE)
  save(LCPposition_table, file = "C://Users//Gentile//Documents//Taxonomization_prj//LCP_TaxaSystem//LCP_list//tab_position.rda", compress = "xz")
  
}
    
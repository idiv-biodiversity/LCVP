#' Update the data files of LCVP

#' Updates the tab-lcsv and tab_position data files from a new text file version of the Leipzig CAtalogue of Vascular Plants.
#' 
#' 
#' @param input_data the path to the new version of the Leipzig Catalogue of Vasculart plants.
#' @param output_folder the floder where the output files should be saved. By default the data 
#' folder of the LCVP package.
#' @param output_names The names of the output files. Position one is the tab_lcsvp files
#' position two the tab_position file.
#' @param encoding the encoding to read the input data.
#' 
#' @author Alessandro Gentile, Alexander Zizka
#' @examples
#' 
#' \dontrun{
#' update_LCVP_data()
#' }
#' 
#' @importFrom utils read.csv write.table
#' @export

#encoding = "UTF-8"

update_LCVP_data <- function(input_data = "raw_data_LCVP/LCVP_1.01.txt", 
                             output_folder = "data", 
                             output_names = c("tab_lcvp.rda", "tab_position.rda"), 
                             encoding = "UTF-8")  {

  # Load data
  LCVPspecies_table <- read.csv(input_data, 
                               header = TRUE, 
                               sep = "\t", 
                               fill = TRUE, 
                               colClasses = "character", 
                               as.is = TRUE, 
                               encoding = encoding)
  
  # generate position table
  col <- dim(LCVPspecies_table)[2]
  row <- dim(LCVPspecies_table)[1]
  
  Position_table_tmp <- data.frame(Position = NULL, Triphthong = NULL, Genus = NULL, stringsAsFactors=FALSE)
  tab_position <- data.frame(Position = NULL, Triphthong = NULL, Genus = NULL, stringsAsFactors=FALSE)
  
  triplet <- "Zero"
  
  for (i in 1:row)  {
    LCVP_genus <- unlist(strsplit(LCVPspecies_table[i,1], " "))[1]
    if (nchar(LCVP_genus) < 3){
      LCVP_ini = substring(LCVP_genus, 1, 2)
    } else {LCVP_ini = substring(LCVP_genus, 1, 3)}
    if (LCVP_ini != triplet) {
      print(i)
      print(LCVP_ini)
      print(LCVP_genus)
      triplet = LCVP_ini
      Position_table_tmp <- data.frame(Position = i, Triphthong = LCVP_ini, Genus = LCVP_genus, stringsAsFactors=FALSE)
      #write.table(Position_table_tmp, pathstring, sep = ",", col.names = FALSE, row.names = FALSE, append = TRUE, quote = FALSE)
      tab_position <- rbind(tab_position, Position_table_tmp)
    }
  }

  # save position table
  save(tab_position, file = file.path(output_folder, output_names[2]), compress = "xz")
  
  # save data table
  tab_lcvp <- LCVPspecies_table
  save(tab_lcvp, file = file.path(output_folder, output_names[1]), compress = "xz")

}

  
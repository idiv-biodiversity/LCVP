# A script to update the data file in the LCVP package

library(LCVP)


update_LCVP_data(input_data = "raw_data_LCVP/LCVP_103.txt", 
                 output_folder = "data", 
                 output_names = c("tab_lcvp.rda", "tab_position.rda"), 
                 encoding = "UTF-8") 

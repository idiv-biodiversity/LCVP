# Auxiliar function to change new LCVP table into older one, this will avoid
# changing the code
# Author: Bruno Vilela

#-------------------------------------------------------#
# Function to check list of names input
# x is the new table

.transform_table <- function(x) {
  Status <- x[, 7]
  Input.Taxon <- paste(
    x[, 2],
    x[, 3],
    gsub("species", "", x[, 4]),
    gsub("nil", "", x[, 5]),
    x[, 6]
  )
  Input.Taxon <-
    gsub("(?<=[\\s])\\s*|^\\s+|\\s+$", "", Input.Taxon, perl = TRUE)
  PL.comparison <- rep(NA, nrow(x))
  PL.alternative <- rep(NA, nrow(x))
  Output.Taxon <- x[, 9]
  Family <- x[, 10]
  Order <- x[, 11]
  
  old_tab <- data.frame(Input.Taxon,
                        Status,
                        PL.comparison,
                        PL.alternative,
                        Output.Taxon,
                        Family,
                        Order)
  return(old_tab)
}

#-------------------------------------------------------#
# Make names standard
.names_standardize <- function(splist) {
  fixed1 <- toupper(splist) # all up
  fixed2 <- gsub("CF\\.", "", fixed1)
  fixed3 <- gsub("AFF\\.", "", fixed2)
  fixed4 <- trimws(fixed3) # remove trailing and leading space
  fixed5 <- gsub("_", " ", fixed4) # change names separated by _ to space
  # Merge multiple spaces
  fixed6 <- gsub("(^X )|( X$)|( X )", " ", fixed5)
  fixed7 <- gsub("(?<=[\\s])\\s*|^\\s+|\\s+$", "", fixed6, perl = TRUE)
  return(fixed7)
}
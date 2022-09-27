
#' List of the number positions of the first 3 letters of the species name in
#' the tab_lcvp
#' 
#' The 'tab_position' reports the
#' position (in term of number of rows) of the first three letters (triphthong)
#' for the plant names stored in the variable 'Input.Taxon' (which
#' are listed in alphabetical order) of the table 'tab_lcvp'. This
#' indexing system speeds up of the search on the largest list
#' 'tab_lcvp.rda' using the lcvplants package.
#' 
#' 
#' @name tab_position
#' @docType data
#' @format A data frame with 2676 observations on the following 3 variables.
#' \describe{ 
#'  \item{Position}{A character vector. It is the position of
#' the first 3 letters of the species name in the tab_lcvp.}
#' \item{Triphthong}{A character vector. First 3 letters of the species
#' name in the tab_lcvp.} \item{Genus}{A character vector.
#' Corresponding Genus name.} }
#' @references The Leipzig Catalogue of Vascular Plants (LCVP) - An improved taxonomic
#' reference list for all known vascular plants
#' @keywords datasets
#' @examples
#' 
#' data(tab_position)
#' str(tab_position)
#' @import utils
"tab_position"





#' List of Plant Species Name accordingly with the Leipzig Catalogue of Vascular Plants
#' (LCVP)
#' 
#' The 'tab_lcvp' contains records belonging to all the
#' vascular plant taxa names checked and listed from the "Leipzig Catalogue of
#' Plants" (LCVP).
#' 
#'
#' @name tab_lcvp
#' @docType data
#' @format A data frame with the following columns:
#'   \describe{\item{global.Id}{The fixed species id of the input taxon in the
#'   Leipzig Catalogue of Vascular Plants (LCVP).} 
#'   \item{Input.Genus}{A
#'   character vector. The input genus of the corresponding vascular plant
#'   species name listed in LCVP.} 
#'   \item{Input.Epitheton}{A character vector.
#'   The input epitheton of the corresponding vascular plant species name listed
#'   in LCVP.} 
#'   \item{Rank}{A character vector. The taxonomic rank ("species",
#'   subspecies: "subsp.", variety: "var.", subvariety: "subvar.", "forma", or
#'   subforma: "subf.") of the corresponding vascular plant species name listed
#'   in LCVP.} 
#'   \item{Input.Subspecies.Epitheton}{A character vector. If the
#'   indicated rank is below species, the subspecies epitheton input of the
#'   corresponding vascular plant species name listed in LCVP. If the rank is
#'   "species", the input is "nil".} 
#'   \item{Input.Authors}{A character vector.
#'   The taxonomic authority input of the corresponding vascular plant species
#'   name listed in LCVP.} 
#'   \item{Status}{A character vector. description if a
#'   taxon is classified as ‘valid’, ‘synonym’, ‘unresolved’, ‘external’ or
#'   ‘blanks’. The ‘unresolved’ rank means that the status of the plant name
#'   could be either valid or synonym, but the information available does not
#'   allow a definitive decision. ‘External’ in an extra rank which lists names
#'   outside the scope of this publication but useful to keep on this updated
#'   list. ‘Blanks’ means that the respective name exists in bibliography but it
#'   is neither clear where it came from valid, synonym or unresolved. (see the
#'   main text Freiberg et al. for more details)}
#'   \item{globalId.of.Output.Taxon}{The fixed species id of the output taxon
#'   in LCVP.} 
#'   \item{Output.Taxon}{A character vector. The list of the accepted
#'   plant taxa names according to the LCVP.} 
#'   \item{Family}{A character vector.
#'   The corresponding family name of the Input.Taxon, staying empty if the
#'   Status is unresolved.} 
#'   \item{Order}{A character vector. The corresponding
#'   order name of the Input.Taxon, staying empty if the Status is unresolved.}
#'   \item{Literature}{A character vector. The bibliography used.}
#'   \item{Comments}{A character vector. Further taxonomic comments.}}
#'
#'   
#' @references The Leipzig Catalogue of Plants (LCVP) - An improved taxonomic
#' reference list for all known vascular plants.
#' @keywords datasets
#' @examples
#' 
#' data(tab_lcvp)
#' str(tab_lcvp)
#' 
"tab_lcvp"

#' List of authors and their position in tab_lcvp
#' 
#' The 'lcvp_authors' list includes all authors and their respective
#' described species' position in the tab_lcvp.
#' 
#' @name lcvp_authors
#' @docType data
#' @format A list.
#' @keywords datasets
#' @examples
#' 
#' data(lcvp_authors)
#' 
"lcvp_authors"


#' List of families and their position in tab_lcvp
#' 
#' The 'lcvp_family' list includes all families and their respective
#' position in the tab_lcvp.
#' 
#' @name lcvp_family
#' @docType data
#' @format A list.
#' @keywords datasets
#' @examples
#' 
#' data(lcvp_family)
#' 
"lcvp_family"

#' List of orders and their position in tab_lcvp
#' 
#' The 'lcvp_order' list includes all families and their respective
#' position in the tab_lcvp.
#' 
#' @name lcvp_order
#' @docType data
#' @format A list.
#' @keywords datasets
#' @examples
#' 
#' data(lcvp_order)
#' 
"lcvp_order"

#' List of species name in tab_lcvp separeted by category
#' 
#' The 'lcvp_sps_class' includes all species separeted by genus, epithet, author, 
#' subspecies, variety, subvariety, forma, subforma and ID (position in the 
#' \code{tab_lcvp}).
#' position in the \code{tab_lcvp}.
#' 
#' @name lcvp_sps_class
#' @docType data
#' @format A data.frame.
#' @keywords datasets
#' @examples
#' 
#' data(lcvp_sps_class)
#' 
"lcvp_sps_class"

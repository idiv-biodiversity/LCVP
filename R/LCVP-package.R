
#' List of the number positions of the first 3 letters of the species name in
#' the tab_lcp
#' 
#' The 'LCPposition_table' contains 2.676 records each of them reports the
#' position (in term of number of rows) of the first three letters (triphthong)
#' for the 1.314.778 plant names stored in the variable 'Input.Taxon' (which
#' are listed in alphabetical order) of the table 'tab_lcp'. This
#' indexing system allows the speeding up of the search on the largest list
#' 'tab_lcp.rda'. When the function 'LCPsolver()' begins the search
#' for a plant name (e.g. "Laserpitium eliasii"), it starts to compare the
#' first three letters of the submitted genus name (e.g. 'Las') with the
#' records in the list of Triphthong on the 'LCPposition_table.rda' table. When
#' it is able to find a match, the LCPsolver() function reads and stores in
#' memory the corresponding value (e.g. 688815) in the 'Position' column. This
#' value will be the starting point from where to start the search on the
#' 'tab_lcp' table; and the following position value (e.g. 691389) in
#' the 'Position' column will be used as the end point in the
#' 'tab_lcp' table where to stop the search process.
#' 
#' 
#' @name tab_position
#' @docType data
#' @format A data frame with 2676 observations on the following 3 variables.
#' \describe{ 
#'  \item{Position}{A character vector. It is the position of
#' the first 3 letters of the species name in the tab_lcp.}
#' \item{Triphthong}{A character vector. First 3 letters of the species
#' name in the tab_lcp.} \item{Genus}{A character vector.
#' Corresponding Genus name.} }
#' @references The Leipzig Catalogue of Plants (LCP) - An improved taxonomic
#' reference list for all known vascular plants
#' @source https://idata.idiv.de/ddm/Data/ShowData/1806
#' @keywords datasets
#' @examples
#' 
#' data(tab_position)
#' str(tab_position)
#' 
NULL





#' List of Plant Species Name accordingly with the Leipzig Catalogue of Plants
#' (LCP)
#' 
#' The 'tab_lcp' contains 1.314.778 records belonging to all the
#' vascular plant taxa names checked and listed from the "Leipzig Catalogue of
#' Plants" (LCP).
#' 
#' 
#' @name tab_lcp
#' @docType data
#' @format A data frame with 1314778 observations on the following 7 variables.
#' \describe{ \item{Input.Taxon}{A character vector. This variable
#' contains the list of all 1.314.778 vascular plant taxa names listed by the
#' authors of the Leipzig Catalogue of Plants.} \item{Status}{A
#' character vector. This variable provides a description if a taxon is
#' classified as 'valid', 'synonym', 'unresolved' or 'external'. The
#' 'unresolved' rank means that the status of the plant name could be either
#' valid or synonym, but the information available does not allow a definitive
#' decision (see the main text Freiberg et al. for more details).}
#' \item{PL.comparison}{A character vector. This field provides a
#' direct comparison with 'The Plant List' (TPL; The Plant List
#' http://www.theplantlist.org/ accessed: 1.1. 2013) reporting further
#' information such as 'identical', 'synonym', 'other synonym', 'different
#' authors', 'missing', 'misspelling', 'unresolved'.}
#' \item{PL.alternative}{A character vector. This field provides a
#' possible alternative name suggested by TPL.} \item{Output.Taxon}{A
#' character vector. This variable contains the list of the accepted plant taxa
#' names (350.766) according to the LCP.} \item{Family}{A character
#' vector. It provides the corresponding family name of the 'Input.Taxon',
#' staying empty if the Status is unresolved.} \item{Order}{A character
#' vector. The Order column provides the corresponding order name of the
#' 'Input.Taxon', staying empty if the Status is unresolved.} }
#' @references The Leipzig Catalogue of Plants (LCP) - An improved taxonomic
#' reference list for all known vascular plants.
#' @source https://idata.idiv.de/ddm/Data/ShowData/1806
#' @keywords datasets
#' @examples
#' 
#' data(tab_lcp)
#' str(tab_lcp)
#' 
NULL




#' #' Update the data files of LCVP
#' 
#' #' Updates the tab-lcsv and tab_position data files from a new text file
#' #' version of the Leipzig CAtalogue of Vascular Plants.
#' #'
#' #'
#' #' @param path path to the .zip folder containing the csv file.
#' #' @param new_format if TRUE, the input is in the "new" format (>= v. 2.0)
#' #'
#' 
#' require(usethis)
#' 
#' # format
#' update_LCVP_data <-
#'   function(path = "raw_data_LCVP/LCVP 2.0 export 27.7.2022.zip",
#'            new_format = TRUE,
#'            subset_tests = NULL) {
#'     source("R/auxiliary.R")
#'     source("R/splist_classify.R")
#'     # ---------------------- tab_lcvp --------------------
#'     # Read the file
#'     file_name <- utils::unzip(path, list = TRUE)[1, 1]
#'     tab_lcvp <- read.csv(unz(path, file_name))
#'     if (!is.null(subset_tests)) {
#'       tab_lcvp <- tab_lcvp[subset_tests, ]
#'     }
#'     for (i in 1:ncol(tab_lcvp)) {
#'       if (is.character(tab_lcvp[, i])) {
#'         Encoding(tab_lcvp[, i]) <- "UTF-8"
#'       }
#'     }
#' 
#'     # test valid
#'     non_valid <- apply(tab_lcvp, 2, validEnc)
#'     if (any(!non_valid)) {
#'       stop("Non valid characthers found in the updated table.")
#'     }
#' 
#' 
#' 
#'     # If new, transform to old
#'     if (new_format) {
#'       tab_lcvp2 <- .transform_table(tab_lcvp)
#'     }
#' 
#' 
#'     # ---------------------- lcvp_sps_class --------------------
#'     # First we need to standardize the names, for this we will use this
#'     # auxiliary function in the lcvplants package.
#'     lcvp_sps <- .names_standardize(tab_lcvp2[, 1])
#'     # Then we separate the names using another function in lcvplants package.
#'     # Classify the species
#'     lcvp_sps_class <- .splist_classify(lcvp_sps)
#'     # Now, add an ID column, indicating the row in the original data.
#'     # Include the ID
#'     lcvp_sps_class <- cbind(lcvp_sps_class,
#'                             ID = 1:nrow(lcvp_sps_class))
#'     # Finally, save to be used in the package.
#' 
#' 
#'     # ---------------------- tab_position --------------------
#'     Position <- which(!duplicated(lcvp_sps_class[, 2]))
#'     Genus <- lcvp_sps_class[Position, 2]
#'     Triphthong <- substr(Genus, 1, 3)
#'     tab_position <-
#'       data.frame(Position, Triphthong, Genus)
#' 
#'     # ---------------------- lcvp_family --------------------
#'     Family <- unique(tab_lcvp$Family)
#'     Family <- Family[Family != '']
#'     position_family <- list()
#'     for (i in 1:length(Family)) {
#'       position_family[[i]] <- which(tab_lcvp$Family == Family[i])
#'     }
#'     names(position_family) <- toupper(Family)
#'     lcvp_family <- position_family
#' 
#'     # ---------------------- lcvp_order --------------------
#' 
#'     Order <- unique(tab_lcvp$Order)
#'     Order <- Order[Order != '']
#'     position_Order <- list()
#'     for (i in 1:length(Order)) {
#'       position_Order[[i]] <- which(tab_lcvp$Order == Order[i])
#'     }
#'     names(position_Order) <- toupper(Order)
#'     lcvp_order <- position_Order
#' 
#'     # ---------------------- lcvp_authors --------------------
#'     authors <- strsplit(lcvp_sps_class[, 4], " ")
#' 
#'     all_authors <- authors
#'     all_authors <- lapply(all_authors, function(x){x[x != "&"]})
#'     all_authors <- lapply(all_authors, function(x){gsub("\\(", "", x)})
#'     all_authors <- lapply(all_authors, function(x){gsub("\\)", "", x)})
#'     all_authors <- lapply(all_authors, function(x){gsub("\\]", "", x)})
#'     all_authors <- lapply(all_authors, function(x){gsub("\\[", "", x)})
#'     all_authors <- lapply(all_authors, function(x){gsub("[[:digit:]]", "", x)})
#'     all_authors <- lapply(all_authors, function(x){x[x != "EX"]})
#'     all_authors <- lapply(all_authors, function(x){x[x != "IN"]})
#'     all_authors <- lapply(all_authors, function(x){x[x != "X"]})
#'     all_authors <- lapply(all_authors, function(x){x[x != "_"]})
#'     all_authors <- lapply(all_authors, function(x){x[x != "."]})
#'     all_authors <- lapply(all_authors, function(x){x[x != "&."]})
#'     all_authors <- lapply(all_authors, function(x){x[x != "-"]})
#'     all_authors <- lapply(all_authors, function(x){x[x != ""]})
#' 
#'     all_authors_uniques <- sort(unique(unlist(all_authors)))
#'     n <- length(all_authors_uniques)
#'     lcvp_authors <- list()
#'     for (i in 1:n) {
#'       print(n - i)
#'       lcvp_authors[[i]] <- which(sapply(all_authors,
#'                                         function(x){any(x %in% all_authors_uniques[i])}))
#'     }
#' 
#'     names(lcvp_authors) <- all_authors_uniques
#' 
#'     # Update the tab_lcvp table
    # usethis::use_data(tab_lcvp,
    #                   tab_position,
    #                   lcvp_authors,
    #                   lcvp_family,
    #                   lcvp_order,
    #                   lcvp_sps_class,
    #                   overwrite = TRUE,
    #                   ascii = TRUE,
    #                   compress = "xz")
#'   }
#' 
#' 
#' update_LCVP_data()

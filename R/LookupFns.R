#' @title retrieve colnames for an ImmPort Template with associated lookup tables
#'
#' @description Some ImmPort Templates have controlled or preferred values
#'     for certain columns that are found in 'lookup' tables.  This function
#'     returns the colnames that have associated lookup tables.
#'
#' @param ImmPortTemplateName name of the ImmPort Template to check
#' @export
# Helper for showing user which columns have lookups in a template
getLookups <- function(ImmPortTemplateName){
    tmp <- ImmPortTemplates[ ImmPortTemplates$templateName == ImmPortTemplateName, ]
    pvLookups <- tmp$templateColumn[ tmp$pv == TRUE ]
    if (length(pvLookups) > 0){
        message("Columns with Preferred Values:")
        message(paste(pvLookups, collapse = "\n"))
    }
    cvLookups <- tmp$templateColumn[ tmp$cv == TRUE ]
    if (length(cvLookups) > 0){
        message("Columns with Controlled Values:")
        message(paste(cvLookups, collapse = "\n"))
    }
    return(invisible(NULL))
}

#' @title retrieve allowed or preferred values for a given template and column
#'
#' @description Given a template and column, this function returns the values
#'    that are allowed or preferred for this entry.  The return object is a
#'    vector to make searching easier.
#'
#' @param ImmPortTemplateName ImmPort Template Name
#' @param templateColname column name in template
#' @export
# Helper for getting vector of lookup values from template and column names
getLookupValues <- function(ImmPortTemplateName, templateColname) {
    tmp <- ImmPortTemplates[ ImmPortTemplates$templateName == ImmPortTemplateName &
                                 ImmPortTemplates$templateColumn == templateColname, ]
    lkTblNm <- c(tmp$pvTableName, tmp$cvTableName)
    lkTblNm <- lkTblNm[ !is.na(lkTblNm) ]
    lkVals <- ImmPortLookups$name[ImmPortLookups$lookup == lkTblNm]

    if (any(grepl(";", lkVals))) {
        lkVals <- unname(unlist(sapply(lkVals, function(y) strsplit(y, ";"))))
    }

    lkVals
}
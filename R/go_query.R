#' Get Gene Ontology
#'
#' @param accession a character string of a UniProt accession identification code
#' @return a tibble of the gene ontology (GO) terms
#' @export
#' @examples
#' {
#' GO_res <- go_query('Q28021')
#'
#' }

go_query <- function(accession)
{
    request_res <- httr::GET(paste0(QUICK_GO_URL, accession),
                             httr::accept('application/json'))


    parse_result <- httr::content(request_res, 'parsed')


    GO_list <- list()
    for (i in seq_along(parse_result$results)) {
        GO_list[[i]] <- tibble::tibble(
            ID = parse_result$results[[i]]$id,
            GENE_PRODUCT_ID = parse_result$results[[i]]$geneProductId,
            QUALIFIER = parse_result$results[[i]]$qualifier,
            GO_ID = parse_result$results[[i]]$goId,
            GO_NAME = parse_result$results[[i]]$goName,
            GO_EVID = parse_result$results[[i]]$goEvidence,
            GO_ASPECT = parse_result$results[[i]]$goAspect,
            ECO_ID = parse_result$results[[i]]$evidenceCode,
            REF = parse_result$results[[i]]$reference
        )
    }


    GO_res <- dplyr::bind_rows(GO_list)

    return(GO_res)

}

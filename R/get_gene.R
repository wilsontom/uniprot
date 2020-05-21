#' Get Gene
#'
#' @param accession a character string of a UniProt accession identification code
#' @return a character string of the gene ID
#' @export
#' @examples
#' {
#' gene <- get_gene('Q28021')
#'
#' }

get_gene <- function(accession)
{
    request_res <- httr::GET(paste0(BASE_URL, '/proteins/', accession),
                             httr::accept('application/json'))


    parse_result <- httr::content(request_res, 'parsed')

    gene <- parse_result$gene[[1]]$name$value

    return(gene)

}

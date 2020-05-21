#' Get Sequence
#'
#' @param accession a character string of a UniProt accession identification code
#' @return a character vector of protein sequence
#' @export
#' @examples
#' {
#' sequence <- get_sequence('Q28021')
#'
#' }

get_sequence <- function(accession)
{
    request_res <- httr::GET(paste0(BASE_URL, '/proteins/', accession),
                             httr::accept('application/json'))


    parse_result <- httr::content(request_res, 'parsed')

    sequence <- as.vector(unlist(parse_result$sequence$sequence))

    return(sequence)

}

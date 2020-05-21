#' Get Keywords
#'
#' @param accession a character string of a UniProt accession identification code
#' @return a character vector of keywords
#' @export
#' @examples
#' {
#' keywords <- get_keywords('Q28021')
#'
#' }

get_keywords <- function(accession)
{
    request_res <- httr::GET(paste0(BASE_URL, '/proteins/', accession),
                             httr::accept('application/json'))


    parse_result <- httr::content(request_res, 'parsed')

    keywords <- as.vector(unlist(parse_result$keyword))

    return(keywords)

}

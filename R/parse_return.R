#' Title
#'
#' @param return the string returned from chatgpt
#'
#' @return
#' @export
#'
#' @examples
#'
#'
#'
parse_return <-
function(return) {

    if (grepl("gpt-3.5-turbo", Sys.getenv("OPENAI_MODEL", "gpt-3.5-turbo"))) {
    result = trimws(sapply(return$choices, function(x) x$message$content))
  } else {
    result= trimws(sapply(return$choices, function(x) x$text))
  }
  result
}

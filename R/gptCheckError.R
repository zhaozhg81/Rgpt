#' Title
#'
#' @param ErrMessage error message, it is strongly suggested to use raw string
#'library(tidyverse)
#'ErrMessage = r"----( paste the material from the output )----"
#'
#' @return NULL
#' @export
#'
#' @examples
#' > x=matrix( rnorm(20), nrow=4, ncol=5)
#' > y=matrix( rnorm(20), nrow=4, ncol=5)
#' > x%*%y
#' Error in x %*% y : non-conformable arguments
#'
#' Err = r"----( > x=matrix( rnorm(20), nrow=4, ncol=5)
#' > y=matrix( rnorm(20), nrow=4, ncol=5)
#' > x%*%y
#' Error in x %*% y : non-conformable arguments
#' )----"
#'
#' gptCheckError(Err)
#'
#'
gptCheckError <- function(ErrMessage)
{
  history = ""
  inquiry = paste( c( "Check the error message and suggest a correct code:", ErrMessage),
                   collapse ="," )
  Rgpt(inquiry)
  ## result = parse_return(Rgpt_completions(history, inquiry) )


}

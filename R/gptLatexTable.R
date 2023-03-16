#' Title
#'
#' @param nrow the number of rows
#' @param ncol the number of columes
#' @param entries the entries of the table to be produced
#'
#' @return
#' @export
#'
#' @examples
#' x=matrix(rnorm(12), nrow=3,ncol=4)
#' LatexTable(3,4, round( t(x), digits=3 )  )
#' @description this function generates the code for producing a "nrow" x "ncol" table for LaTeX with a given "entries".
#'
gptLatexTable <-
function(nrow, ncol, entries)
{
  history = ""
  inquiry = paste( c( "create a 2x4 table using latex with the entries provided as follows:", entries),
                   collapse ="," )
  result = parse_return(Rgpt_completions(history, inquiry) )

  cat(result)
  print("Thank you.")

}

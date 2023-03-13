#' Title
#'
#' @param inquiry
#'
#' @return
#' @export
#'
#' @examples
#'
#'
#'
Rgpt <-
function(inquiry) {
  history = ""
  result = parse_return(Rgpt_completions(history, inquiry) )

  cat(result)

  history = paste( history, "Previous questions", inquiry, "Previous answer", result )

  print("Do you want to ask a follow-up question? (Y/N)")
  text=readline()

  while( (text=="Y")|(text=="y") )
  {
    print("Enter your follow-up question:\n")
    inquiry = readline()
    result = parse_return(Rgpt_completions( history, inquiry ) )

    cat(result)

    history = paste( history, "Previous questions", inquiry, "Previous answer", result )

    print("Do you want to ask a follow-up question? (Y/N)")
    text=readline()
  }
  print("Thank you.")
}

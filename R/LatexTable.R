LatexTable <-
function(nrow, ncol, entries)
{
  history = ""
  inquiry = paste( c( "create a 2x4 table using latex with the entries provided as follows:", entries), 
                   collapse ="," )
  result = parse_return(Rgpt_completions(history, inquiry) ) 
  
  cat(result)
  print("Thank you.")
  
}

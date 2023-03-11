\name{Rgpt_completions}
\alias{Rgpt_completions}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Rgpt_completions
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
Rgpt_completions(history, prompt, openai_api_key = Sys.getenv("OPENAI_API_KEY"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{history}{
%%     ~~Describe \code{history} here~~
}
  \item{prompt}{
%%     ~~Describe \code{prompt} here~~
}
  \item{openai_api_key}{
%%     ~~Describe \code{openai_api_key} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (history, prompt, openai_api_key = Sys.getenv("OPENAI_API_KEY")) 
{
    prompt2 = prompt
    prompt = paste(history, "Here is a follow-up questions", 
        prompt)
    if (nchar(openai_api_key) == 0) {
        stop("You should first provide `OPENAI_API_KEY`.")
    }
    model <- Sys.getenv("OPENAI_MODEL", "gpt-3.5-turbo")
    params <- list(model = model, max_tokens = as.numeric(Sys.getenv("OPENAI_MAX_TOKENS", 
        256)), temperature = as.numeric(Sys.getenv("OPENAI_TEMPERATURE", 
        1)), top_p = as.numeric(Sys.getenv("OPENAI_TOP_P", 1)), 
        frequency_penalty = as.numeric(Sys.getenv("OPENAI_FREQUENCY_PENALTY", 
            0)), presence_penalty = as.numeric(Sys.getenv("OPENAI_PRESENCE_PENALTY", 
            0)))
    if (as.logical(Sys.getenv("OPENAI_VERBOSE", TRUE))) {
        cat(paste0("\n*** RGPT input:\n\n", prompt2, "\n"))
    }
    if (grepl("gpt-3.5-turbo", model)) {
        return_language <- Sys.getenv("OPENAI_RETURN_LANGUAGE")
        if (nchar(return_language) > 0) {
            return_language <- paste0("You return all your replies in ", 
                return_language, ".")
        }
        messages <- list(list(role = "system", content = paste("Excellent.", 
            return_language)), list(role = "user", content = prompt))
        httr::content(httr::POST("https://api.openai.com/v1/chat/completions", 
            httr::add_headers(Authorization = paste("Bearer", 
                openai_api_key)), httr::content_type_json(), 
            body = jsonlite::toJSON(c(params, list(messages = messages)), 
                auto_unbox = TRUE)))
    }
    else {
        httr::content(httr::POST("https://api.openai.com/v1/completions", 
            httr::add_headers(Authorization = paste("Bearer", 
                openai_api_key)), httr::content_type_json(), 
            body = jsonlite::toJSON(c(params, list(prompt = prompt)), 
                auto_unbox = TRUE)))
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.

#' Title
#'
#' @param history
#' @param prompt
#' @param openai_api_key
#'
#' @return
#' @export
#'
#' @examples
#'
#'
#'
Rgpt_completions <-
function(history, prompt, openai_api_key = Sys.getenv("OPENAI_API_KEY")) {
  prompt2 = prompt
  prompt = paste(history, "Here is a follow-up questions", prompt)

  if (nchar(openai_api_key) == 0) {
    stop("You should first provide `OPENAI_API_KEY`.")
  }
  # See https://platform.openai.com/docs/api-reference/chat
  # and https://beta.openai.com/docs/api-reference/completions/create
  model <- Sys.getenv("OPENAI_MODEL", "gpt-3.5-turbo")
  params <- list(
    model = model,
    max_tokens = as.numeric(Sys.getenv("OPENAI_MAX_TOKENS", 256)),
    temperature = as.numeric(Sys.getenv("OPENAI_TEMPERATURE", 1)),
    top_p = as.numeric(Sys.getenv("OPENAI_TOP_P", 1)),
    frequency_penalty = as.numeric(Sys.getenv("OPENAI_FREQUENCY_PENALTY", 0)),
    presence_penalty = as.numeric(Sys.getenv("OPENAI_PRESENCE_PENALTY", 0))
  )
  if (as.logical(Sys.getenv("OPENAI_VERBOSE", TRUE))) {
    cat(paste0("\n*** RGPT input:\n\n", prompt2, "\n"))
  }
  if (grepl("gpt-3.5-turbo", model)) {
    return_language <- Sys.getenv("OPENAI_RETURN_LANGUAGE")
    if (nchar(return_language) > 0) {
      return_language <- paste0("You return all your replies in ", return_language, ".")
    }
    messages <- list(
      list(
        role = "system",
        content = paste(
          "Excellent.",
          return_language
        )
      ),
      list(role = "user", content = prompt)
    )
    httr::content(httr::POST(
      "https://api.openai.com/v1/chat/completions",
      httr::add_headers("Authorization" = paste("Bearer", openai_api_key)),
      httr::content_type_json(),
      body = jsonlite::toJSON(c(params, list(messages = messages)), auto_unbox = TRUE)
    ))
  } else {
    httr::content(httr::POST(
      "https://api.openai.com/v1/completions",
      httr::add_headers("Authorization" = paste("Bearer", openai_api_key)),
      httr::content_type_json(),
      body = jsonlite::toJSON(c(params, list(prompt = prompt)), auto_unbox = TRUE)
    ))
  }
}

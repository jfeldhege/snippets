
# Setup -------------------------------------------------------------------

#install.packages("gistr")

library(gistr)
library(snippr)

r_snippets_path <- usethis:::rstudio_config_path("snippets", "r.snippets")

# Get snippets from github gists ------------------------------------------

#https://gist.github.com/slopp/27903daaf9fbd41afc73442b600a7618
slopp_snippets <- gist("27903daaf9fbd41afc73442b600a7618")

snips <- snippr:::snippets_parse(slopp_snippets$files$r.snippets$content)

snippet_add(name = "gg", snips$gg, language = "r", path = r_snippets_path)


# Edit snippets file and save to project directory ------------------------

usethis::edit_rstudio_snippets(type = "r")

readLines(r_snippets_path)


# Add snippets from this repo to RStudio ----------------------------------

repo_snippets <- snippr:::snippets_parse(readLines("r.snippets"))

purrr::imap(repo_snippets, function(x, y) {
  snippet_add(name = y, text = x, language = "r", path = r_snippets_path)
})

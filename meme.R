rm(list=ls())
library(tidyverse)

messages <- read_csv('cosa.csv') %>%
  drop_na() %>%
  filter(message != '<Media omitted>')

meme <- function(culprit = NULL, m = messages) {
  if (! is_null(culprit)) {
    m <- m %>% filter(grepl(culprit, person))
  }
  sample_n(m, 1) %>% select(person, message)
}

print(meme())
print(meme('Sharpe'))
print(meme('Spicer'))
print(meme('Baxter'))

hash <- messages %>% filter(grepl('#', message))
print(meme(m = hash))

library(tidyverse)

# this is a function we will use to recode the activ value in our data
recode_activ <- function(activ_value) {
  if (is.na(activ_value)) {
    return(NA_character_)
  } else if (activ_value == 1) {
    return("active")
  } else if (activ_value == 0) {
    return("inactive")
  } else {
    stop("Unknown activ value")
  }
}


# This code below is what's needed to process our dataset
# the beaver datasets are builtin the R programming language
# you do not need to do anything to use the dataset,
# but we will be processing them

bev1 <- beaver1 |>
  dplyr::mutate(
    bev_num = 1,
    hours = time %/% 100 + 24*(day - day[1]) + (time %% 100)/60
  )

bev2 <- beaver2 |>
  dplyr::mutate(
    bev_num = 2,
    hours = time %/% 100 + 24*(day - day[1]) + (time %% 100)/60
  )

bevs <- dplyr::bind_rows(bev1, bev2) |>
  dplyr::mutate(
    activ_char = purrr::map_chr(activ, recode_activ)
  )

# the bev data is what we will use for other parts of the analysis

# there is a table calculation here that ends up being displayed in the final report

activ_char_counts <- bevs |>
  dplyr::count(bev_num, activ_char)


write.csv(bevs, "analysis/output/bevs.csv")

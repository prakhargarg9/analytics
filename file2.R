head(mtcars)

library(dplyr)
mtcars %>% sample_n(5)
mtcars %>% sample_frac(0.3)

#
mtcars %>% arrange(am,mpg)
mtcars %>% select(mpg,am) %>% arrange(mpg) %>% head()


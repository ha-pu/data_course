# This code snippet demonstrates a simple "Hello World!" program in R.
# It prints the message "Hello World!" to the console.
print("Hello World!")

# This code snippet loads the "tidyverse" library, which is a collection of R packages designed for data science.
# The "tidyverse" includes packages like ggplot2, dplyr, tidyr, readr, purrr, and others,
# providing tools for data manipulation, visualization, and analysis.
library(tidyverse)

# This code snippet generates a tibble (data frame) with 1000 rows and 5 columns:
# - var1: Numeric vector with 1000 random values drawn from a standard normal distribution.
# - var2: Numeric vector with 1000 random values drawn from a standard normal distribution.
# - var3: Numeric vector with 1000 random values drawn from a standard normal distribution.
# - var4: Character vector with 1000 random values sampled from the letters 'a', 'b', 'c', and 'd'.
# - var5: Logical vector with 1000 random TRUE or FALSE values.
df <- tibble(
    var1 = rnorm(1000),
    var2 = rnorm(1000),
    var3 = rnorm(1000),
    var4 = sample(letters[1:4], 1000, replace = TRUE),
    var5 = sample(c(TRUE, FALSE), 1000, replace = TRUE)
)

# This code snippet provides a summary of the data frame `df` using the `summary()` function.
# The `summary()` function generates descriptive statistics for each column in the data frame,
# including measures such as minimum, maximum, mean, median, and quartiles for numeric columns,
# and frequency counts for categorical columns.
summary(df)

# This code snippet snippet performs a summary of the `var1` column in the dataframe `df`.
# It calculates the following statistical measures:
# - `min`: The minimum value of `var1`.
# - `q25`: The 25th percentile (first quartile) of `var1`.
# - `mean`: The mean (average) value of `var1`.
# - `median`: The median (50th percentile) of `var1`.
# - `q75`: The 75th percentile (third quartile) of `var1`.
# - `max`: The maximum value of `var1`.
# - `sd`: The standard deviation of `var1`.
# The `%>%` operator is used to pipe the dataframe into the `summarise` function for computation.
df %>%
    summarise(
        min = min(var1),
        q25 = quantile(var1, 0.25),
        mean = mean(var1),
        median = median(var1),
        q75 = quantile(var1, 0.75),
        max = max(var1),
        sd = sd(var1)
    )

# This code snippet performs a summary operation on a data frame `df` using the `dplyr` package.
# It calculates the following summary statistics for the variable `var1`, grouped by `var4`:
# - Minimum value (`min`)
# - First quartile (25th percentile, `q25`)
# - Mean value (`mean`)
# - Median value (`median`)
# - Third quartile (75th percentile, `q75`)
# - Maximum value (`max`)
# - Standard deviation (`sd`)
# The `.by` argument specifies that the summary statistics are computed for each group defined by `var4`.
df %>%
    summarise(
        min = min(var1),
        q25 = quantile(var1, 0.25),
        mean = mean(var1),
        median = median(var1),
        q75 = quantile(var1, 0.75),
        max = max(var1),
        sd = sd(var1),
        .by = var4
    )

# This code snippet calculates the correlation matrix for all numeric columns in a data frame `df`.
# It performs the following steps:
# 1. Uses the `select()` function with `where(is.numeric)` to filter and select only numeric columns from `df`.
# 2. Passes the selected numeric columns to the `cor()` function to compute the correlation matrix.
df %>%
    select(where(is.numeric)) %>%
    cor()

# This code snippet generates a scatter plot using ggplot2.
# - The data frame `df` is piped into the ggplot function.
# - A scatter plot is created with `geom_point`, mapping `var1` to the x-axis and `var2` to the y-axis.
# - The plot is styled with a black-and-white theme using `theme_bw`.
df %>%
    ggplot() +
    geom_point(aes(x = var1, y = var2)) +
    theme_bw()

# This code snippet creates a scatter plot using ggplot2 in R.
# - The data frame `df` is piped into the ggplot function.
# - `geom_point()` is used to add points to the plot.
# - Aesthetic mappings (`aes`) specify:
#     - `x`: the variable `var1` for the x-axis.
#     - `y`: the variable `var2` for the y-axis.
#     - `color`: the variable `var4` to determine the color of the points.
# - The `theme_bw()` function applies a black-and-white theme to the plot.
df %>%
    ggplot() +
    geom_point(aes(x = var1, y = var2, color = var4)) +
    theme_bw()

# This code snippet generates a boxplot using ggplot2 in R. It performs the following steps:
# 1. Uses the pipe operator (%>%) to pass the data frame `df` to ggplot.
# 2. Creates a boxplot with `geom_boxplot`, mapping `var5` to the x-axis and `var1` to the y-axis.
# 3. Applies a black-and-white theme to the plot using `theme_bw`.
df %>%
    ggplot() +
    geom_boxplot(aes(x = var5, y = var1)) +
    theme_bw()

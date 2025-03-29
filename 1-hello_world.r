# 1. Hello World! --------------------------------------------------------------

# This code snippet demonstrates a simple "Hello World!" program in R.
# It prints the message "Hello World!" to the console.
print("Hello World!")

# 2. Load tidyverse library ----------------------------------------------------

# This code snippet loads the "tidyverse" library, which is a collection of R packages designed for data science.
# The "tidyverse" includes packages like ggplot2, dplyr, tidyr, readr, purrr, and others,
# providing tools for data manipulation, visualization, and analysis.
library(tidyverse)

# 3. Basic data generation and summary -----------------------------------------

## 3.1 Generate a data frame with random data ----------------------------------

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

## 3.2 Summary -----------------------------------------------------------------

# This code snippted shows the contents of the df:
# - `slice_head(df, n = 10)`: Displays the first 10 rows of the dataframe `df`.
# - `slice_max(df, var1, n = 10)`: Selects the top 10 rows of `df` based on the maximum values of the variable `var1`.
# - `slice_min(df, var1, n = 10)`: Selects the top 10 rows of `df` based on the minimum values of the variable `var1`.
# - `slice_sample(df, n = 10)`: Randomly selects 10 rows from the dataframe `df`.
# - `slice_tail(df, n = 10)`: Displays the last 10 rows of the dataframe `df`.
slice_head(df, n = 10)
slice_max(df, order_by = var1, n = 10)
slice_min(df, order_by = var1, n = 10)
slice_sample(df, n = 10)
slice_tail(df, n = 10)

# This code snippet provides a summary of the data frame `df` using the `summary()` function.
# The `summary()` function generates descriptive statistics for each column in the data frame,
# including measures such as minimum, maximum, mean, median, and quartiles for numeric columns,
# and frequency counts for categorical columns.
summary(df)

## 3.3 Data visualization ------------------------------------------------------

# This code snippet generates a scatter plot using ggplot2.
# - The data frame `df` is piped into the ggplot function.
# - A scatter plot is created with `geom_point`, mapping `var1` to the x-axis and `var2` to the y-axis.
df %>%
    ggplot() +
    geom_point(aes(x = var1, y = var2))

# This code snippet creates a scatter plot using ggplot2 in R.
# - The data frame `df` is piped into the ggplot function.
# - `geom_point()` is used to add points to the plot.
# - Aesthetic mappings (`aes`) specify:
#     - `x`: the variable `var1` for the x-axis.
#     - `y`: the variable `var2` for the y-axis.
#     - `color`: the variable `var4` to determine the color of the points.
df %>%
    ggplot() +
    geom_point(aes(x = var1, y = var2, color = var4))

# This code snippet generates a boxplot using ggplot2 in R. It performs the following steps:
# 1. Uses the pipe operator (%>%) to pass the data frame `df` to ggplot.
# 2. Creates a boxplot with `geom_boxplot`, mapping `var5` to the x-axis and `var1` to the y-axis.
df %>%
    ggplot() +
    geom_boxplot(aes(x = var5, y = var1))

## 3.4 Custom summaries --------------------------------------------------------

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

# This script calculates the correlation between two variables (var1 and var2)
# from a data frame (df). The `cor` function is used to compute the correlation
# coefficient, which measures the strength and direction of the linear
# relationship between the two variables.
cor(df$var1, df$var2)

# This code snippet calculates the correlation matrix for all numeric columns in a data frame `df`.
# It performs the following steps:
# 1. Uses the `select()` function with `where(is.numeric)` to filter and select only numeric columns from `df`.
# 2. Passes the selected numeric columns to the `cor()` function to compute the correlation matrix.
df %>%
    select(where(is.numeric)) %>%
    cor()


# This code snippet uses the `count` function from the `dplyr` package to count
# the occurrences of unique combinations of the variable `var4` in the dataframe `df`.
df %>%
    count(var4)

# This code snippet uses the `count` function from the `dplyr` package to count
# the occurrences of unique combinations of the variables `var4` and `var5`
# in the dataframe `df`.
df %>%
    count(var4, var5)

## 3.5 Data manipulation -------------------------------------------------------

# This script performs data manipulation on a dataframe `df` using the `dplyr` package.
# It creates two new variables:
# 1. `var6`: The sum of `var1` and `var2`.
# 2. `var7`: The square of `var6` added to `var1`.
# Then, it stores the modified dataframe in a new dataframe `df2`.
df2 <- df %>%
    mutate(var6 = var1 + var2) %>%
    mutate(var7 = var6^2 + var1)

# 4. Exercises -----------------------------------------------------------------

## Try to solve these exercises yourself before looking at the solutions below.

## Exercise 1: Create a new dataframe ------------------------------------------

# 1.1 Create a new dataframe df3 with the following columns:
# - var1: Numeric vector with 2000 random values drawn from a standard normal distribution (rnorm).
# - var2: Numeric vector with 2000 random values drawn from a uniform distribution (runif).
# - var3: Categorical vector with 2000 random values sampled from the letters 'a' to 'h'.
# 1.2 Add a column var4 that represents the product of var1 and var2.
# 1.3 Use the summary() function to explore the dataframe.
# 1.4 Use the summarise() function to calculate the mean and standard deviation of var4.
# 1.5 Use the summarise() function to calculate the mean and standard deviation of var4 grouped by var3.

## Exercise 2: Visualize the data ----------------------------------------------

# Use the dataframe df3 created in Exercise 1 to create the following visualizations:
# 2.1 Create a scatter plot of var1 vs var2.
# 2.2 Create a scatter plot of var1 vs var2, colored by var3.
# 2.3 Create a boxplot of var4 grouped by var3.
# 2.4 Create a histogram of var4 (geom_histogram).

## Exercise 3: Data descriptives -----------------------------------------------

# Use the dataframe df3 created in Exercise 1 for the following tasks:
# 3.1 Get the maximum value of var4.
# 3.2 Get the minimum value of var1.
# 3.3 Get the median value of var2.
# 3.4 Get the correlation between var1 and var2.
# 3.5 Get the correlation matrix for all numeric columns in df3.
# 3.6 Count the number of unique values in var3.

## Exercise 4: Data slicing ----------------------------------------------------

# Use the dataframe df3 created in Exercise 1 for the following tasks:
# 4.1 Get the first 10 rows of df3.
# 4.2 Get the last 10 rows of df3.
# 4.3 Get a random sample of 10 rows from df3.
# 4.4 Get the top 10 rows of df3 based on the maximum values of var1.
# 4.5 Get the bottom 10 rows of df3 based on the minimum values of var4.

## Solution 1: Create a new dataframe ------------------------------------------

# 1.1
df3 <- tibble(
    var1 = rnorm(2000),
    var2 = runif(2000),
    var3 = sample(letters[1:8], 2000, replace = TRUE)
)

# 1.2
df3 <- df3 %>%
    mutate(var4 = var1 * var2)

# 1.3
summary(df3)

# 1.4
df3 %>%
    summarise(
        mean = mean(var4),
        sd = sd(var4)
    )

# 1.5
df3 %>%
    summarise(
        mean = mean(var4),
        sd = sd(var4),
        .by = var3
    )

## Solution 2: Visualize the data ----------------------------------------------

# 2.1
df3 %>%
    ggplot() +
    geom_point(aes(x = var1, y = var2))

# 2.2
df3 %>%
    ggplot() +
    geom_point(aes(x = var1, y = var2, color = var3))

# 2.3
df3 %>%
    ggplot() +
    geom_boxplot(aes(x = var3, y = var4))

# 2.4
df3 %>%
    ggplot() +
    geom_histogram(aes(x = var4))

## Solution 3: Data descriptives -----------------------------------------------

# 3.1
max(df3$var4)
df3 %>%
    summarise(max = max(var4))

# 3.2
min(df3$var1)
df3 %>%
    summarise(min = min(var1))

# 3.3
median(df3$var2)
df3 %>%
    summarise(median = median(var2))

# 3.4
cor(df3$var1, df3$var2)
df3 %>%
    select(var1, var2) %>%
    cor()

# 3.5
df3 %>%
    select(where(is.numeric)) %>%
    cor()

# 3.6
df3 %>%
    count(var3)

## Solution 4: Data slicing ----------------------------------------------------

# 4.1
df3 %>%
    slice_head(n = 10)

# 4.2
df3 %>%
    slice_tail(n = 10)

# 4.3
df3 %>%
    slice_sample(n = 10)

# 4.4
df3 %>%
    slice_max(order_by = var1, n = 10)

# 4.5
df3 %>%
    slice_min(order_by = var4, n = 10)

# data_course

**EIBA Summer School 2025: AI in Quantitative Methods in International Business**

This repository contains a collection of interactive R Markdown lessons designed
to teach data-related topics in an accessible, hands-on way. By using Binder,
educators and learners can easily launch a pre-built, containerized environment
(including RStudio) right from the browser.

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ha-pu/data_course/HEAD?urlpath=rstudio)

## Contents

The repository is organized into the following files:

| **Lesson File**            | **Description**                                                                      |
|----------------------------|--------------------------------------------------------------------------------------|
| `4-machine_learning.rmd`   | Introduces essential machine learning concepts and their practical applications.     |
| `6-ml_exercise.rmd`        | Exerise in machine learning optimization.                                            |

The repository is configured with:

+ **`environment.yml`**: Lists the necessary dependencies to set up the learning
  environment.
+ **`runtime.txt`**: Specifies the runtime version, ensuring the container runs
  with the correct configuration.

## Getting Started

+ **Launch the Environment:** Click the Binder badge at the top of this page to
  initialize your interactive R environment.
+ **Explore the Lessons:** Once the environment is up, open any of the R
  Markdown files (.rmd) to begin working through the material interactively.

## Running the Code Locally

To run the code locally, you must first install the relevant packages:

```
install.packages(
  c(
    "caret", "caretEnsemble", "gbm", "glmnet", "randomForest", "tidyverse",
    "xgboost"
  )
)
```

---
output:
  pdf_document: default
  html_document: default
---

# JUN

<!-- badges: start -->
[![Travis build status](https://travis-ci.com/jr2339/JUN.svg?branch=master)](https://travis-ci.com/jr2339/JUN)
<!-- badges: end -->

The goal of JUN is to provides functionality for CS599 Project.

## Installation

You can install the released version of JUN from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("JUN")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(JUN)
## basic example code
KMEANS(data = as.matrix(iris[,1:4]), k =3)

```


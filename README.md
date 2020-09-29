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
## basic KMEANS example code
KMEANS(data = as.matrix(iris[,1:4]), k =3)
##The example result of KEMANS is
$cluster
[1] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 1 3 1 3 1 3 3
[58] 3 1 3 3 3 3 3 3 3 3 3 3 3 3 3 1 3 3 3 1 1 3 3 3 3 3 1 3 3 1 3 3 3 3 3 3 3 3 3 3 3 3 3 1 1 1 1 1 1 3 1 1 1 1 1 1 [115] 3 1 1 1 1 1 1 3 1 1 1 1 1 3 1 1 1 1 1 1 1 1 1 1 3 1 1 1 1 1 1 1 1 1 1 1

$tot.withinss
[1] 84.07368

$betweenss
[1] 597.2969

## basic KMEANS example code
HCLUST(data = as.matrix(iris[,1:4]))


```


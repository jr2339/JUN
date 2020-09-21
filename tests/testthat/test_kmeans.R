context(" Just testing Kmeans function")


test_that("Whether keans function give us the reasonable output",{
   df = as.matrix(iris[,1:4])

  expect_less_than(abs(KMEANS(df,40)$tot.withinss - kmeans(df,40)$tot.withinss),10)
})

#' @title Hierarchical Clustering Method
#'
#' @param data.matrix The data need to be analyzed
#'
#' @return The cluster index matrix
#' @export
#'
#' @importFrom stats dist
#' @examples
#' HCLUST(data = as.matrix(iris[,1:4]))
HCLUST <- function(data.matrix)
{

  data.matrix=as.matrix(data.matrix)
  Distcance.Matrix = dist(data.matrix)

  if(!is.matrix(Distcance.Matrix)){
    Distcance.Matrix = as.matrix(Distcance.Matrix)

  }
  Nrows = nrow(Distcance.Matrix)
  diag(Distcance.Matrix)=Inf
  # Tracks group index
  group_index = -(1:Nrows)
  # hclust matrix result output
  output = matrix(0,nrow=Nrows-1, ncol=2)
  # hclust height output
  height_output = rep(0,Nrows-1)
  for(j in seq(1,Nrows-1))
  {
    # Find the minimum distance over all points in that group
    height_output[j] = min(Distcance.Matrix)
    # get exactly a 0 value.
    i = which(Distcance.Matrix - height_output[j] == 0, arr.ind=TRUE)
    # get more than one, and  merge one pair.
    i = i[1,,drop=FALSE]
    p = group_index[i]
    #to order each m[j,] pair as follows:
    p = p[order(p)]
    output[j,] = p
    # Agglomerate this pair and all previous groups they belong to
    # into the current jth group:
    grp = c(i, which(group_index %in% group_index[i[1,group_index[i]>0]]))
    group_index[grp] = j
    # Concoct replacement distances that consolidate our pair using `method`:
    r = apply(Distcance.Matrix[i,],2,"min")
    # Move on to the next minimum distance, excluding current one by modifying
    # the distance matrix:
    Distcance.Matrix[min(i),] = Distcance.Matrix[,min(i)] = r
    Distcance.Matrix[min(i),min(i)]        = Inf
    Distcance.Matrix[max(i),] = Distcance.Matrix[,max(i)] = Inf
  }
  # Return something similar to the output from hclust.

  structure(list(merge = output, height = height_output))
}

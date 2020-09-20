#' @title KMEANS function
#'
#' @param data The name of the data need to be anlyzied
#' @param k   The number of clusters
#'
#' @return the clusters
#' @export
#'
#' @importFrom stats dist
#' @examples
#' KMEANS(data = as.matrix(iris[,1:4]), k =3)


KMEANS<-function(data=NA,k=NA){

  #we total have two parameters in the function
  # if(is.na(data) || is.na(k)){
  #   stop("You need to input valid parameters!!")
  # }

  #get the number of rows
  rows<-nrow(data)
  #get the number of columns
  cols<-ncol(data)

  #store the distance within the cluster
  within<-matrix(0,nrow=k,ncol=1)

  #store the distance between the cluster
  between<-0

  #the first is the cluster Index
  #the second data is the distance
  indexMatrix<-matrix(0,nrow=rows,ncol=2)

  #initialize the centers
  centers<-matrix(0,nrow=k,ncol=cols)
  #generate k random number
  randSeveralInteger<-as.vector(sample(1:rows,size=k))
  #assign the value to the centers

  for(i in 1:k){
    indexMatrix[randSeveralInteger[i],1]<-i
    centers[i,]<-data[randSeveralInteger[i],]
    centers<-matrix(centers,k,cols)
  }

  changeFlag=TRUE
  while(changeFlag){
    changeFlag=FALSE

    for(i in 1:rows){
      #assume the initial Distance is infinite
      initialDistance<- Inf

      previousCluster<-indexMatrix[i,1]

      for(j in 1:k){

        currentDistance<-(sum((data[i,]-centers[j,])^2))^0.5

        if(currentDistance < initialDistance){
          initialDistance<-currentDistance
          #then this data is belong to j cluster
          indexMatrix[i,1]<-j
          #update the distance
          indexMatrix[i,2]<-currentDistance
        }

      }
      if(previousCluster!=indexMatrix[i,1]){
        changed=TRUE
      }

    }

    for(m in 1:k){
      clusterMatrix<-data[indexMatrix[,1]==m,]
      clusterMatrix<-as.matrix(clusterMatrix)
      if(nrow(clusterMatrix)>0){
        centers[m,]<-colMeans(clusterMatrix)
      }
      else{
        centers[m,]<-centers[m,]
      }
    }

  }

  ss<-function(x) sum(scale(x,scale=FALSE)^2)
  between<-ss(centers[indexMatrix[,1],])
  within<-sapply(split(as.data.frame(data),indexMatrix[,1]),ss)
  twithin<-sum(within)
  result<-list(cluster=indexMatrix[,1],tot.withinss=twithin,betweenss=between)
  return(result)
}





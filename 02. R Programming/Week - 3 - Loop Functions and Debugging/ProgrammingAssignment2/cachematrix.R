## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inverse_ <- NULL
  set <- function(y) {
    x <<- y
    inverse_ <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inverse_ <<- inverse
  getinverse <- function() {
    inver<-getinverse(x)
    inver%*%x
  }
  list(set=set, get=get, setinverse = setinverse, getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inverse_ <- x$getinverse()
  if(!is.null(inverse_)){
    message("Getting Cached Inverse")
    return(inverse_)
  }
  data <- x$get()
  inverse_ <- solve(data,...)
  x$setinverse(inverse_)
  inverse_
}

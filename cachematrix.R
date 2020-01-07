## Put comments here that give an overall description of what your
## functions do
## write functions "makeCacheMatrix" and "cacheSolve" that cache the inverse of a matrix
## Inverse of Matrixs can be cached using the following  functions below 1) makeCacheMatrix and 2) cacheSolve
## How to test? Run the following
# > mvar <- matrix(rnorm(20),4,4)
# > mcm <- makeCacheMatrix(mvar)
# > cacheSolve(mcm)

## Write a short comment describing this function
# creates a special "matrix" object that can cache its inverse
# Create a list function to get and set value of the matrix
# Create a list function to get and set value of the inverse matrix
makeCacheMatrix  <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Write a short comment describing this function
## function which computes the inverse of the special "matrix" 

# Return if inverse already been computed else 
# computes the inverse and sets the value in the cache using setinverse function.


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
      invX <- x$getinv()
      if(!is.null(invX)) {
        message("Reesults: Retrive Cached")
        return(invX)
      }
      data <- x$get()
      invY <- solve(data, ...)
      x$setinv(invY)
      invY
}


# results
# > mvar <- matrix(rnorm(20),4,4)
# > mcm <- makeCacheMatrix(mvar)
# > cacheSolve(mcm)
# [,1]        [,2]       [,3]        [,4]
# [1,]  0.07294806 -0.01182102 -0.3214743 -0.22334935
# [2,] -0.18269401 -0.23029434 -0.1489430 -0.05983888
# [3,]  0.21455785 -0.48011339  0.1319840 -0.22187898
# [4,]  0.25665831 -0.58911705 -0.9349300  0.84298016

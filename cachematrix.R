## Put comments here that give an overall description of what your
## functions do

## Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix rather than compute it repeatedly. 
## These pair of functions that cache the inverse of a matrix.

original_matrix = matrix( 
  c(4, 3, 3, 2), 
  nrow=2, 
  ncol=2) 


## Write a short comment describing this function
## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y #define the variable so it is accessible outside this function environment
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## Write a short comment describing this function
## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.
## Returns a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
  
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
  
}

message("original matrix")
print(original_matrix)

special_cachematrix <- makeCacheMatrix(original_matrix)

message("call first time")
reversed_matrix <- cacheSolve(special_cachematrix)
print(reversed_matrix)

message("call second time (should come from cache)")
reversed_matrix <- cacheSolve(special_cachematrix)
print(reversed_matrix)

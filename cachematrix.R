makeCacheMatrix <- function(x = matrix()) {
# This function transforms the input matrix in an object, encapsulating two 
# variables (the main matrix 'x' and its inverse 's') and four methods to handle
# these values
      # Creating auxiliary variable (to store the inverse). As this function  
      # does not calculate the inverse, but only creates the variable to store
      # (cache) it, 'i' is created as NULL. 
      i <- NULL
      # Method $set, used to apply a new value to the main variable 'x' of the 
      # object (the main matrix).
      set <- function(y) {
            x <<- y
            s <<- NULL
      }
      # Method $get, used to retrieve the main value of the object (the main 
      # matrix itself).
      get <- function() x
      # Method $setSolve, used to store some value to the auxiliary variable 'i'
      # (the cache)
      setSolve <- function(inverse) i <<- inverse
      # Method $getSolve, used to retrieve the cached value stored in the 
      # auxiliary variable 'i'
      getSolve <- function() s
      # Listing all the above functions to return them as methods of the object
      list(set = set, get = get,
           setsolve = setsolve,
           getsolve = getsolve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
      s <- x$getsolve()
      if(!is.null(s)) {
            message("getting cached data")
            return(s)
      }
      matrix <- x$get()
      s <- solve(matrix, ...)
      x$setsolve(s)
      s
}

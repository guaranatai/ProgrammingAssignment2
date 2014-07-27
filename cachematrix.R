makeCacheMatrix <- function(x = matrix()) {
# This function transforms the input matrix in an object, encapsulating two 
# variables (the main matrix 'x' and its inverse 's') and four methods to handle
# these values
      
      # Creating auxiliary variable (to store the inverse). As this function  
      # does not calculate the inverse, but only creates the variable to store
      # (cache) it, 'i' is created as NULL. 
      i <- NULL
      
      # Method '$set', used to apply a new value to the main variable 'x' of the 
      # object (the main matrix).
      set <- function(y) {
            x <<- y
            s <<- NULL
      }
      
      # Method '$get', used to retrieve the main value of the object (the main 
      # matrix itself).
      get <- function() x
      
      # Method '$setSolve', used to store some value to the auxiliary variable 
      # 'i' (the cache)
      setSolve <- function(inverse) i <<- inverse
      
      # Method '$getSolve', used to retrieve the cached value stored in the 
      # auxiliary variable 'i'
      getSolve <- function() s
      
      # Listing all the above functions to return them as methods of the object
      list(set = set, get = get,
           setsolve = setsolve,
           getsolve = getsolve)
}


cacheSolve <- function(x, ...) {
# This function calculates the inverse of a given matrix, contained on the main
# variable of an object previously created by the 'makeCacheMatrix(x)' function.
      # First, checking if the inverse of the matrix has already been calculated
      # and stored (cached) in the auxiliary variable 'i' of the matrix object. 
      i <- x$getSolve()                         # Getting 'i' value
      if(!is.null(i)) {                         # Checking if it is NULL
            message("getting cached data")      # Warning
            return(i)                           # Returns cached value and
                                                # finish execution
      }
      
      # If the inverse has not been calculated yet, retrieve the main variable 
      # (the matrix itself)
      matrix <- x$get()
      # Do the calculation
      i <- solve(matrix, ...)
      # Stores the value to the auxiliary variable (cache) of the object.
      x$setSolve(i)
      # Returns the calculation result
      i
}

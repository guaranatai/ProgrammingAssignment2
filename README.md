### Usage example

      > source('cachematrix.R')
      > matrix <- matrix(c(1,3,5,7,9,2,4,6,8), 3, 3)
      > matrix
           [,1] [,2] [,3]
      [1,]    1    7    4
      [2,]    3    9    6
      [3,]    5    2    8
      > superMatrix <- makeCacheMatrix(matrix)
      > superMatrix$get()
            [,1] [,2] [,3]
      [1,]    1    7    4
      [2,]    3    9    6
      [3,]    5    2    8
      > superMatrix$getSolve()
      NULL
      > inverse <- cacheSolve(superMatrix)
      > inverse
            [,1]       [,2]       [,3]
      [1,] -1.1111111  0.8888889 -0.1111111
      [2,] -0.1111111  0.2222222 -0.1111111
      [3,]  0.7222222 -0.6111111  0.2222222
      > superMatrix$getSolve()
            [,1]       [,2]       [,3]
      [1,] -1.1111111  0.8888889 -0.1111111
      [2,] -0.1111111  0.2222222 -0.1111111
      [3,]  0.7222222 -0.6111111  0.2222222
      > inverse <- cacheSolve(superMatrix)
      getting cached data
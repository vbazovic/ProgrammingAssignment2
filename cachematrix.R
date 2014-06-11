# Functions that cache the inverse of a matrix because 
# to reduce cost of a repeated computation

# test:
# c=rbind(c(1, -1/4), c(-1/4, 1))
# d<-cacheSolve(c)
# d<-cacheSolve(c)
# c%*%d
# c<-c+1
# d<-cacheSolved(c)
# d<-cacheSolve(c)

# expected output:
# [1] calculated
# [1] cached
# [,1] [,2]
# [1,]    1    0
# [2,]    0    1
# [1] calculated
# [1] cached


# return a named list that contains a matrix and its inversed matrix

makeCacheMatrix <- function(x = matrix()) {
  # assume that the matrix id invertible def. http://en.wikipedia.org/wiki/Invertible_matrix and solve it
  # return as list holding x and its inverse
  list(matrix=x, inverse=solve(x))
}


# function uses solve only if x is not allready cached 

cacheSolve <- function(x, ...) {
  # if global list cached_x doesn't exists OR x is not identical with cached matrix we must (re)calculate it
  
  if (!exists("cached_x") || !identical(cached_x$matrix,x)) {
    # let calculate inverse and then return it
    
    cached_x <<- makeCacheMatrix(x)  # make a global variable with << (globals are quick solution) 
    print("calculated") # debug printing
    return (cached_x$inverse)
    
  } else {
    # just return cached value
    
    print("cached") # debug printing
    return (cached_x$inverse)
  } 
  
}

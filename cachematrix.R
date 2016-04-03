##This pair of functions cache the inverse of a matrix

#This function creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
i <- NULL
# sets new value for x and sets i to NULL
set <- function(y) {
x <<- y
i <<- NULL
}
get <- function() x
# set new inverted matrix
setinvert <- function(invert) i <<- invert
# get previous inverted matrix
getinvert <- function() i
# list of defined functions
list(set = set, get = get, setinvert = setinvert, getinvert = getinvert)
}


# This function saves the inverse matrix, if it doesn't exist yet
cacheSolve <- function(x, ...) {
i <- x$getinvert()
# if the value of i is not NULL, then the function return the message "getting cached matrix" and the value of i
if(!is.null(i)) {                            
message("getting cached matrix")
return(i)                                    
}
# if i is NULL, this loads, inverts and saves the inverted matrix
data <- x$get()
i <- solve(data, ...)
x$setinvert(i)
i
}

# To test, if this code actually works, use these commands
# m <- matrix(22:25,2,2)
# x=makeCacheMatrix(m)
# cacheSolve(x)

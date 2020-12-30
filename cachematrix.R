## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) { #x is initiate here as an object
        inv <- NULL # intiate inv
        set <- function(y) {
                x <<- y # function which assign value to x
                inv <<- NULL # same function "clean" inv is there are leftovers
        }
        get <- function() x # function to access x
        setinv <- function(solve) inv <<- solve # takes value from cacheSolve
        getinv <- function() inv # function to access inv
        list(set = set, get = get, # this saves functions as objects to be used
             setinv = setinv,
             getinv = getinv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        inv <- x$getinv() # tries to get the inv matrix if already there
        if(!is.null(inv)) { # if not NULL retrieve the stored matrix
                message("getting cached data")
                return(inv) 
        }
        data <- x$get() # if not there takes the vector
        inv <- solve(data, ...) # use the vector to calculate inv matrix
        x$setinv(inv) # set inv matrix in object create from makeCacheMatrix
        inv # return inv matrix
}

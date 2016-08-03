
## These two functions enable more efficient computation of the inverse of an invertible matrix by caching the matrix and its inverse so that computation does not need to be repeated if it has already been computed and cached.

##This function creates a special "matrix" object that caches the matrix, and includes functions to get the matrix or the inverse of the matrix. 
makeCacheMatrix <- function(x = matrix()) {
inv<-NULL
set<-function(y){
    x<<-y
    inv<<-NULL
}
get<-function() x
setinv<-function(solve) inv<<-solve
getinv<-function () inv
list(set=set, get=get, setinv=setinv, getinv=getinv)
}
   
## This function can retrieve the cached inverse from an object that is the output of the "makeCacheMatrix" function

cacheSolve <- function(x,...) {
    inv<-x$getinv()
       if(!is.null(inv)){
        message("getting cached data")
        return(inv)
    }
    mat <- x$get()
    inv <- solve(mat)
    x$setinv(inv)
    inv}


## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## The following function takes as an argument an invertible matrix, or by default initialzes an empty matrix and creates a "special Vector"
## which is essentially a list containing various functions that operate on matrix and simulate a "Cache".

## It contains the following functions

## 1) set_matrix >> This function initializes the value of a matrix
## 2) get_matrix >> This function returns the value of the matrix initialized by set_matrix()
## 3) set_inv >> This function initializes the inv_matrix variable( by default = NULL), and receives as an argument the inverse of a matrix
## 4) get_inv >> This function return the value initialized by set_inv()

makeCacheMatrix <- function(x = matrix()) {
    inv_matrix <- NULL
    
    set_matrix <- function(m) 
                  {
                      x <<- m
                      inv_matrix <<- NULL
                  }
    
    get_matrix <- function() {x}
    
    set_inv <- function(inv) {inv_matrix <- inv}
    
    get_inv <- function() {inv_matrix}
    
    list(set = set_matrix, get = get_matrix , set_inv = set_inv, get_inv = get_inv)
    
}


## Write a short comment describing this function

## The following function takes as an argument the list/special vector created by the previous function and 
## returns the inverse of the matrix , by using the cahe(if not null) or stores the value in the cahe for 
## future uses.

cacheSolve <- function(x, ...) {
        
        val <- x$get_inv()
        
        if(!is.null(val))
        {
            print("Fetching Cache")
            return(val)
        }
        
        m <- x$get()
        inv <- solve(m)
        x$set_inv(inv)
        inv
}

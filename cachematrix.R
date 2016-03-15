## Usage:
## Step 1: Load the R program: source("cachematrix.R")
## Step 2: Create a square matrix: mtrx <- rbind(c(1, -1/4), c(-1/4, 1)) 
## Step 3: Create matrix cache functions: cachefuncs <- makeCacheMatrix(mtrx)
## Step 4: Get inverted matrix: cacheSolve(cachefuncs)
## Step 5: Get inverted matrix from cache: cacheSolve(cachefuncs)

makeCacheMatrix <- function(x = matrix()) {
	# Initialize cache to NULL
	cache <- NULL

	# create the matrix in the working environment
	set <- function(y) {
		x <<- y
		cache <<- NULL
	}

        # get the value of the matrix
        get <- function() x

        # invert the matrix and store in cache
        setMatrix <- function(inverse) cache <<- inverse

        # get the inverted matrix from cache
        getInverse <- function() cache

        # return the created functions to the working environment
        list(set = set, get = get,
             setMatrix = setMatrix,
             getInverse = getInverse)
}


## cacheSolve calcluates the inverse of the matrix created in makeCacheMatrix. Returns value from cache.
## If inverted matrix doesn't exists in cache; builds inverse matrix using solve and stores value in cahce

## is stored in cache
cacheSolve <- function(x, ...) {
        ## Get the inverse matrix from cache
        cache <- x$getInverse()

        # return inverted matrix from cache if it exists
        if (!is.null(cache)) {
                message("getting cached data")

                # display matrix in console
                cache
        }

        # create matrix since it does not exist
        matrix <- x$get()

        #get inverted matrix using solve 
	cache <- solve(matrix, ...)

        # set inverted matrix in cache
        x$setMatrix(cache)


        # display matrix in console
        cache
}

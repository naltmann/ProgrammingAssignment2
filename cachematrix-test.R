## This code runs some basic output tests of the makeCacheMatrix and cachleSolve functions

source('~/GitHub/ProgrammingAssignment2/cachematrix.R')

original_matrix = matrix( 
  c(4, 3, 3, 2), 
  nrow=2, 
  ncol=2) 

message("original matrix")
print(original_matrix)

special_cachematrix <- makeCacheMatrix(original_matrix)

message("call first time")
reversed_matrix <- cacheSolve(special_cachematrix)
print(reversed_matrix)

message("call second time (should come from cache)")
reversed_matrix <- cacheSolve(special_cachematrix)
print(reversed_matrix)
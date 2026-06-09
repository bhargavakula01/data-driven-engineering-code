# This Julia script will be used to learn how to perform condition number analysis

using Pkg
Pkg.instantiate()
Pkg.add("LinearAlgebra")

using LinearAlgebra

#initializing a matrix 'A':
A = [1 2 3; 4 1 6; 7 8 1]

result = cond(A, 2)

println("Result $result")

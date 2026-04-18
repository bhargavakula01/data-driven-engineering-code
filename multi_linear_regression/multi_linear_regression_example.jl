# Example of Multi-Linear Regression using Julia


import Pkg
Pkg.add("CSV")
Pkg.add("DataFrames")
Pkg.add("LinearAlgebra")

using CSV, DataFrames, LinearAlgebra

# loading the 'hald' dataset
hald_df = CSV.read("./multi_linear_regression/data/hald.csv", DataFrame)

println(hald_df)

hald_ingredients_df = Matrix(hald_df[:, 1:4]) #matrix A in Ax = b
hald_heat_df = hald_df[:, 5] # matrix b in Ax = b

println("Ingredients: $hald_ingredients_df")
println("Heat: $hald_heat_df")

U, S, V = svd(hald_ingredients_df) #performing an economic SVD by default when matrix isn't square
S = Diagonal(S)

x_approx = V*inv(S)*transpose(U)*hald_heat_df # x = VΣ^{-1}U^{*}b

println("x: $x_approx") # This is a vector --> A^{-1}b = x, where A is a matrix and b is a vector

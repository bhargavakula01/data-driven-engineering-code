# Example of Multi-Linear Regression using Julia


import Pkg
Pkg.add("CSV")
Pkg.add("DataFrames")
Pkg.add("LinearAlgebra")

using CSV, DataFrames, LinearAlgebra

# loading the 'hald' dataset
hald_df = CSV.read("data/hald.csv", DataFrame)

println(hald_df)

hald_ingredients_df = Matrix(hald_df[:, 1:4])
hald_heat_df = hald_df[:, 5]

println("Ingredients: $hald_ingredients_df")
println("Heat: $hald_heat_df")

U, S, V = svd(hald_ingredients_df) #performing an economic SVD by default when matrix isn't square
S = Diagonal(S)

x_approx = V*inv(S)*transpose(U)*hald_heat_df

println("x: $x_approx") # This is a vector --> A^{-1}b = x, where A is a matrix and b is a vector

# Ovarian cancer example (Julia)

using Pkg, LinearAlgebra, Random, Plots, Statistics, CSV, DataFrames


# importing the CSV:
raw_data = CSV.read("data/ovariancancer.csv", DataFrame)

numerical_data = raw_data[:, 1:end-1]

U, S, V = svd(numerical_data)
S_diagonal = Diagonal(S)

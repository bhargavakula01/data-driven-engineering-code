# Example of Multi-Linear Regression using Julia


import Pkg
Pkg.add("RDatasets")
Pkg.add("DataFrames")

using RDatasets, DataFrames

# loading the 'hald' dataset
hald = dataset("datasets", "Hald")


# This julia file will provide an example of Principle Component Analysis (Noisy Gaussian Data Example)

using Pkg
Pkg.add("LinearAlgebra")
Pkg.add("Random")
Pkg.add("Plots")
Pkg.add("Statistics")

using LinearAlgebra, Random, Plots, Statistics

###GENERATING THE NOISY DATA:

σ = [2; 0.5] # principle axis
x_c = [2; 1] # center of data

#need to apply rotation of the data (using the rotation matrix)
π = pi
θ = π/3
R = [cos(θ) -sin(θ); sin(θ) cos(θ)]

npts = 10000 #number of data points

X = rand(Float64,(npts, 2))*Diagonal(σ)*R + ones(npts, 2)*Diagonal(x_c)

#plotting
scatter(X[:,1], X[:, 2])

###COMPUTE PRINCIPLE COMPONENTS USING PCA & PLOT CONFIDENCE INTERVALS:
x_avg = mean(X, dims=1)

#getting mean subtracted data (B)
B = X - ones(npts, 1)*x_avg

U, S, V = svd(B/sqrt(npts))

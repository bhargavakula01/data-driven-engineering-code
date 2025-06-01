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

#need to apply rotation of the data (using the rotation matrix):
π = pi
θ = π/3
#Some information regarding rotation matrices 
#([cos(θ) sin(θ); -sin(θ) cos(θ)]) rotates clockwise by θ. 
#([cos(θ) -sin(θ); sin(θ) cos(θ)]) rotates counter-clockwise by θ
R = [cos(θ) sin(θ); -sin(θ) cos(θ)] 

npts = 1000 #number of data points

#The 'randn(npts, 2)*Diagonal(σ)*R' applies the rotation of the data 
#and 'ones(npts, 2)*Diagonal(x_c)' adds the centering of the data at (2,1)
X = randn(npts, 2)*Diagonal(σ)*R + ones(npts, 2)*Diagonal(x_c) #(10000,2) matrix
scatter(X[:,1], X[:, 2])
###COMPUTE PRINCIPLE COMPONENTS USING PCA & PLOT CONFIDENCE INTERVALS:
x_avg = mean(X, dims=1)

#getting mean subtracted data (B):
B = X - ones(npts, 1)*x_avg

#computing the SVD:
U, S, V = svd(B/sqrt(npts))
S_diagonal = Diagonal(S)

θ = (0:0.01:1)*2*π
#x = rcos(θ) & y = rsin(θ)
X_std = [cos.(θ) sin.(θ)]*S_diagonal*V'

#plotting:
plot!(x_avg[1] .+ X_std[:,1], x_avg[2] .+ X_std[:,2], color=:red, linestyle=:solid)
plot!(x_avg[1] .+ 2*X_std[:,1], x_avg[2] .+ 2*X_std[:,2], color=:red, linestyle=:solid)
plot!(x_avg[1] .+ 3*X_std[:,1], x_avg[2] .+ 3*X_std[:,2], color=:red, linestyle=:solid)
savefig("noisy_gaussian_data_example.png")

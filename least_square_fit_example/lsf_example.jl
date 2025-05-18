# This julia file will contain the code for performing least square fit of some noisy data

using Pkg

Pkg.add("LinearAlgebra")
Pkg.add("Plots")
using LinearAlgebra, Plots

# Generate noisy data
x = 3
a = -2:0.25:2
a = hcat(a)
b = a*x + 1*randn(size(a))

# Compute least squares using the SVD:
U,S,V = svd(a, full=false)
S_diagonal = Diagonal(S)

x_approx = V*inv(S_diagonal)*transpose(U)*b
println("x: $x_approx") # Leads to a 1x1 matrix because both a and b are vectors

plot(a, a*x, label="no noise")
plot!(a, b, label="with noise")
plot!(a, a*x_approx, label= "1D Regression")
savefig("Data_with_and_without_noise.png")

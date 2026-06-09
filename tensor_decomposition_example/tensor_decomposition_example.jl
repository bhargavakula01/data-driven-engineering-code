# Tensor Decomposition Example [CODE DOESN'T WORK B/C NO PARAFAC FUNCTION IN JULIA!]

using Pkg
# Pkg.add("TensorDecompositions")
Pkg.add("NTFk")

using NTFk #TensorDecompositions


# create the tensor data
x = -5:0.1:5
y = -6:0.1:6
t = 0:0.1:10*pi


X = reshape(x, :, 1, 1)
Y = reshape(y, 1, :, 1)
T = reshape(t, 1, 1, :)
println(size(X))
println(size(Y))
println(size(T))

A = @. exp(-1*X^2 - 0.5*Y^2).*cos(2*T) + sech(X)*tanh(X)*exp(-0.2*Y^2)*sin(T)

# Creating factor matrices with rank R = 2
rnk = 2
mdl = parafac2(A, rnk)

A = mdl.factors[1]
B = mdl.factors[2]
C = mdl.factors[3]

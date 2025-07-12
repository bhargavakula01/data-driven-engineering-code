# Ovarian cancer example (Julia)

using Pkg, LinearAlgebra, Random, Plots, Statistics, CSV, DataFrames

# importing the CSV:
raw_data = CSV.read("data/ovariancancer.csv", DataFrame)

σ = Matrix(raw_data[:, 1:end-1])
group = raw_data[:,end]

U, S, V = svd(σ)
S_diagonal = Diagonal(S)

#Retrieving pts and plotting:
plt = scatter3d()
for i = 1:size(σ, 1)
    x = transpose(V[:, 1]) * σ[i, :]
    y = transpose(V[:, 2]) * σ[i, :]
    z = transpose(V[:, 3]) * σ[i, :]

    if(group[i] == "Cancer")
        scatter3d!([x], [y], [z], marker=:star5)
    else
        scatter3d!([x], [y], [z], marker=:circle)
    end
end

savefig("./Ovarian_Cancer.png")

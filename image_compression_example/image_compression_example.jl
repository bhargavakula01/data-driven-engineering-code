# This julia file will provide an example of image compression using SVD (Singular Value Decomposition)
# MUST BE RUN FROM WITHIN THE 'image_compression_example' folder!!
using Pkg
include("./load_packages.jl")

# injesting the image of the dog
A = load("./Figures/Dog.jpeg")

#turning image into a grey scale image
gs_A = Gray.(A)

#extracting row and column length from image matrix
row, col = size(gs_A)[1:2]

U, S , V = svd(gs_A)
S_diagonal = Diagonal(S)

#Approx A using truncated SVD method
matrix_rank_truncation_values = [5 20 100]

for r in matrix_rank_truncation_values
  x_approx = U[:, 1:r]*S_diagonal[1:r, 1:r]*transpose(V[:,1:r])
  #creating image
  fname = "./Figures/Truncated_image_rank_$r.png"
  save(fname, heatmap(x_approx)) #as the matrix rank increases more detail is added to the final image
end

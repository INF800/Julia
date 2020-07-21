#========================
Data Storage
========================#

using Pkg
Pkg.instantiate() # precompile and install dependencies in another machine
Pkg.activate("utils")
using utils

Pkg.add("JLD")

using JLD

#=
# Exporting Data
utils.printHead("Exporting Data")

x = collect(-3:0.1:3)
y = collect(-3:0.1:3)

xx = reshape([xi for xi in x for yj in y], length(y), length(x))
yy = reshape([yj for xi in x for yj in y], length(y), length(x))

z = sin.(xx .+ yy.^2)

data_dict = Dict("x"=>x, "y"=>y, "z"=>z)

save("data_dict.jld", data_dict)

println("$data_dict, $(typeof(data_dict))")
=#

# Reading Data
utils.printHead("Reading Data")

data_dict2 = convert(Dict, load("data_dict.jld"))
#println(data_dict2)

x2 = data_dict2["x"]
y2 = data_dict2["y"]
z2 = data_dict2["z"]

using plots
plotly()

plot(x2, y2, z2, st=:surface, color=:fire)
#=====================
PLOTTING
=====================#

using Pkg
Pkg.add("Plots")

using Plots 

x = 1:0.01:10*pi
y1 = cos.(x)./x
y2 = sin.(x)./x

plot(x, y1, label="cos(x)/x")
plot!(xlab="x", ylab="f(x)")
plot!(x, y2, label="sin(x)/x", color=:red, line=:dash)

xaxis!(:log10)
plot!(legend=:bottomright)

savefig("11Plot.png")
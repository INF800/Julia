#======================
Integration
==========================#

# calculations

using Pkg
Pkg.add("QuadGK")

using QuadGK

f1(x) = exp(-x^2)
res1, err1 = quadgk(f1, -Inf, Inf)
sqrt(pi)

rtol=1e-15
res2, err2 = quadgk(f1, -Inf, Inf, rtol=1e-15) # increase relative tolerance

res3, err3 = quadgk(f1, -Inf, Inf, order=12) # better accuracy as order increase (default is sufficient)

println("result is $res1, with tolerance $rtol result is $res2, with higher order resultis $res3 comparing with $(sqrt(pi))")

# functions with multiple arguments

f2(x,y,z) = x*y + (y^2)*z + sin(x*z)

# arg method
x = 9
y = 0.3
arg(z) = f2(x,y,z) # x and y constant integrate over z
res4, err4 = quadgk(arg, 1, 8)

# anonymous method
res5, err5 = quadgk(x -> f2(x, 3, 4), 1, 10)

println("result integration with arg method is $res4 and with anonymous fn is $res5.")

#=======================
Units of measurement
=======================#

using Pkg
Pkg.instantiate() # precompile and install dependencies in another machine
Pkg.activate("utils")

#%%
using utils

Pkg.add("Unitful")
using Unitful

one_meter = 1u"m"
conv_km = uconvert(u"km", one_meter)
println("$one_meter = $conv_km")
println("stripped units with conversion: $(ustrip(u"km", one_meter))")

# functions
utils.printHead("functions")

function compute_speed(dx, dy)
    return dx/dy
end

println("speed is $(compute_speed(7.2u"km", 2u"s"))")

function compute_speed2(dx::Unitful.Length, dt::Unitful.Time)
    return uconvert(u"m/hr", dx/dt)
end

println("speed in meters per hour is $(compute_speed2(7.2u"km", 2u"s")) ")

# Integration
utils.printHead("Integration")

using QuadGK
velocity(t=Unitful.Time) = 2u"m/s^2"*t + 3u"m/s" 
println("velocity integrated over 0 to 3 seconds is $(quadgk(velocity, 0u"s", 3u"s")[1])")
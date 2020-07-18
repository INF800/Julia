#=====================
MODULES
=====================#

using Pkg
Pkg.add("SpecialFunctions")

import .SpecialFunctions: sinint, gamma #specific

println(gamma(5))


import SpecialFunctions

print(SpecialFunctions.cosint(9))


# user defined module

module test_mod
export f2

function f1(x)
    return x-4
end

function f2(x)
    return x*f1(x)
end

end
#%%
using .test_mod
println(f2(5),"\t", test_mod.f1(f2(5)))

# code inclusion

include("utils.jl")
import . utilFns.printHead

printHead("code inclusion successful")



# code documentation

"""
description of the function 
"""
function foo(x)
    #... function implementation
end
 
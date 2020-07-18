#=======================
VARIABLE SCOPE
=======================#


# modules
module utils

function printHead(s="")
    println("====================================================")
    println(s)
    println("====================================================")
end


#export printHead
end #of `module`

using .utils



# local scope
utils.printHead("local scope")
# ===============================


function test()
    global z = 13
    return z*z
end
println("global value of z is $(z) and returned avlue is $(test())")


# 1. let construct

a = let 
    i= 7
    p=8
    i*p
end

println("a is: $a") # accessing `i/p` gives error

b = begin 
    i= 7
    p=8
    i*p
end

println("b is: $b and p is $p") # ip not local with begin


# global scope
utils.printHead("global scope")
# ===============================

# constant
const pi=3.14 # immutable
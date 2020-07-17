# basic function types
#   1. returns something/nothing
#   2. inline
#   3. anonymous

# param types
#   1. without any params
#   2. with any params
#   3. default params


# 1. without any params -return nothing
function print_info()
    println("hii")
end

# 2.1. with params -returns nothing
function log_add(a,b)
    println("addition: ", a+b)
end

# 2.2. with params -returns value
function ret_add(a,b)
    return a+b
end

# 3. default parametrs
function print_desc(st="this module describes fns")
    println("///////////////////////////////")
    println(st)
    println("///////////////////////////////")
end

# inline version
sub(a,b,c) = a-b-c # default return

# anonymous
sub_v2 = (a,b,c) -> a-b-c

# anonymous more
using Pkg
Pkg.add("QuadGK")
using QuadGk

f(x,y,z)  = (x^2 + y^2)/z^2
lim1      = 3
lim2      = 4
integrate(x,y)  = quadgk((x,y)->f(x,y,7), lim1, lim2)


function main()
    print_info()
    log_add(4.5,2//3) 
    println("addition fn: ", ret_add(2,4))
    print_desc()
    print_desc("helw")

    println("inline subtraction: ", sub(1,2,3))
    println("inline subtraction anonymous: ", sub_v2(12,2,3))

    println("intrgration anony", integrate(2,3))
end

#==================================
# main
==================================#
main()
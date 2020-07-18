function printHead(s="")
    println("====================================================")
    println(s)
    println("====================================================")
end

function print_mat(mat, head="")
    # display in matrix form t
    println("++++++++++++++++++++++++++++")
    println(head)
    display("text/plain", mat)
    println("++++++++++++++++++++++++++++")

end

#=================
ARRAYS
=================#

# vectors
printHead("vectors")
# =======================

a = [1, 2, 3, 5, 6.7]
println("element : ", a[2])
println("type : ", typeof(a))

gen_vec = [1 , 2, 3, 4.2]
col_vec = [1 ; 2 ; 3 ; 4.2] #note
row_vec = [1 2 3 4.2]

println("====================================")
println("type  of gen_vec: ", typeof(gen_vec), "dims: ", size(gen_vec))
println("type  of row_vec: ", typeof(row_vec), "dims: ", size(row_vec))
println("type  of col_vec: ", typeof(col_vec), "dims: ", size(col_vec))
println("====================================")

#=
println("element : ", b[2])
println("type  of c: ", typeof(c), "dims: ", size(b)) # Arrray{Float, : } 1=col 2=row
println("type  of x: ", typeof(x), "dims: ", size(x)) # Arrray{Float, : } 1=col 2=row
println("type  of b: ", typeof(b), "dims: ", size(c))
=#
append!(a , b)

float_vec = Float32[1, 2.3]
println("float_vec: ", float_vec)



# matrices
printHead("matrices")
# =======================

mat1 = [1, 2, 3, 4]
mat2 = [1 2; 3 4]
println("mat1: ", mat1, "\n", "mat2: ", mat2)
println("mat1[1,1]: ", mat1[1,1], "\nmat2[2,2]: ", mat2[2,2])



# n-D ARRAYS
printHead("nD Arrays")
# =======================

table = zeros(3, 2, 4)
for i in 1:3
    for j in 1:2
        for k in 1:4
            table[i,j,k] = i+j*k
        end
    end
end
println("table: \n", table, "\ttype: ", typeof(table), "\tsize: ", size(table))

table_2d = zeros(3, 2)
for i in 1:3
    for j in 1:2
        table_2d[i,j] = i+j
    end
end
println("table_2d: \n", table_2d)


# slicing
printHead("slicing")
# ===================

vec1     = [1, 2, 2, 3, 4, 5, 3]
matr1    = [1 2 4; 3 2 4; 4 1 4]
vec2     = vec1[3:6]

println("vec1: ", vec1, "size: ", size(vec1), "type: ", typeof(vec1))
println("vec2: ", vec2, "size: ", size(vec2), "type: ", typeof(vec2))
println("matr1: ", matr1, "size: ", size(matr1), "type: ", typeof(matr1))

matr2   = matr1[1:2 , 2:3]
print_mat(matr1, "matr1")
print_mat(matr2, "matr2")
print_mat(matr1[:, 3])
println("size: ", size(matr2), "type: ", typeof(matr2))

matr3 = reshape([i for i in -2:9], 2, 2, 3) # list comprehension [i for i in x:y]
print_mat(matr3, "matr3")

# matr4 = [[i for i in 1:4]; [j for j in 10:13]]

mat_compr = [ [row for row in 1:5] for col in 1:3 ]

print_mat(mat_compr, "mat_compr")

println(mat_compr[2][3])


# views
printHead("views")
# ======================

# simple copy
org = [1, 2, 3, [9, 8, 7]]
dup = org
dup[3] = 7
# simple copy creates just refs i.e
# changing eles in dup changes eles in original
println("org after simple dup: ", org) # just referencing not deep copying
println("\n")


# shallow copy
# -------------
org = [1, 2, 3, [9, 8, 7]]

shallow_dup = copy(org)
shallow_dup[3] = 7 # mutate first level
# shallow copying - copies first level
# after first level just refs
println("shallow org: ", org) # no change

shallow_dup[4][1] = 13 # mutate sec level
println("shallow org", org) # yes change
println("shallow: $org")

# deep copy
# ---------
org = [1, 2, 3, [9, 8, 7]]

shallow_dup = deepcopy(org)
# all levels full copy
shallow_dup[3] = 7
println("deep org: ", org)

shallow_dup[4][1] = 13
println("deep org: ", org)


# tuples
printHead("tuples")
# ==============

# immutable Arrays

arr = [1, 10, 100]
arr1 = (1, 3, 7) # w/ paranthesis
arr2 = 1, 6, 8 # w/o paranthesis
arr3 = arr2
# arr3[2] = 3 gives error
println(arr2)

# to unpack
a, b, c = arr1
println(a)
println("value of a is $a and b is $b") # emulate multiple returns

p, q, r = arr
println("value of q is $q and r is $r")

row, col, ht = size(table)
println("col: $col")


# splatting
printHead("splatting")
# =========================

# unpack -> to function

function splat_vol(a, b, c)
    return a*b*c
end

dim_cub = (3, 6, 7)
println("volume is: $(splat_vol(dim_cub...)) ")

# named tuples
printHead("named tuples")
# =================

named_tup = (a = "h0", b = 1.3, c = 1//7)
println("named tuple: $named_tup, with first value $(named_tup[:a])")

named_tup2 = NamedTuple{(:a, :b)}(("bye", 0.9))
println("named tuple: $named_tup2, with first value $(named_tup2[:a])")



# dictionaries
printHead("dictionaries")
# ===============================

# unordered random indices for Arrays
# eg. telephone dictionaries

per1 = Dict(
    "name"  =>  "rajesh",
    "phone"  =>  9898989898,
    "age"   =>  100
)

per2 = Dict(
    "name"  =>  "rakesh",
    "phone"  =>  9878989898,
    "age"   =>  109
)

persons = Dict(
    101 =>  per1,
    102 =>  per2
)

println("person 2 is $(per2["name"])")
println("Address book is $(persons)")

print_mat(persons)
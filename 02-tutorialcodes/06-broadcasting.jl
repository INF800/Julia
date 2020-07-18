#==========================
BROADCASTING
==========================#

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

# ops with arrays
printHead("ops with arrays")
# ==========================

a = [1, 2, 3] #col vec
b = [1 2 3] # row vec
c = [3, 2, 1]

print_mat(a*b)
print_mat(b*a)

# brodcasting
printHead("brodcasting")
# ==========================

print_mat(a.*c)
print_mat(sin.(a.*c))

map(x -> x*x, a*b)
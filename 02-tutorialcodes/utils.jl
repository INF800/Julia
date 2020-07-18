module utilFns

"""
prints the HEADING.
"""
function printHead(s="")
    println("====================================================")
    println(s)
    println("====================================================")
end

"""
prints REPL output
"""
function print_mat(mat, head="")
    # display in matrix form t
    println("++++++++++++++++++++++++++++")
    println(head)
    display("text/plain", mat)
    println("++++++++++++++++++++++++++++")

end

end
module utils

include("newmod.jl")

#using . xx          # general  (works by specifcally exporting)
#import . xx: yy     # specific (works without specifcally exporting)

using . importExport
notExportedGreet = importExport.notExportedGreet

using SpecialFunctions


"""
prints the HEADING.
"""
function printHead(s="")
    println("====================================================")
    println(s)
    println("====================================================")
end

"""e
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

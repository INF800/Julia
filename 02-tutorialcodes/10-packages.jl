#=========================
Packages
=========================#

#create packages 

using Pkg
Pkg.instantiate() # precompile and install dependencies in another machine
Pkg.activate("utils")

#%%
using utils
head            = utils.printHead
exportedFunc    = utils.greet
notExportedFunc = utils.notExportedGreet

gm = utils.gamma

# test utils pks and inmpotExport module
head("HELLO")
exportedFunc()
notExportedFunc()

# test deps from github
println(gm(5))

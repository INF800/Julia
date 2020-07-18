#=====================
MODULES
=====================#

using Pkg
Pkg.add("SpecialFunctions")

using SpecialFunctions: sinint, gamma #specific

println(gamma(5))

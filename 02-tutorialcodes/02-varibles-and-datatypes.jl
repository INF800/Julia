#========================================
# 01. Variables
========================================#
name = "rajesh"
print(name, "\n")

a       = 3.4
b       = 5
c     = a+b
print("sum is: ", c, "\n")

d    = a-b
print("diff is: ", d, "\n")

e    = a*b
print("mul is: ", e, "\n")

f     = a/b
print("div is: ", f, "\n")

g     = a^b
print("power is: ", g, "\n")

h     = 45%4
print("reminder is: ", h, "\n")

i    = 45//6
print("div2 is: ", i, "\n")

# check variable type

print("type of name : ", typeof(name), "\n")
print("type of div2 : ", typeof(i), "\n")
print("type of div : ", typeof(f), "\n")

# conversion
print("convert float to int: ", convert(Int64, 2.0), "\n") # 2.5 gives err
print("coxnvert int to float: ", convert(Float64, 2), "\n")
print("convert rational to float: ", convert(Float32, 2//4), "\n")
println("convert to float to rational: ", convert(Rational, 0.25))

a = Int(2) # by def typeof a is Int
a = 3.5 # overwritten. not trucated
println("overwritten float: ", a)
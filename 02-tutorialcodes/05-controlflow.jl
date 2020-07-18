#====================
Control Flow
====================#

function printHead(s="")
    println("====================================================")
    println(s)
    println("====================================================")
end


# if-else
printHead("if-else")
# =====================================

function abs_val(x)
    if x >= 0
        return x
    else
        return -x
    end
end
print("absolute value of -99 is $(abs(-99))")


# loops
# 1. for loops
printHead("for loops")
# ===============================

for i in 1:11
    # 10^10??
    println(10^i, " ", i)
end

persons = ["alice", "bob"]
for person in persons
    println("hello $person !")
end


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

persons1 = Dict(
    101 =>  per1,
    102 =>  per2
)

persons2 = Dict(
    "X" =>  per2,
    "Y" =>  per1
)


people = Dict(
    "I" => persons1,
    "II" => persons2
)

for (k, person) in persons1
    println("$k \t $(person)")
end

for (l, persons) in people
    println("$l \t $(persons)")
end

for (k, v) in people
    println("------")
    println(k)
    println("------")

    for (_k, _v) in v
        println("$_k \t $(_v["name"])")
    end
end


# 2. break
printHead("break")
# ===============================

for i in 1:100
    if i>10
        break
    else
        println(i^2)
    end
end


# 2. continue
printHead("continue")
# ===============================

for i in 1:100
    if (i % 7 == 0) & (i % 3 == 0)
        continue
    else
        println(i)
    end
end

# 3. while loop ( inside function )
printHead("while loop")
# ===============================

function while_test()
    
    iter = 0
    while (iter<30)
        println(iter)
        iter += 1
    end 
end

while_test()


# 4. enumerate
printHead("enumerate")
# ===============================

x = [ "cow", 1, "a", 2.0, "horse"]

for (idx, i) in enumerate(x)
    println("idx: $idx \t item: $i")
end


arr1 = collect(2:2:20)
arr2 = zeros(length(arr1))

for i in 1:length(arr1)
    arr2[i]=arr1[i]-1
end
println(arr2)

for (i, ele) in enumerate(arr1)
    arr2[i]= ele+5
end
println(arr2)
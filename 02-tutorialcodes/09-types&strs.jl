#=======================
TYPES AND STRS
========================#

include("utils.jl")
import . utilFns: printHead, print_mat

# implementation
printHead("implementation")
# =======================

abstract type person
end
println(" type of person is $(typeof(person))")

abstract type Musician <: person
    # Musicianis a type of person
end
println(" type of Musician is $(typeof(Musician))")

#concrete type 
mutable struct rockstar <: Musician
    name::String
    headband_col::String # headband_colcan be changed => mutable 
    instrumentsPlayed::Int32
end

struct classic_musician <: Musician # immutable
    name::String
    instrument::String
end

mutable struct physicist <: person
    name::String
    specialization::String
end

raj = physicist("rajesh", "photonics")
rak = physicist("rakesh", "photonics")
println("$(raj.name)'s specialization is $(raj.specialization)")
println("$(rak.name)'s specialization is $(rak.specialization)")

raj.specialization = "Quantum Optics"
println("$(raj.name)'s new specialization is $(raj.specialization)")

raj_music = classic_musician("rajesh", "violin")
# raj_music.instrument = "flute" - error immutable!


# fns and types: multiple dispatch
printHead("fns and types: multiple dispatch")
# =============================

function intro(Person::person)
    println("hii, my name is $(Person.name)")
end

intro(raj)

function intro(Person::Musician)
    println("hii, my name is $(Person.name) and I play $(Person.instrument)")
end
intro(raj_music)

# type constructor
printHead("type  constructor")
# ======================

mutable struct testdata1
    x1::Float64
    y1::Float64
    x2::Float64
    y2::Float64
    function testdata1(p::Float64, q::Float64)
        x1 = p 
        x2 = q
        y1= x1^3
        y2 = sin(y1+x2)

        new(x1, y1, x2, y2)
    end
end

testdata1(3.0, 2.0)


mutable struct test1{T<:Real}
    # DON'T change varaible names its taken as CONSTANT
        x::T
        w::T
        y::T
        z::Float64
        function test1{T}(x::T, y::T) where {T<:Real}
            w= x^y
            z = x-y

            new(x, y, w, z)


        end
end

a=test1{Float64}(4.0, 3.0)
println(a)


module TestModuleTypes

export Circle, computeArea, computePerimeter, printCircleEqn

mutable struct Circle{T<:Real}
    radius::T
    perimeter::Float64
    area::Float64

    function Circle{T}(radius::T) where T<:Real
        # initialize perimeter and area to -1.0 which is not possible
        new(radius, -1.0, -1.0)
    end
end

"""
        computePerimeter(circle::Circle)

Compute the perimeter of circle and store the value
"""
function computePerimeter(circle::Circle)
    circle.perimeter = 2*pi*circle.radius
    return circle.perimeter
end
    
"""
    computeArea(circle::Circle)
compute the area of circleand store the value
"""
function computeArea(circle::Circle)
    circle.area = pi*circle.radius^2
    return circle.area
end

"""
    printCircleEqn(xc::Real, yc::Real, circle::Circle)
Print the eqn of a circle with center at (xc, yc) and radius given by circle
"""
function printCircleEqn(xc::Real, yc::Real, circle::Circle)
    println("(x-$xc)^2 + (y-$yc)^2 = $(circle.radius^2)")
    return
    
end
    
end

using .TestModuleTypes

circle1 = Circle{Float64}(7.0)

computePerimeter(circle1)
println(circle1.perimeter)

computeArea(circle1)
println(circle1.area)

printCircleEqn(2, 3, circle1)
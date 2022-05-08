--this is a comment
print("Jello World")

--defines a factorial function
function fact(n)
    if n == 0 then 
        return 1
    else
        return n * fact(n-1)
    end
end

print("Enter a number:")
x=io.read("*n") --reads a number
print("Enter a number:")
y=io.read("*n")
a=x
print(fact(a))
print(math.pi/4)
b=15
--print(a^2)
--print(a+2)

function norm(x,y) return math.sqrt(norm(x^2,y^2)) end
function twice(x)return 2.0*x end
print(norm(x,y))
print(twice(x))

--[[
    To reative the code just add another hyphen in the beginning of the comment block
    print("This is how you add multiple line comments");
--]]

--Single Line Comments

--Variable Assignments the basic.
a=1;b=a*2

--[[ Types
type(nil)-->nil value (nothing)
type(true)-->boolean
type(10.4*3)-->number
type("Hello World")-->string
type(io.stdin)-->user data
type(print)-->function
type(type)-->function
type({})-->table
type(type(X))-->defualt of type is String
--]]

--[[
    print("Boolean Values");
    4 and 5-->5
    nil and 13-->nil
]]

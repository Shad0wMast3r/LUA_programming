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
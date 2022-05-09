---@diagnostic disable: discard-returns
--[[
    So numerals in Lua. Getting more exciting.
]]--

--We can assign numbers like this.
--type(4)-->Number
--a=4 
--b=8
--print(a+b)

--c=0.2e3-->200 so it works.

--[[
    Distinguishing numbers the math.type function is used for this.
math.type(3)-->integer
math.type(3.9)-->Float
]]--
--Using hex numbers in Lua. 
--hex1=0xff-->255
--hex2=0x1a3-->419
--hex3=0x0.2-->0.125
--hex4=0x1p-1-->0.5
--hex5=0xa.bp2-->42.75

--To write numbers in string fomat
--test1=string.format("%a",419)
--print(test1)

--Forget everything at the top too complicated to work with. Referenece
--Basic Arithmetic Operators
sum1=5+2 -->0
minus=56-25 -->1
multiply=3*4 -->2
division=9/3 -->3
--floordivision=1.5 // 0.5 -->Does not work but its floor division.
x=math.pi
array1={sum1,minus,multiply,division}
for i=0,4 do
    print(array1[i])
end

--Random Function
local tolerance=0.17
function isturnback(angle)
    angle = angle % (2*math.pi)
    return (math.abs(angle-math.pi)<tolerance)
end
print(isturnback(-180))

--Rounding Numbers
x2=2^52+1
print(string.format("%d %d",x2,math.floor(x+0.5)))
function round(x4)
    local f=math.floor(x4)
    if x4==f then return f
    else return math.floor(x4+0.5)
    end
end
print("This is from the print function:",round(8.5))
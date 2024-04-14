
Hola={}
function Hola:GoodDay()
    print("GoodDay")
end
Hey = {}
function Hey:New(o)
    o = o or {}
    setmetatable(o, {__index=Hola})
    self.__index = self
    return o
end
function Hey:Greetings()
    print("Greetings")
end
return Hey:New(nil)

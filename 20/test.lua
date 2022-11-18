-- 20.1 20.2
local Set = {}
local mt = {}
function Set.new(l)
    local set = {}
    setmetatable(set, mt)
    for _, v in pairs(l) do
        set[v] = true
    end
    return set
end
function Set.subtraction(a, b)
    if getmetatable(a) ~= mt or getmetatable(b) ~= mt then
        error("attempt to 'subtract' a set with a non-set value", 2)
    end
    local res = Set.new {}
    for k in pairs(a) do
        res[k] = true
    end
    for k in pairs(b) do
        res[k] = nil
    end
    return res
end
function Set.length(set)
    local count = 0
    for i in pairs(set) do
        count = count + 1
    end
    return count
end
mt.__sub = Set.subtraction
mt.__len = Set.length
return Set

-- 20.3
local proxy={}
local mt={}
function readOnly(t)
	mt.__index=function (_,k) return rawget(t,k) end
	mt.__newindex=function (t,k,v) error("attempt to update a read-only table",2) end
	setmetatable(proxy,mt)
	return proxy
end
days={"Sunday","Monday","Tuesday","Wednesday","Tursday","Friday","Saturday"}
days=readOnly(days)
print(days[1])
days[2]="Noday"

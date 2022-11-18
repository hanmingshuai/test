-- 21.1
Stack = {}
function Stack:isempty()
    return #self == 0
end
function Stack:push(v)
    table.insert(self, v)
end
function Stack:pop()
    if #self ~= 0 then
        table.remove(self)
    else
        error("Stack is empty")
    end
end
function Stack:top()
    if #self ~= 0 then
        return self[#self]
    else
        return nil
    end
end
function Stack:new(o)
    o = o or {}
    self.__index = self
    setmetatable(o, self)
    return o
end

-- 21.2
StackQueue = Stack:new()
function StackQueue:insertbottom(v)
    table.insert(self, 1, v)
end

-- 21.3
local metadata = {}
Stack = {}
function Stack:isempty()
    return #metadata[self] == 0
end
function Stack:push(v)
    table.insert(metadata[self], v)
end
function Stack:pop()
    if #metadata[self] ~= 0 then
        table.remove(metadata[self])
    else
        error("Stack is empty")
    end
end
function Stack:top()
    if #metadata[self] ~= 0 then
        return metadata[self][#metadata[self]]
    else
        return nil
    end
end
function Stack:new(o)
    o = o or {}
    self.__index = self
    setmetatable(o, self)
    metadata[o] = {}
    return o
end

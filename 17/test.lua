-- 17.1
local DoubleList = {}
function DoubleList.listNew()
    return {
        first = 0,
        last = -1
    }
end
function DoubleList.pushFirst(list, value)
    local first = list.first - 1
    list[first] = value
    list.first = first
end
function DoubleList.pushLast(list, value)
    local last = list.last + 1
    list.last = last
    list[last] = value
end
function DoubleList.popFirst(list)
    local first = list.first
    if first > list.last then
        error("list is empty")
    end
    local value = list[first]
    list[first] = nil
    list.first = first + 1
    return value
end
function DoubleList.popLast(list)
    local last = list.last
    if list.first > last then
        error("list is empty")
    end
    local value = list[last]
    list[last] = nil
    list.last = last - 1
    return value
end

return DoubleList


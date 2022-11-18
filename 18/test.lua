-- 18.1
local function iter(m, n)
    n = n + 1
    if n <= m then
        return n
    end
end
function fromto(n, m)
    return iter, m, n - 1
end

for i in fromto(2, 11) do
    print(i)
end

-- 18.2
local function iter(t, n)
    n = n + t[2]
    if n <= t[1] then
        return n
    end
end
function fromto1(n, m, k)
    return iter, {m, k}, n - k
end

for i in fromto1(3, 11, 0.5) do
    print(i)
end

-- 18.3
function uniquewords(file)
    local t = {}
    local pos = 1
    for line in io.lines(file) do
        local w, e = string.match(line, "(%w+)()", pos)
        while w do
            pos = e
            t[w] = t[w] == nil and 1 or t[w] + 1
            w, e = string.match(line, "(%w+)()", pos)
        end
        pos = 1
    end
    return next, t, nil
end

-- 18.4
local function iter(str, t)
    t[1] = t[1] or 1
    t[2] = t[2] or 0
    if t[1] < #str then
        if t[2] < #str then
            t[2] = t[2] + 1
        else
            t[1] = t[1] + 1
            t[2] = t[1]
        end
        local substr = string.sub(str, t[1], t[2])
        if string.match(substr, "[%S]+") then
            return t, substr
        else
            return t
        end
    else
        return nil
    end
end

function substring(str)
    return iter, str, {}
end

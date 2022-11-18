-- 22.1
function getfield(f)
    local v = _G
    w = string.match(f, "[^%w%._]")
    if w then
        error("seperation character was wrong!")
    end
    for w in string.gmatch(f, "([%a_][%w_]*)(%.?)") do
        v = v[w]
    end
    return v
end

-- 22.2
-- 创建了局部变量foo，打印代码块内的私有环境的X字段，私有环境被赋值为外部环境，第10行中调用foo会打印13.在第9行环境被设置为nil，这时的X=0将抛出异常。

-- 22.3
-- 第一行把print声明为局部变量，foo函数将由第一个参数获得指定的环境，在指定的环境中获得b的值。a的值则由第二个实参获得，打印的结果是26 11。

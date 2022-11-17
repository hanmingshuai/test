--练习8.1
 -- 没有switch，elseif比使用多个if性能更高
--练习8.2
 -- while(true) 
 -- for 1,math.huge
 -- repeat
 -- goto
--练习8.4
function room1()
    local move = io.read()
    if move == "south" then
        room3()
    elseif move == "east" then
        room2()
    else
        print("invalid move")
        room1()
    end
end
function room2()
    local move = io.read()
    if move == "south" then
        room4()
    elseif move == "west" then
        room1()
    else
        print("invalid move")
        room2()
    end
end
function room3()
    local move = io.read()
    if move == "north" then
        room1()
    elseif move == "east" then
        room4()
    else
        print("invalid move")
        room3()
    end
end
function room4()
    print("congratulations , you won!")
end
room1()
--练习8.5
 --假如goto语句能跳出函数，直接跳转到某个变量的作用域，却绕过了声明与赋值，会发生无法预料的错误
 
#!/usr/bin/lua
-- 练习6.1
function solution61(arr)
    print(unpack(arr))
end
solution61({1,2,3,4})
-- 练习6.2
function solution62(num,...)
    print(...)
end
solution62(1,2,3,4,"a")
-- 练习6.3
function solution63(...)
    local s=table.pack(...)
   for i=1,#s-1 do
    print(s[i])
  end
end
solution63(2,3,4,5)
-- 练习6.4
function solution64(t)
    math.randomseed(os.time())
    for i=#t,2,-1 do
      local randnum=math.random(i)
      local s=t[i]
      t[i]=t[randnum]
      t[randnum]=s
    end
    return t
end
-- 练习6.5




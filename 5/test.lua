-- 练习5.1
-- monday  sunday  Sunday
-- t.sunday = "monday"
-- t[sunday] = monday = "sunday"
-- t[t.sunday] = t["monday"] = "sunday"

-- 练习5.2
-- a.a.a.a={} 一样
-- 运行报错，数值不支持引用自己本身

-- 练习5.3
a={ x = "\\n"}
print("5.3:")
print(a.x)

-- 练习5.4
function solution54(a,x)
	sum=0
	for i=1,#a do
		sum=sum+a[i]*(x^(i-1))
	end
	return sum
end
print("5.4:")
print(solution54({2,1,2,2},2))

-- 练习5.5
function  solution55(a,x)
	local sum=a[1]
	local ans=1
	for i=2,#a do
		ans=ans*x
		sum=sum+ans*a[i]
	end
	return sum
end
print("5.5:")
print(solution55({2,1,2,2},2))

-- 练习5.7
function solution57(tab1,tab2,index)
	for i=1,#tab1 do
		table.insert(tab2,index,tab1[i])
		index=index+1
	end
end
print("5.7:")
a={1,2,3,4}
b={5,6,7,8}
solution57(a,b,2)
for k=1, #b do 
    print(k, b[k]) 
end

-- 练习5.8
function solution58(t,s,e)
	string=""
	for i=s,e do
		string=string..t[i]
	end
	return string
end
print("5.8:")
print(solution58({"a","b","c","d"} , 2 , 3))

-- 实现出来循环测试就行，对比时间
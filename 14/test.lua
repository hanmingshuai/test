--14.1
function solution1(a,b)
	local c={}
	for i=1,#a do
		c[i]={}
		for j=1,#a[i] do
			c[i][j]=a[i][j]+b[i][j]
		end
	end
	return c
end
--14.2
function listNew()
	return {first=0,last=0}
end
function empty(list)
	return list.first==list.last and list[list.first]==nil
end
function pushFirst(list,value)
	if empty(list) then
		list.last=list.last-1
	end
	local first=list.first-1
	list[first]=value
	list.first=first
end
function pushLast(list,value)
	if empty(list) then
		list.first=list.first+1
	end
	local last=list.last+1
	list.last=last
	list[last]=value
end
function popFirst(list)
	if empty(list) then
		error("list is empty")
	end
	local first=list.first
	local value=list[first]
	list[first]=nil
	if first==list.last then
		list.first=0
		list.last=0
	else
		list.first=first+1
	end
	return value
end
function popLast(list)
	if empty(list) then
		error("list is empty")
	end
	local last=list.last
	local value=list[last]
	list[last]=nil
	if last==list.first then
		list.first=0
		list.last=0
	else
		list.last=last-1
	end
	return value
end
function display(list)
	while not empty(list) do
		local value=popFirst(list)
		io.write(value.."\t")
	end
end

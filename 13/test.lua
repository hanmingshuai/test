--13.1
function solution1(n,m)
	while not math.ult(n,m) do
		n=n-m
		print(string.format("n=%u",n))
	end
	return n
end

--13.3
function solution3(num)
	if num&(num-1)==0 then
		return true
	else
		return false
	end
end

--13.4
function solution4(num)
	local count=0
	while num~=0 do
		if num&1==1 then
			count=count+1
		end
		num=num>>1
	end
	return count
end

--13.5
function solution5(num)
	s=""
	while num~=0 do
		s=num&1==1 and s.."1" or s.."0"
		num=num>>1
	end
	if s==string.reverse(s) then
		return true
	else
		return false
	end
end

--13.6
function newBitArray(n)
	local a={}
	return a
end
function setBit(a,n,v)
	a[n]=v
end
function testBit(a,n)
	return a[n]
end


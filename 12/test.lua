-- 12.1
function solution1(num)
	temp=os.date("*t",num)
	temp.month=temp.month+1
	return os.time(temp)
end

-- 12.2
function solution2(num)
	result=os.date("%w",num)
	return math.floor(result+1)
end

-- 12.3
function solution3(num)
	temp=os.date("*t",num)
	sum=temp.hour*3600+temp.min*60+temp.sec
	return sum
end

-- 12.4
function solution4(num)	
	temp={year=num,month=1,day=1}
	temp=os.date("*t",os.time(temp))
	cur=temp.wday
	if cur<=6 then
		temp.day=temp.day+6-cur
	else
		temp.day=temp.day+6
	end
	temp=os.date("*t",os.time(temp))
	return temp.yday
end

-- 12.5
function solution5(num1,num2)
	return math.floor(os.difftime(num1,num2)//(24*60*60))
end

-- 12.6
function solution6(num1,num2)
	t1=os.date("*t",num1)
	t2=os.date("*t",num2)
	mon1=t1.month-t2.month
	year1=math.abs(t1.year-t2.year)
	mon1=year1*12+mon1
	return mon1
end

-- 12.7
t1={year=2021,month=8,day=31}
t1=os.date("*t",os.time(t1))
t2=t1
t1.day=t1.day+1
t1=os.date("*t",os.time(t1))
t1.month=t1.month+1
t1=os.date("*t",os.time(t1))


t2.month=t2.month+1
t2=os.date("*t",os.time(t2))
t2.day=t2.day+1
t2=os.date("*t",os.time(t2))
print(os.date("%c",os.time(t1)))
print(os.date("%c",os.time(t2)))
    -- 不同

-- 12.8
function solution8(num)
	return os.date("%z",num)
end

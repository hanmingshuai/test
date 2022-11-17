--练习9.1
function integral (f,a)
    a=a or 1e-5
    return function(begin,endn)
      local temp=0
      for i=begin,endn,a do
        temp=temp+f(i)
      end
      return temp*a
    end
end
   
c=integral(math.cos)
print(math.sin(5.2),c(0,5.2))

--练习9.3
function newpoly(a)
    local l=#a
    return function(x)
      local temp,n=a[1],1
      for i=2,l,1 do
        n=n*x
        temp=temp+n*a[i]
      end
      return temp
    end
end
   
f=newpoly({3,0,1})
print(f(0),f(5),f(10))


--10.1
function spilt(s,mode)
	local tab = {}
	local count = 1
	local index = string.find(s,mode)
	while(index) do
		tab[count] = string.sub(s,0,index - 1)
		count = count + 1
		s = string.sub(s,index + 1, #s)
		index = string.find(s,mode)
	end
	tab[count] = s
	return tab
end

--10.3
function transliterate(s,tab)
    for i in pairs(tab) do
      local temp = string.gsub(i,"(%p)","%%%1") 
      if tab[i]==false then
        s=string.gsub(s,temp,"")
      else
        s=string.gsub(s,temp,tab[i])
      end
    end
    return s
end
tab ={a= "b",b="12",c=false,["+"]="-"}
print(transliterate("abc+",tab))

--10.5
function escape(s)
	s = string.gsub(s,"(.)",function(t)
      return string.format("\\x%02X",string.byte(t))
	end)
	return s
end
print(escape("\0\1hello\200"))

  
  
  

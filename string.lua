--Add string-variable interpolation support
function interp(s, tab)
	return (s:gsub('($%b{})', function(w) return tab[w:sub(3, -2)] or w end))
end
--print( interp("${name} is ${value}", {name = "foo", value = "bar"}) )
getmetatable("").__mod = interp
--print( "${name} is ${value}" % {name = "foo", value = "bar"} )


function frameToStr(frame)
	return "${x},${y} ${w}x${h}" % {x=frame.x, y=frame.y, w=frame.w, h=frame.h}
end

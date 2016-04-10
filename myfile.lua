local myfile = {}

function myfile:escapeFileName(name)
	return string.gsub(name, " ", "\\ ")
end

--Courtesy http://stackoverflow.com/a/21637809/326694

function myfile:exists(name)
	if type(name)~="string" then return false end
	return os.rename(name,name) and true or false
end

function myfile:isFile(name)
    if type(name)~="string" then return false end
    if not exists(name) then return false end
    local f = io.open(name)
    if f then
        f:close()
        return true
    end
    return false
end

function myfile:isDir(name)
    return (exists(name) and not isFile(name))
end

return myfile

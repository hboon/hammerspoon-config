require 'window'
local myfile = require 'myfile'
require 'mystring'
require 'scratch'

--Reload
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
	hs.reload()
end)
hs.alert.show("Hammerspoon config reloaded")

--Force command apps I use to be visible
hs.hotkey.bind({"shift"}, "F12", function()
	os.execute("open -a Terminal")
	hs.timer.doAfter(0.2, function()
		fillLeftOneThird()
		hs.timer.doAfter(0.2, function()
			os.execute("open -a Simulator")
			hs.timer.doAfter(0.2, function()
				fillLeftOneThird()
				hs.timer.doAfter(0.2, function()
					os.execute("open -a MacVim")
					hs.timer.doAfter(0.2, function()
						fillRightTwoThird()
					end)
				end)
			end)
		end)
	end)
end)

local downloadsDir = os.getenv("HOME") .. "/Downloads/"
downloadsDir = myfile:escapeFileName(downloadsDir)

downloadsWatcher = hs.pathwatcher.new(downloadsDir, function(changed)
	for _,file in pairs(changed) do
		moveProvisioningProfiles(file)
		moveAirDroppedImages(file)
		moveAirDroppedVideos(file)
		moveCerts(file)
		moveEpub(file)
	end
end)
downloadsWatcher:start()

hs.shutdownCallback = function()
	downloadsWatcher:stop()
end

--Strangely, this doesn't append a -1, -2 for duplicate filenames with generateUniqueDestinationFilename(). Maybe due to a space in the path? But good in this case, because I want to replace provisioning profiles with the same name if it exists
function moveProvisioningProfiles(filename)
	return moveDownloadedFilesToDirectory(filename, "", "mobileprovision", "Provisioning Profile", "/Users/hboon/Dropbox/hb-and-ml-common/Provisioning Profiles/")
end

function moveAirDroppedImages(filename)
	moveAirDroppedImageAndVideos(filename, ".png", "image")
	return moveAirDroppedImageAndVideos(filename, ".jpg", "image")
end

function moveAirDroppedVideos(filename)
	return moveAirDroppedImageAndVideos(filename, ".mov", "video")
end

function moveAirDroppedImageAndVideos(filename, ext, fileType)
	return moveDownloadedFilesToDesktop(filename, "img_", ext, fileType)
end

function moveCerts(filename)
	return moveDownloadedFilesToDesktop(filename, "", "cer", "Cert")
end

function moveEpub(filename)
	return moveDownloadedFilesToDirectory(filename, "", "epub", "ePub", "/Users/hboon/Dropbox/book-drop/")
end

function moveDownloadedFilesToDesktop(filename, prefix, ext, fileType)
	local destDir = os.getenv("HOME") .. "/Desktop/"
	destDir = myfile:escapeFileName(destDir)
	local name = filename:match( "([^/]+)$" )
	--Must check against filename (with space verbatim), and not against escapedSrc (with \\space)
	if string.lower(filename:sub(-string.len(ext))) == ext and string.lower(name:sub(1, string.len(prefix))) == prefix and myfile:exists(filename) then
		name = generateUniqueDestinationFilename(name, destDir)
		--TODO need to escape the destination filename too
		local escapedSrc = myfile:escapeFileName(filename)
		os.execute("mv ${escapedSrc} ${destDir}${name}" % {escapedSrc=escapedSrc, destDir=destDir, name=name})
		local msg = "Moved ${fileType} ${name} from ${from} to ${to}" % {fileType=fileType, name=name, from="Downloads/", to="Desktop/"}
		hs.notify.new({title="Hammerspoon", informativeText=msg}):send()
		return true
	end
	return false
end

--Change moveDownloadedFilesToDesktop() to call this, passing in destDir
function moveDownloadedFilesToDirectory(filename, prefix, ext, fileType, destDir)
	destDir = myfile:escapeFileName(destDir)
	local name = filename:match( "([^/]+)$" )
	--Must check against filename (with space verbatim), and not against escapedSrc (with \\space)
	if string.lower(filename:sub(-string.len(ext))) == ext and string.lower(name:sub(1, string.len(prefix))) == prefix and myfile:exists(filename) then
		name = generateUniqueDestinationFilename(name, destDir)
		--TODO need to escape the destination filename too
		local escapedSrc = myfile:escapeFileName(filename)
		os.execute("mv ${escapedSrc} ${destDir}${name}" % {escapedSrc=escapedSrc, destDir=destDir, name=name})
		local msg = "Moved ${fileType} ${name} from ${from} to ${to}" % {fileType=fileType, name=name, from="Downloads/", to="Desktop/"}
		hs.notify.new({title="Hammerspoon", informativeText=msg}):send()
		return true
	end
	return false
end

-- Appends a -1 or -2, etc if file already exists. e.g. "abc.ext" -> "abc-1.ext"
function generateUniqueDestinationFilename(name, destDir)
	local destFilename = destDir .. name
	while myfile:exists(destFilename) do
		--TODO need to escape the destination filename too
		local nameWithoutExt, _, extWithDot = myfile:breakFilename(name)
		local nameWithoutNum, num = breakTrailingNumeric(nameWithoutExt)
		if num then
			num = num+1
		else
			num = 1
		end
		name = nameWithoutNum .. "-" .. num .. extWithDot
		destFilename = destDir .. name
	end
	return name
end

-- "abc-1" -> "abc", 1
-- "abc" -> "abc", nil
function breakTrailingNumeric(name)
	if string.find(name, "-") then
		local _, _, num = string.find(name, "([^-]*)$")
		-- TODO check if end with "-XXX" a number
		return name:sub(1, string.len(name)-string.len(num)-1), math.ceil(num+0)
	else
		return name, nil
	end
end

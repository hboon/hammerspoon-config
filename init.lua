require 'window'
local myfile = require 'myfile'
require 'mystring'
require 'scratch'

--Reload
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
	hs.reload()
end)
hs.alert.show("Hammerspoon config reloaded")

local downloadsDir = os.getenv("HOME") .. "/Downloads/"
downloadsDir = myfile:escapeFileName(downloadsDir)

downloadsWatcher = hs.pathwatcher.new(downloadsDir, function(changed)
	for _,file in pairs(changed) do
		moveProvisioningProfiles(file)
	end
end)
downloadsWatcher:start()

hs.shutdownCallback = function()
	downloadsWatcher:stop()
end

function moveProvisioningProfiles(filename)
	local destDir = "~/Dropbox/hb-and-ml-common/Provisioning Profiles/"
	destDir = myfile:escapeFileName(destDir)
	local ext = ".mobileprovision"
	--Must check against filename (with space verbatim), and not against escapedSrc (with \\space)
	if filename:sub(-string.len(ext)) == ext and myfile:exists(filename) then
		local escapedSrc = myfile:escapeFileName(filename)
		os.execute("mv ${escapedSrc} ${destDir}" % {escapedSrc=escapedSrc, destDir=destDir})
		return true
	end
	return false
end

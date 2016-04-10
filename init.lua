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
downloadsWatcher = hs.pathwatcher.new(downloadsDir, function(changed)
	local destDir = "~/Dropbox/hb-and-ml-common/Provisioning Profiles/"
	destDir = myfile:escapeFileName(destDir)
	for _,file in pairs(changed) do
		local ext = ".mobileprovision"
		--Must check against file (with space verbatim), and not against escapedSrc (with \\space)
		if file:sub(-string.len(ext)) == ext and myfile:exists(file) then
			local escapedSrc = myfile:escapeFileName(file)
			os.execute("mv ${escapedSrc} ${destDir}" % {escapedSrc=escapedSrc, destDir=destDir})
		end
	end
end)
downloadsWatcher:start()

hs.shutdownCallback = function()
	downloadsWatcher:stop()
end

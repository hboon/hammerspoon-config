require 'window'
require 'string'
require 'scratch'

--Reload
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
	hs.reload()
end)
hs.alert.show("Hammerspoon config reloaded")

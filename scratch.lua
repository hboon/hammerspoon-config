--Testing only
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
	--local win = hs.window.focusedWindow()
	--local f = win:frame()

	----f.x = f.x - 10
	----win:setFrame(f)

	----hs.alert.show("Hello World!")
	--hs.alert.show("Hello ${v}" % {v = f.x})
	----hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()

	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen = win:screen()
	local screenFrame = screen:frame()

	--left
	--frame.x = screenFrame.x
	--frame.y = screenFrame.y
	--frame.w = screenFrame.w/2
	--frame.h = screenFrame.h
	--win:setFrame(frame)
end)

function listTabToStr(list)
	result = ""
	for i=1, #list do
		result = result .. ", " .. list[i]
	end
	return result
end

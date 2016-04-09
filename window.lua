function leftHalfFrame()
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen = win:screen()
	local screenFrame = screen:frame()

	frame.x = screenFrame.x
	frame.y = screenFrame.y
	frame.w = screenFrame.w/2
	frame.h = screenFrame.h
	return frame
end

function leftOneThirdFrame()
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen = win:screen()
	local screenFrame = screen:frame()

	frame.x = screenFrame.x
	frame.y = screenFrame.y
	frame.w = screenFrame.w/3
	frame.h = screenFrame.h
	return frame
end

function leftTwoThirdFrame()
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen = win:screen()
	local screenFrame = screen:frame()

	frame.x = screenFrame.x
	frame.y = screenFrame.y
	frame.w = screenFrame.w*2/3
	frame.h = screenFrame.h
	return frame
end

function rightHalfFrame()
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen = win:screen()
	local screenFrame = screen:frame()

	frame.x = screenFrame.w/2
	frame.y = screenFrame.y
	frame.w = screenFrame.w/2
	frame.h = screenFrame.h
	return frame
end

function rightOneThirdFrame()
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen = win:screen()
	local screenFrame = screen:frame()

	frame.x = screenFrame.w*2/3
	frame.y = screenFrame.y
	frame.w = screenFrame.w/3
	frame.h = screenFrame.h
	return frame
end

function rightTwoThirdFrame()
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen = win:screen()
	local screenFrame = screen:frame()

	frame.x = screenFrame.w/3
	frame.y = screenFrame.y
	frame.w = screenFrame.w*2/3
	frame.h = screenFrame.h
	return frame
end

function topHalfFrame()
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen = win:screen()
	local screenFrame = screen:frame()

	frame.x = screenFrame.x
	frame.y = screenFrame.y
	frame.w = screenFrame.w
	frame.h = screenFrame.h/2
	return frame
end

function topOneThirdFrame()
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen = win:screen()
	local screenFrame = screen:frame()

	frame.x = screenFrame.x
	frame.y = screenFrame.y
	frame.w = screenFrame.w
	frame.h = screenFrame.h/3
	return frame
end

function topTwoThirdFrame()
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen = win:screen()
	local screenFrame = screen:frame()

	frame.x = screenFrame.x
	frame.y = screenFrame.y
	frame.w = screenFrame.w
	frame.h = screenFrame.h*2/3
	return frame
end

hs.hotkey.bind({"cmd", "alt"}, "Left", function()
	local win = hs.window.focusedWindow()
	local frame = win:frame()

	if frame.x == leftHalfFrame().x and frame.y == leftHalfFrame().y and frame.w == leftHalfFrame().w then
		win:setFrame(leftOneThirdFrame())
	elseif frame.x == leftOneThirdFrame().x and frame.y == leftOneThirdFrame().y and frame.w < leftHalfFrame().w then
		win:setFrame(leftTwoThirdFrame())
	else
		win:setFrame(leftHalfFrame())
	end
end)

hs.hotkey.bind({"cmd", "alt"}, "Right", function()
	local win = hs.window.focusedWindow()
	local frame = win:frame()

	if frame.x == rightHalfFrame().x and frame.y == rightHalfFrame().y and frame.w == rightHalfFrame().w then
		win:setFrame(rightOneThirdFrame())
	elseif frame.x == rightOneThirdFrame().x and frame.y == rightOneThirdFrame().y and frame.w < rightHalfFrame().w then
		win:setFrame(rightTwoThirdFrame())
	else
		win:setFrame(rightHalfFrame())
	end
end)

hs.hotkey.bind({"cmd", "alt"}, "Up", function()
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen = win:screen()
	local screenFrame = screen:frame()

	frame.x = screenFrame.x
	frame.y = screenFrame.y
	frame.w = screenFrame.w
	frame.h = screenFrame.h/2
	win:setFrame(frame)
end)

hs.hotkey.bind({"cmd", "alt"}, "Down", function()
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen = win:screen()
	local screenFrame = screen:frame()

	frame.x = screenFrame.x
	frame.y = screenFrame.h/2
	frame.w = screenFrame.w
	frame.h = screenFrame.h/2
	win:setFrame(frame)
end)

-- Full screen
hs.hotkey.bind({"cmd", "alt"}, "f", function()
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen = win:screen()
	local screenFrame = screen:frame()

	frame.x = screenFrame.x
	frame.y = screenFrame.y
	frame.w = screenFrame.w
	frame.h = screenFrame.h
	win:setFrame(frame)
end)

-- Top left
hs.hotkey.bind({"cmd", "alt", "shift"}, "Left", function()
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen = win:screen()
	local screenFrame = screen:frame()

	frame.x = screenFrame.x
	frame.y = screenFrame.y
	frame.w = screenFrame.w/2
	frame.h = screenFrame.h/2
	win:setFrame(frame)
end)

-- Top right
hs.hotkey.bind({"cmd", "alt", "shift"}, "Right", function()
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen = win:screen()
	local screenFrame = screen:frame()

	frame.x = screenFrame.w/2
	frame.y = screenFrame.y
	frame.w = screenFrame.w/2
	frame.h = screenFrame.h/2
	win:setFrame(frame)
end)

-- Bottom left
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen = win:screen()
	local screenFrame = screen:frame()

	frame.x = screenFrame.x
	frame.y = screenFrame.h/2
	frame.w = screenFrame.w/2
	frame.h = screenFrame.h/2
	win:setFrame(frame)
end)

-- Bottom right
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen = win:screen()
	local screenFrame = screen:frame()

	frame.x = screenFrame.w/2
	frame.y = screenFrame.h/2
	frame.w = screenFrame.w/2
	frame.h = screenFrame.h/2
	win:setFrame(frame)
end)

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
	sizeLeft()
end)

hs.hotkey.bind({"cmd", "alt"}, "Right", function()
	sizeRight()
end)

hs.hotkey.bind({"cmd", "alt"}, "Up", function()
	sizeTop()
end)

hs.hotkey.bind({"cmd", "alt"}, "Down", function()
	sizeBottom()
end)

-- Full screen
hs.hotkey.bind({"cmd", "alt"}, "f", function()
	sizeFullScreen()
end)

-- Top left
hs.hotkey.bind({"cmd", "alt", "shift"}, "Left", function()
	sizeTopLeft()
end)

-- Top right
hs.hotkey.bind({"cmd", "alt", "shift"}, "Right", function()
	sizeTopRight()
end)

-- Bottom left
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
	sizeBottomLeft()
end)

-- Bottom right
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
	sizeBottomRight()
end)

function fillLeftHalf()
	hs.window.animationDuration = 0
	local win = hs.window.focusedWindow()
	win:setFrame(leftHalfFrame())
	hs.window.animationDuration = 0.2
end

function fillLeftOneThird()
	hs.window.animationDuration = 0
	local win = hs.window.focusedWindow()
	win:setFrame(leftOneThirdFrame())
	hs.window.animationDuration = 0.2
end

function fillLeftTwoThird()
	hs.window.animationDuration = 0
	local win = hs.window.focusedWindow()
	win:setFrame(leftTwoThirdFrame())
	hs.window.animationDuration = 0.2
end

function fillRightHalf()
	hs.window.animationDuration = 0
	local win = hs.window.focusedWindow()
	win:setFrame(rightHalfFrame())
	hs.window.animationDuration = 0.2
end

function fillRightOneThird()
	hs.window.animationDuration = 0
	local win = hs.window.focusedWindow()
	win:setFrame(rightOneThirdFrame())
	hs.window.animationDuration = 0.2
end

function fillRightTwoThird()
	hs.window.animationDuration = 0
	local win = hs.window.focusedWindow()
	win:setFrame(rightTwoThirdFrame())
	hs.window.animationDuration = 0.2
end

function fillTopHalf()
	hs.window.animationDuration = 0
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen = win:screen()
	local screenFrame = screen:frame()

	frame.x = screenFrame.x
	frame.y = screenFrame.y
	frame.w = screenFrame.w
	frame.h = screenFrame.h/2
	win:setFrame(frame)
	hs.window.animationDuration = 0.2
end

function fillBottomHalf()
	hs.window.animationDuration = 0
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen = win:screen()
	local screenFrame = screen:frame()

	frame.x = screenFrame.x
	frame.y = screenFrame.h/2
	frame.w = screenFrame.w
	frame.h = screenFrame.h/2
	win:setFrame(frame)
	hs.window.animationDuration = 0.2
end

function sizeLeft()
	local win = hs.window.focusedWindow()
	local frame = win:frame()

	if frame.x == leftHalfFrame().x and frame.y == leftHalfFrame().y and frame.w == leftHalfFrame().w then
		fillLeftOneThird()
	elseif frame.x == leftOneThirdFrame().x and frame.y == leftOneThirdFrame().y and frame.w < leftHalfFrame().w then
		fillLeftTwoThird()
	else
		fillLeftHalf()
	end
end

function sizeRight()
	local win = hs.window.focusedWindow()
	local frame = win:frame()

	if frame.x == rightHalfFrame().x and frame.y == rightHalfFrame().y and frame.w == rightHalfFrame().w then
		fillRightOneThird()
	elseif frame.x == rightOneThirdFrame().x and frame.y == rightOneThirdFrame().y and frame.w < rightHalfFrame().w then
		fillRightTwoThird()
	else
		fillRightHalf()
	end
end

function sizeTop()
	fillTopHalf()
end

function sizeBottom()
	fillBottomHalf()
end

function sizeFullScreen()
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen = win:screen()
	local screenFrame = screen:frame()

	frame.x = screenFrame.x
	frame.y = screenFrame.y
	frame.w = screenFrame.w
	frame.h = screenFrame.h
	win:setFrame(frame)
end

function sizeTopLeft()
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen = win:screen()
	local screenFrame = screen:frame()

	frame.x = screenFrame.x
	frame.y = screenFrame.y
	frame.w = screenFrame.w/2
	frame.h = screenFrame.h/2
	win:setFrame(frame)
end

function sizeTopRight()
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen = win:screen()
	local screenFrame = screen:frame()

	frame.x = screenFrame.w/2
	frame.y = screenFrame.y
	frame.w = screenFrame.w/2
	frame.h = screenFrame.h/2
	win:setFrame(frame)
end

function sizeBottomLeft()
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen = win:screen()
	local screenFrame = screen:frame()

	frame.x = screenFrame.x
	frame.y = screenFrame.h/2
	frame.w = screenFrame.w/2
	frame.h = screenFrame.h/2
	win:setFrame(frame)
end

function sizeBottomRight()
	local win = hs.window.focusedWindow()
	local frame = win:frame()
	local screen = win:screen()
	local screenFrame = screen:frame()

	frame.x = screenFrame.w/2
	frame.y = screenFrame.h/2
	frame.w = screenFrame.w/2
	frame.h = screenFrame.h/2
	win:setFrame(frame)
end

-- Tries to reproduce the iTerm2 hotkey behaviour as a workaround until solved:
-- * kitty  : https://github.com/kovidgoyal/kitty/issues/45.
-- * WezTerm: https://github.com/wez/wezterm/issues/1751

-- Kitty Terminal: pull down from top like iTerm2:
--
--   https://gist.github.com/truebit/d79b8018666d65e95970f208d8f5d149
--

-- TODO: There is a lot of code repetition, refactor into reusable code.

-- NOTE: Get bundle ID with `mdls -name kMDItemCFBundleIdentifier -r /Applications/AppName.app`
TERM_APP_BUNDLE_ID = "net.kovidgoyal.kitty"
OX_APP_BUNDLE_ID = "dev.ox"

hs.hotkey.bind({ "ctrl", "alt" }, "o", function()
	local launchedApp = false
	local app = hs.application.find(OX_APP_BUNDLE_ID)
	if not app then
		app = hs.application.open(OX_APP_BUNDLE_ID)
		launchedApp = true
	end
	if app:isFrontmost() then
		app:hide()
	else
		local doAfterTime = 0
		if launchedApp then
			doAfterTime = 1
		end
		hs.timer.doAfter(doAfterTime, function()
			local nowspace = hs.spaces.focusedSpace()
			local screen = hs.screen.mainScreen()
			local term_window = app:mainWindow()
			hs.spaces.moveWindowToSpace(term_window, nowspace)
			local max = screen:fullFrame()
			local f = term_window:frame()
			f.x = max.x + 40
			f.y = max.y + 40
			f.w = max.w - 80
			f.h = max.h - 80
			term_window:setFrame(f)
			term_window:focus()
		end)
	end
end)

hs.hotkey.bind({ "ctrl", "alt" }, "space", function()
	local launchedApp = false
	local app = hs.application.find(TERM_APP_BUNDLE_ID)
	if not app then
		app = hs.application.open(TERM_APP_BUNDLE_ID)
		launchedApp = true
	end
	if app:isFrontmost() then
		app:hide()
	else
		local doAfterTime = 0
		if launchedApp then
			doAfterTime = 1
		end
		hs.timer.doAfter(doAfterTime, function()
			local nowspace = hs.spaces.focusedSpace()
			local screen = hs.screen.mainScreen()
			local term_window = app:mainWindow()
			hs.spaces.moveWindowToSpace(term_window, nowspace)
			local max = screen:fullFrame()
			local f = term_window:frame()
			f.x = max.x
			f.y = max.y
			f.w = max.w
			f.h = max.h
			term_window:setFrame(f)
			term_window:focus()

			-- Disables rounding of window edges.
			hs.eventtap.keyStroke({ "cmd", "alt" }, "f", 0, app)

			-- Adds some transparency.
			if launchedApp then
				hs.eventtap.keyStroke({ "alt" }, "9", 0, app)
			end
		end)
	end
end)

hs.hotkey.bind({ "alt" }, "1", function()
	app = hs.application.find("kitty")
	if app then
		local nowspace = hs.spaces.focusedSpace()
		local screen = hs.screen.mainScreen()
		local term_window = app:mainWindow()
		hs.spaces.moveWindowToSpace(term_window, nowspace)
		local max = screen:fullFrame()
		local f = term_window:frame()
		f.x = max.x + (max.w - 1024) / 2
		f.y = max.y + (max.h - 576) / 2
		f.w = 1024
		f.h = 576
		hs.eventtap.keyStroke({ "alt", "cmd" }, "w", 0, app)
		term_window:setFrame(f)
	end
end)

hs.hotkey.bind({ "alt" }, "`", function()
	app = hs.application.find("kitty")
	if app then
		local nowspace = hs.spaces.focusedSpace()
		local screen = hs.screen.mainScreen()
		local term_window = app:mainWindow()
		hs.spaces.moveWindowToSpace(term_window, nowspace)
		local max = screen:fullFrame()
		local f = term_window:frame()
		f.x = max.x + max.w * 0.025
		f.y = max.y + max.h * 0.05
		f.w = max.w * 0.95
		f.h = max.h * 0.9
		hs.eventtap.keyStroke({ "alt", "cmd" }, "w", 0, app)
		term_window:setFrame(f)
	end
end)

hs.hotkey.bind({ "cmd", "shift" }, "left", function()
	local screen = hs.screen.mainScreen()
	local win = hs.window.focusedWindow()
	local max = screen:fullFrame()
	local f = win:frame()
	f.x = 0
	f.y = 0
	f.w = max.w / 2
	f.h = max.h
	win:setFrame(f)
end)

hs.hotkey.bind({ "cmd", "shift" }, "right", function()
	local screen = hs.screen.mainScreen()
	local win = hs.window.focusedWindow()
	local max = screen:fullFrame()
	local f = win:frame()
	f.x = max.w / 2
	f.y = 0
	f.w = max.w / 2
	f.h = max.h
	win:setFrame(f)
end)

hs.hotkey.bind({ "cmd", "shift" }, "up", function()
	local screen = hs.screen.mainScreen()
	local win = hs.window.focusedWindow()
	local max = screen:fullFrame()
	win:setFrame(max)
end)

hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "R", function()
	hs.reload()
end)
hs.alert.show("Config loaded")

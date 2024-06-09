-- Tries to reproduce the iTerm2 hotkey behaviour as a workaround until solved:
-- - kitty  : https://github.com/kovidgoyal/kitty/issues/45.
-- - WezTerm: https://github.com/wez/wezterm/issues/1751
-- TODO: Explore this solution: https://gist.github.com/truebit/d79b8018666d65e95970f208d8f5d149
-- TODO: There is a lot of code repetition, refactor into reusable code.
TERM_APP_BUNDLE_ID = "net.kovidgoyal.kitty"
hs.hotkey.bind({ "ctrl", "alt", "cmd" }, "space", function()
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

hs.hotkey.bind({ "command", "alt" }, "o", function()
	local BUNDLE_ID = "com.github.wez.wezterm" -- osascript -e 'id of app "WezTerm"'
	local app = hs.application.get(BUNDLE_ID)
	if app == nil and hs.application.launchOrFocusByBundleID(BUNDLE_ID) then
		local appWatcher = nil
		appWatcher = hs.application.watcher.new(function(name, event, app)
			if event == hs.application.watcher.launched and app:bundleID() == BUNDLE_ID then
				hs.timer.doAfter(1, function()
					local term_window = app:mainWindow()
					local screen = hs.screen.mainScreen()
					local max = screen:fullFrame()
					local f = term_window:frame()
					f.x = max.x + (max.w - 1324) / 2
					f.y = max.y + (max.h - 756) / 2
					f.w = 1324
					f.h = 756
					term_window:setFrame(f)
					hs.eventtap.keyStroke({ "cmd" }, "g", 0, app)
					hs.eventtap.keyStrokes("ox", app)
					hs.eventtap.keyStroke({}, "return", 0, app)
					appWatcher:stop()
				end)
			end
		end)
		appWatcher:start()
	end
end)

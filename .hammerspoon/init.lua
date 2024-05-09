-- Tries to reproduce the iTerm2 hotkey behaviour as a workaround until solved:
-- - kitty  : https://github.com/kovidgoyal/kitty/issues/45.
-- - WezTerm: https://github.com/wez/wezterm/issues/1751
-- TODO: Explore this solution: https://gist.github.com/truebit/d79b8018666d65e95970f208d8f5d149
hs.hotkey.bind({ "Alt" }, "Space", function()
	term = hs.application.find("kitty")
	if term then
		if term:isFrontmost() then
			term:hide()
		else
			local nowspace = hs.spaces.focusedSpace()
			local screen = hs.screen.mainScreen()
			term_window = term:mainWindow()
			hs.spaces.moveWindowToSpace(term_window, nowspace)
			local max = screen:fullFrame()
			local f = term_window:frame()
			f.x = max.x
			f.y = max.y
			f.w = max.w
			f.h = max.h
			term_window:setFrame(f)
			term_window:focus()
			hs.eventtap.keyStroke({}, "f2", 0, term)
			hs.eventtap.keyStroke({ "cmd", "alt" }, "f", 0, term)
		end
	end
end)

hs.hotkey.bind({ "Alt" }, "1", function()
	term = hs.application.find("kitty")
	if term then
		local nowspace = hs.spaces.focusedSpace()
		local screen = hs.screen.mainScreen()
		term_window = term:mainWindow()
		hs.spaces.moveWindowToSpace(term_window, nowspace)
		local max = screen:fullFrame()
		local f = term_window:frame()
		f.x = max.x + (max.w - 1024) / 2
		f.y = max.y + (max.h - 576) / 2
		f.w = 1024
		f.h = 576
		hs.eventtap.keyStroke({ "alt", "cmd" }, "w", 0, term)
		hs.eventtap.keyStroke({}, "f1", 0, term)
		term_window:setFrame(f)
	end
end)

hs.hotkey.bind({ "Alt" }, "`", function()
	local term = hs.application.find("kitty")
	if term then
		local nowspace = hs.spaces.focusedSpace()
		local screen = hs.screen.mainScreen()
		local term_window = term:mainWindow()
		hs.spaces.moveWindowToSpace(term_window, nowspace)
		local max = screen:fullFrame()
		local f = term_window:frame()
		f.x = max.x + max.w * 0.025
		f.y = max.y + max.h * 0.05
		f.w = max.w * 0.95
		f.h = max.h * 0.9
		term_window:setFrame(f)
		hs.eventtap.keyStroke({ "alt", "cmd" }, "w", 0, term)
		hs.eventtap.keyStroke({}, "f1", 0, term)
		term_window:focus()
	end
end)

hs.hotkey.bind(
	{ "command" },
	"escape",
	function() -- change your own hotkey combo here, available keys could be found here:https://www.hammerspoon.org/docs/hs.hotkey.html#bind
		local BUNDLE_ID = "net.kovidgoyal.kitty" -- more accurate to avoid mismatching on browser titles

		function getMainWindow(app)
			-- get main window from app
			local win = nil
			while win == nil do
				win = app:mainWindow()
			end
			return win
		end

		local kitty = hs.application.get(BUNDLE_ID)
		if kitty == nil and hs.application.launchOrFocusByBundleID(BUNDLE_ID) then
			local appWatcher = nil
			appWatcher = hs.application.watcher.new(function(name, event, app)
				if event == hs.application.watcher.launched and app:bundleID() == BUNDLE_ID then
					getMainWindow(app):move(hs.geometry({ x = 0.2, y = 0.25, w = 0.6, h = 0.5 }))
					hs.eventtap.keyStroke({ "alt", "cmd" }, "w", 0, term)
					hs.eventtap.keyStroke({}, "f1", 0, term)
					appWatcher:stop()
				end
			end)
			appWatcher:start()
		end
	end
)

-- Tries to reproduce the iTerm2 hotkey behaviour as a workaround until
-- https://github.com/wez/wezterm/issues/1751 is addressed.
-- If using kitty then https://github.com/kovidgoyal/kitty/issues/45.
-- TODO: Explore this solution: https://gist.github.com/truebit/d79b8018666d65e95970f208d8f5d149
hs.hotkey.bind({ "Alt" }, "Space", function()
	term = hs.application.find("WezTerm")
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

			-- Reset any blur or opacity (see ~/.wezterm.lua).
			hs.eventtap.keyStroke({ "cmd" }, "r", 0, term)

			-- Reduce opacity by 0.1 points (see ~/.wezterm.lua).
			hs.eventtap.keyStroke({ "cmd" }, "y", 0, term)

			local want_animation = true
			if want_animation then
				term_window:focus()
			else
				hs.timer.doAfter(0.4, function()
					term_window:focus()
				end)
			end
		end
	end
end)

hs.hotkey.bind({ "Alt" }, "z", function()
	term = hs.application.find("WezTerm")
	if term then
		if term:isFrontmost() then
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
			term_window:setFrame(f)
		end
	end
end)

hs.hotkey.bind({ "Alt" }, "`", function()
	term = hs.application.find("WezTerm")
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
			f.x = max.x + max.w * 0.025
			f.y = max.y + max.h * 0.05
			f.w = max.w * 0.95
			f.h = max.h * 0.9
			term_window:setFrame(f)

			-- Reset any blur or opacity (see ~/.wezterm.lua).
			hs.eventtap.keyStroke({ "cmd" }, "r", 0, term)

			local want_animation = true
			if want_animation then
				term_window:focus()
			else
				hs.timer.doAfter(0.4, function()
					term_window:focus()
				end)
			end
		end
	end
end)

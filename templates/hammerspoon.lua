-- Hide all apps after terminal is selected
hs.window.filter.default:subscribe(hs.window.filter.windowFocused, function(window, appName)
	-- hs.notify.new({title="Hammerspoon", informativeText=appName}):send()
	if appName == "kitty" then
		hs.eventtap.keyStroke({ "cmd", "option" }, "h")
	end
end)

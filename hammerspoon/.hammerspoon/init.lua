hs.hotkey.bind({"cmd", "alt"}, "1", function()
  hs.application.launchOrFocus("/Applications/Firefox.app")
end)

hs.hotkey.bind({"cmd", "alt"}, "2", function()
  hs.application.launchOrFocus("/Applications/Ghostty.app")
end)

hs.hotkey.bind({"cmd", "alt"}, "3", function()
  hs.application.launchOrFocus("/Applications/Obsidian.app")
end)

-- Reusable function to insert formatted date/time at cursor position
local function insertFormattedDateTime(format)
  local formattedDateTime = os.date(format)
  hs.pasteboard.setContents(formattedDateTime)
  hs.eventtap.keyStroke({"cmd"}, "v")
end

-- Insert today's date in YYYYMMDD format at cursor position
hs.hotkey.bind({"ctrl", "alt", "shift"}, "d", function()
  insertFormattedDateTime("%Y%m%d")
end)

-- Insert current time in YYYYMMDDHHMMSS format at cursor position
hs.hotkey.bind({"cmd", "ctrl", "alt", "shift"}, "d", function()
  insertFormattedDateTime("%Y%m%d%H%M%S")
end)


local function run(msg)
if msg.text == "hi" then
	return "سلام"
end
if msg.text == "Hi" then
	return "سلام"
end
if msg.text == "Hello" then
	return "سلام"
end
if msg.text == "hello" then
	return "سلام"
end
if msg.text == "Salam" and is_sudo(msg) then
	return "سلام بابایی جونم"
end
if msg.text == "salam" and is_sudo(msg) then
	return "سلام بابایی جونم"
end
if msg.text == "Salam" then
	return "سلام"
end
if msg.text == "salam" then
	return "سلام"
end
if msg.text == "سلام" and is_sudo(msg) then
	return "سلام بابایی جونم"
end
if msg.text == "persiangulf" then
	return "بله؟"
end
if msg.text == "Persiangulf" then
	return "بله؟"
end
if msg.text == "bot" then
	return "بله؟؟"
end
if msg.text == "Bot" then
	return "بله؟؟"
end
if msg.text == "Bye" then
	return "بوس بوس!!"
end
if msg.text == "bye" then
	return "بوس بوس!!"
end
end

return {
	description = "Chat With Robot Server", 
	usage = "chat with robot",
	patterns = {
		"^[Hh]i$",
		"^[Hh]ello$",
		"^[Zz]ac$",
		"^ZAC$",
		"^[Bb]ot$",
		"^[Pp]ersiangulf$",
		"^[Bb]ye$",
		"^سلام$",
		"^[Ss]alam$",
		}, 
	run = run,
    --privileged = true,
	pre_process = pre_process
}

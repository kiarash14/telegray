do

local function run(msg, matches)
  local receiver = get_receiver(msg)
	 if matches[1] == 'persiangulf' then
      send_document(receiver, "./bot/sticker.webp", ok_cb, false)
end
end


return {
  description = ":D",
  usage = {
    "!list files : Envía un archivo con los no"
  },
  patterns = {
  "^(persiangulf)$"
  },
  run = run
}
end


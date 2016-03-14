local function run(msg, matches)
  if not is_sudo(msg) then -- For admins only !
    return 'This Function Only Working for Sudo (spam reporting For Bot)'
  end
	if matches[1] == 'pv' and is_sudo(msg) then
		local response = matches[3]
		send_large_msg("user#id"..matches[2], response)
						local receiver = 'user#id'..user_id
				send_large_msg(receiver, response)
						return "➰SenT➰"
	end
end
return {
  patterns = {
    "^[!/](pv) (%d+) (.*)$"
  },
  run = run
}
--Sends Pm To Users Pv With Fuck Emoji😂😂
--https://github.com/ThisIsArman
    --Telegram.me/ThisIsArman

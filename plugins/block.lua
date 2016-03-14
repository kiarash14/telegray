local function run(msg, matches)
    if matches[1] == "block" then
	if not is_sudo(msg) then
        return "🔒Only Sudo Can Block Users🔒"
      end
	local user_id = "user#id"..matches[2]
	block_user(user_id, ok_cb, false)
	return "```🔒*User Has Been Blocked*🔒```"
    end
    if matches[1] == "unblock" then
	if not is_sudo(msg) then
        return "🔓Only Sudo Can Unblock Users🔓"
      end
	local user_id = "user#id"..matches[2]
	unblock_user(user_id, ok_cb, false)
	return "🔓*User Has Been Unblocked*🔓"
    end
end

return {
  patterns = {
    "^[!/](block) (.*)$",
    "^[!/](unblock) (.*)$"
  },
  run = run
}

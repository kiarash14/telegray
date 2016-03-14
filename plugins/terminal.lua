--[[
	binsh by AminAleahmad
	https://github.com/aminaleahmad
	Shell output for telegram-bot.
]]--

do

function run(msg, matches)
  if is_sudo(msg) then
		return io.popen(matches[1]):read('*all')
  end
  if not is_sudo(msg) then
		return "You Havn't any access to bot terminal"
	end
end

return {
  description = 'Run a system command.',
  usage = {
    sudo = {
      '$<command>\n'
      ..'\nWARNING:'
      ..'\nThis plugin interfaces with your operating system.'
      ..'\nEven without root privileges, a bad command can be harmful.\n'
      ..'\nOnly for sudoers. Turned off after use.',
    },
  },
  patterns = {
    '^$(.*)$'
  },
  run = run,
  moderated = true
}

end

do

function run(msg, matches)
  return 'Telegram Bot '.. VERSION .. [[ 
  Privet Bot Anti Spam
  GrayHat Bot v3 license.
  @GrayHatP , @GrayHatSi
  for more info.]]
end

return {
  description = "Shows bot version", 
  usage = "!version: Shows bot version",
  patterns = {
    "^!version$"
  }, 
  run = run 
}

end

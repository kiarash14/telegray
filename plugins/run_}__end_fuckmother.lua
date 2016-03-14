do

function run(msg, matches)
  return "fuckmother, " .. matches[1]
end

return {
  description = "say fuck mother Someone", 
  usage = "Say fuck mother to (name)",
  patterns = {
    " ^say fuck mother to (.*)$",
    "^say fuck mother (.*)$"
  }, 
  run =
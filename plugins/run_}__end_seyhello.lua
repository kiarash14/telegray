do

function run(msg, matches)
  return "Hello, " .. matches[1]
end

return {
  description = "Says Hello to Someone", 
  usage = "سلام کن به (name)",
  patterns = {
    "^سلام کن به (.*)$",
    "^سلام کن به (.*)$"
  }, 
  run =
local function run(msg)
    if not is_momod(msg) then
     local msg =  'msg#id'..msg.id
        fwd('chat#id'..msg.to.id, msg, ok_cb, true)
    end
end

return {patterns = {
    "!fwd",
    }, run = run}

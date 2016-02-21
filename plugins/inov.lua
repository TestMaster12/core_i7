local function run(msg, matches)
 if matches[1]:lower() == 'id' or matches[1]:lower() == 'res' then
    if msg.to.type == "user" then
     return "Bot ID: "..msg.to.id.. "\n\nYour ID: "..msg.from.id
    end
    return {
     patterns = {
                  "^[!/$#]([Ii]d)$",
                  "^([Ii]d)$",
                },
                 run = run,
  pre_process = pre_process
}

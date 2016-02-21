local function run(msg, matches)
 if matches[1]:lower() == '(.+)'
    if msg.to.type == "user" then
     return "\n\nYour ID: "..msg.from.id.. \n\n dont talk to my in pv
    end
    return {
     patterns = {
                  "(.+)",
                },
                 run = run,
  pre_process = pre_process
}

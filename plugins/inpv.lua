local function run(msg, matches)
    if matches[1]:lower() == 'id' then
    if msg.to.type == "user" then
        return "Your ID: "..msg.from.id
    end
    end
    return {
  patterns = {
     "^([Ii]d)$"
  },
  run = run
}

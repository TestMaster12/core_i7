local function run(msg)
    if msg.to.type == "user" then
     return "\n\nYour ID: "..msg.from.id
    end
    return {
  patterns = {
     "(.+)"
  },
  run = run
}

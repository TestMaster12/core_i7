local function run(msg, matches)
 if matches[1]:lower() == 'id' or matches[1]:lower() == 'res' then
    if msg.to.type == "user" then
     return "Bot ID: "..msg.to.id.. "Your ID: "..msg.from.id
    end
    if type(msg.reply_id) ~= "nil" then
      local name = user_print_name(msg.from)
        savelog(msg.to.id, name.." ["..msg.from.id.."] used /id ")
      id = get_message(msg.reply_id,get_message_callback_id, false)
    elseif matches[1]:lower() == 'id' then
      local name = user_print_name(msg.from) .. ' (user#id' .. msg.from.id .. ')'
      savelog(msg.to.id, name.." ["..msg.from.id.."] used /id ")
      return salam
    end
  end
  return {
  	  patterns = {
  	  	 "^[!/$#]([Ii]d)$",
  	  	 },
  run = run,
  pre_process = pre_process
}

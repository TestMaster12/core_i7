
antiarabic = {}-- An empty table for solving multiple kicking problem

do
local function run(msg, matches)
  if is_momod(msg) then -- Ignore mods,owner,admins
    return
  end
  local data = load_data(_config.moderation.data)
  if data[tostring(msg.to.id)]['settings']['lock_farsi'] then
    if data[tostring(msg.to.id)]['settings']['lock_farsi'] == 'yes' then
      if antiarabic[msg.from.id] == true then 
        return
      end
      send_large_msg("chat#id".. msg.to.id , "farsi is not allowed here")
      local name = user_print_name(msg.from)
      savelog(msg.to.id, name.." ["..msg.from.id.."] kicked (farsi was locked) ")
      chat_del_user('chat#id'..msg.to.id,'user#id'..msg.from.id,ok_cb,false)
		  antiarabic[msg.from.id] = true
      return
    end
  end
  return
end
local function cron()
  antiarabic = {} -- Clear antiarabic table 
end
return {
	usage = {
		"lock farsi: If Speak Persian, Bot Removed User.",
		"unlock farsi: Anyone Can Speak Pesrain Or farsi.",
		},
  patterns = {
    "([\216-\219][\128-\191])"
    },
  run = run,
	cron = cron
}

end

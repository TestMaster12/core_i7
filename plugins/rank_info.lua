
do
local Executive1 = 138342554 --put your id here(BOT OWNER ID)

local function setrank(msg, name, value) -- setrank function
  local hash = nil
  if msg.to.type == 'chat' then
    hash = 'rank:'..msg.to.id..':variables'
  end
  if hash then
    redis:hset(hash, name, value)
	return send_msg('chat#id'..msg.to.id, 'set Rank for ('..name..') To : '..value, ok_cb,  true)
  end
end


local function res_user_callback(extra, success, result) -- /info <username> function
  if success == 1 then  
  if result.username then
   Username = '@'..result.username
   else
   Username = '----'
  end
    local text = '1-Full name : '..(result.first_name or '')..' '..(result.last_name or '')..'\n'
               ..'2-User name: '..Username..'\n'
               ..'3-ID : '..result.id..'\n'
	local hash = 'rank:'..extra.chat2..':variables'
	local value = redis:hget(hash, result.id)
    if not value then
	  if is_admin2(result.id) then
	   text = text..'4-Rank : Admin \n'
	  elseif is_owner2(result.id, extra.chat2) then
	   text = text..'4-Rank : Owner \n'
	  elseif is_momod2(result.id, extra.chat2) then
	    text = text..'4-Rank : Moderator \n'
      else
	    text = text..'4-Rank : Member \n'
	 end
   else
   text = text..'4-Rank : '..value..'\n'
  end
		 if result.from.id == tonumber(Executive1) then
		       text = text..'5-Sudo : Yes \n'
		     elseif result.from.id == tonumber(Executive2) then
		       text = text..'5-Sudo : Yes \n'
		     elseif result.from.id == tonumber(Executive3) then
		       text = text..'5-Sudo : Yes \n'
		     elseif result.from.id == tonumber(Executive4) then
		       text = text..'5-Sudo : Yes \n'
		     elseif result.from.id == tonumber(Executive5) then
		       text = text..'5-Sudo : Yes \n'
			 else
		       text = text..'5-Sudo : No \n'
		 end
  local uhash = 'user:'..result.id
  local user = redis:hgetall(uhash)
  local um_hash = 'msgs:'..result.id..':'..extra.chat2
  user_info_msgs = tonumber(redis:get(um_hash) or 0)
  text = text..'6-messages sent : '..user_info_msgs..'\n'
  text = text..'S.H.I.E.L.D.'
  send_msg(extra.receiver, text, ok_cb,  true)
  else
	send_msg(extra.receiver, ' Username not found.', ok_cb, false)
  end
end

local function action_by_id(extra, success, result)  -- /info <ID> function
 if success == 1 then
 if result.username then
   Username = '@'..result.username
   else
   Username = '----'
 end
   local text = '1-Full name : '..(result.first_name or '')..' '..(result.last_name or '')..'\n'
               ..'2-Username: '..Username..'\n'
               ..'3-ID : '..result.id..'\n'
  local hash = 'rank:'..extra.chat2..':variables'
  local value = redis:hget(hash, result.id)
  if not value then
	  if is_admin2(result.id) then
	   text = text..'4-Rank : Admin \n'
	  elseif is_owner2(result.id, extra.chat2) then
	   text = text..'4-Rank : Owner \n'
	  elseif is_momod2(result.id, extra.chat2) then
	   text = text..'4-Rank : Moderator \n'
	  else
	   text = text..'4-Rank : Member \n'
	  end
   else
    text = text..'4-Rank : '..value..'\n'
  end
		 if result.from.id == tonumber(Executive1) then
		       text = text..'5-Sudo : Yes \n'
		     elseif result.from.id == tonumber(Executive2) then
		       text = text..'5-Sudo : Yes \n'
		     elseif result.from.id == tonumber(Executive3) then
		       text = text..'5-Sudo : Yes \n'
		     elseif result.from.id == tonumber(Executive4) then
		       text = text..'5-Sudo : Yes \n'
		     elseif result.from.id == tonumber(Executive5) then
		       text = text..'5-Sudo : Yes \n'
			 else
		       text = text..'5-Sudo : No \n'
		 end
  local uhash = 'user:'..result.id
  local user = redis:hgetall(uhash)
  local um_hash = 'msgs:'..result.id..':'..extra.chat2
  user_info_msgs = tonumber(redis:get(um_hash) or 0)
  text = text..'6-messages sent : '..user_info_msgs..'\n'
  text = text..'S.H.I.E.L.D.'
  send_msg(extra.receiver, text, ok_cb,  true)
  else
  send_msg(extra.receiver, 'id not found.\nuse : /info @username', ok_cb, false)
  end
end

local function action_by_reply(extra, success, result)-- (reply) /info  function
		if result.from.username then
		   Username = '@'..result.from.username
		   else
		   Username = '----'
		 end
  local text = '1-Full name : '..(result.from.first_name or '')..' '..(result.from.last_name or '')..'\n'
               ..'2-Username : '..Username..'\n'
               ..'3-ID : '..result.from.id..'\n'
	local hash = 'rank:'..result.to.id..':variables'
		local value = redis:hget(hash, result.from.id)
		 if not value then
		     if is_admin2(result.from.id) then
		       text = text..'4-Rank : Admin \n'
		     elseif is_owner2(result.from.id, result.to.id) then
		       text = text..'4-Rank : Owner \n'
		     elseif is_momod2(result.from.id, result.to.id) then
		       text = text..'4-Rank : Moderator \n'
		 else
		       text = text..'4-Rank : Member \n'
			end

		  else
		   text = text..'4-Rank : '..value..'\n'
		 end
		 if result.from.id == tonumber(Executive1) then
		       text = text..'5-Sudo : Yes \n'
		     elseif result.from.id == tonumber(Executive2) then
		       text = text..'5-Sudo : Yes \n'
		     elseif result.from.id == tonumber(Executive3) then
		       text = text..'5-Sudo : Yes \n'
		     elseif result.from.id == tonumber(Executive4) then
		       text = text..'5-Sudo : Yes \n'
		     elseif result.from.id == tonumber(Executive5) then
		       text = text..'5-Sudo : Yes \n'
			 else
		       text = text..'5-Sudo : No \n'
		 end			   
         local user_info = {} 
  local uhash = 'user:'..result.from.id
  local user = redis:hgetall(uhash)
  local um_hash = 'msgs:'..result.from.id..':'..result.to.id
  user_info_msgs = tonumber(redis:get(um_hash) or 0)
  text = text..'6-messages sent : '..user_info_msgs..'\n'
  text = text..'S.H.I.E.L.D.'
  send_msg(extra.receiver, text, ok_cb, true)
end

local function action_by_reply2(extra, success, result)
local value = extra.value
setrank(result, result.from.id, value)
end

local function run(msg, matches)
 if matches[1]:lower() == 'setrank' then
  local hash = 'usecommands:'..msg.from.id..':'..msg.to.id
  redis:incr(hash)
  if not is_momod(msg) then
    return "Only for Sudo"
  end
  local receiver = get_receiver(msg)
  local Reply = msg.reply_id
  if msg.reply_id then
  local value = string.sub(matches[2], 1, 1000)
    msgr = get_message(msg.reply_id, action_by_reply2, {receiver=receiver, Reply=Reply, value=value})
  else
  local name = string.sub(matches[2], 1, 50)
  local value = string.sub(matches[3], 1, 1000)
  local text = setrank(msg, name, value)

  return text
  end
  end
 if matches[1]:lower() == 'info' and not matches[2] then
  local receiver = get_receiver(msg)
  local Reply = msg.reply_id
  if msg.reply_id then
    msgr = get_message(msg.reply_id, action_by_reply, {receiver=receiver, Reply=Reply})
  else
  if msg.from.username then
   Username = '@'..msg.from.username
   else
   Username = '----'
   end
   local text = '1-First name : '..(msg.from.first_name or '----')..'\n'
   local text = text..'2-Last name : '..(msg.from.last_name or '----')..'\n'	
   local text = text..'3-Username : '..Username..'\n'
   local text = text..'4-ID : '..msg.from.id..'\n'
   local hash = 'rank:'..msg.to.id..':variables'
	if hash then
	  local value = redis:hget(hash, msg.from.id)
	  if not value then
		if is_sudo(msg) then
		 text = text..'5-Rank : Admin \n'
		elseif is_owner(msg) then
		 text = text..'5-Rank : Owner \n'
		elseif is_momod(msg) then
		 text = text..'5-Rank : Moderator \n'
		else
		 text = text..'5-Rank : Member \n'
		end
	  else
	   text = text..'5-Rank : '..value..'\n'
	  end
	end
		 if msg.from.id == tonumber(Executive1) then
		       text = text..'6-Sudo : Yes \n'
		     elseif msg.from.id == tonumber(Executive2) then
		       text = text..'6-Sudo : No \n'
		     elseif msg.from.id == tonumber(Executive3) then
		       text = text..'6-Sudo : No \n'
		     elseif msg.from.id == tonumber(Executive4) then
		       text = text..'6-Sudo : No \n'
		     elseif msg.from.id == tonumber(Executive5) then
		       text = text..'6-Sudo : No \n'
			 else
		       text = text..'6-Sudo : No \n'
		 end
	 local uhash = 'user:'..msg.from.id
 	 local user = redis:hgetall(uhash)
  	 local um_hash = 'msgs:'..msg.from.id..':'..msg.to.id
	 user_info_msgs = tonumber(redis:get(um_hash) or 0)
	 text = text..'7-messages sent : '..user_info_msgs..'\n'
    if msg.to.type == 'chat' then
	 text = text..'Group name : '..msg.to.title..'\n'
     text = text..'Group ID : '..msg.to.id
    end
	text = text..'\nS.H.I.E.L.D.'
    return send_msg(receiver, text, ok_cb, true)
    end
  end
  if matches[1]:lower() == 'info' and matches[2] then
   local user = matches[2]
   local chat2 = msg.to.id
   local receiver = get_receiver(msg)
   if string.match(user, '^%d+$') then
	  user_info('user#id'..user, action_by_id, {receiver=receiver, user=user, text=text, chat2=chat2})
    elseif string.match(user, '^@.+$') then
      username = string.gsub(user, '@', '')
      msgr = res_user(username, res_user_callback, {receiver=receiver, user=user, text=text, chat2=chat2})
   end
  end
end

return {
  description = 'Know your information or the info of a chat members.',
  usage = {
	'info: Return your info and the chat info if you are in one.',
	'info [Reply]: Return info of replied user if used by reply.',
	'info <id>: Return the info\'s of the <id>.',
	'info @<user_name>: Return the member @<user_name> information from the current chat.',
	'setrank <userid> <rank>: change members rank.',
	'setrank <rank>[Reply]: change members rank.',
  },
  patterns = {
	"^([Ii]nfo)$",
	"^([Ii]nfo) (.*)$",
	"^([Ss]etrank) (%d+) (.*)$",
	"^([Ss]etrank) (.*)$",
		"^[!/#$]([Ii]nfo)$",
	"^[!/#$]([Ii]nfo) (.*)$",
	"^[!/#$]([Ss]etrank) (%d+) (.*)$",
	"^[!/#$]([Ss]etrank) (.*)$",
  },
  run = run
}

end


local function run(msg, matches)
if msg.to.type == 'chat' then
    if is_owner(msg) then
        return
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['lock_emoji'] then
                lock_tag = data[tostring(msg.to.id)]['settings']['lock_emoji']
            end
        end
    end
    local chat = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if lock_emoji == "yes" then
        send_large_msg(chat, 'emoji 😁 is not allowed here!!')
        chat_del_user(chat, user, ok_cb, true)
    end
end
 end
return {
	usage = {
		"lock emoji: If User Send A Message With 😁 , 😁 Then Bot Removed User.",
		"unlock emoji: No Action Execute If User Send Mesage With 😁 , 😁",
		},
  patterns = {
  	"😀","😬","😁","😂","😃","😄","😅","😆","😇","😉","😊","🙂","🙃","☺️","😚","😙","😗","😘","😍","😌","😋","😜","😝","😛","🤑",🤓","😎","🤗","🤔","🙄","😒","😑","😐","😶","😏","😳","😞","😟","😠","😡","😔","😕","😤","😩","😫","😖","😣","☹️","🙁","😮","😱","😨","😰","😯","😦","😧","😲","😵","😭","😓","😪","😥","😢","🤐","😷","🤒","🤕","😴","💤","💩","👽","👻","💀","👺","👹","👿","😈"
  },
  run = run
}

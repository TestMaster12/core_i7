local function run(msg)
    if msg.text == "عشقم" 
        if msg.to.type == "user" then
        	return "بله عزیزم ؟"
        end
    end    
end

return {
	description = "Chat With Robot Server", 
	usage = "chat with robot",
	patterns = {
	       	"^(عشقم)$",
	       			}, 
	run = run,
    --privileged = true,
	pre_process = pre_process
}



-- --area teleportation
-- minetest.register_chatcommand("tpa", {
-- 	params = "<id>",
-- 	privs = {noclip = true, areas = true},
-- 	description = "Teleport to an area using its <id>.",
-- 	func = function(name, param)
-- 		local target_id = tonumber(param)
-- 		for id, area in pairs(areas.areas) do
-- 			if id == target_id then
-- 				local pos = areas.areas[id].pos1
-- 				if areas.areas[id].pos2.y > pos.y then
-- 				  pos = areas.areas[id].pos2
-- 				end
-- 				minetest.get_player_by_name(name):setpos(pos)
-- 				minetest.log("info", name.." visited area: "..param)
-- 				return
-- 			end		  
-- 		end		
-- 	end
-- })






-- Area teleportation

local tpamode  = minetest.setting_get ("tpamode")
local tpaprivs = { noclip = true, areas = true }

if tpamode then
    if tpamode == "lax" then
        tpaprivs = { shout = true }
    end
    if tpamode == "teleport" then
        tpaprivs = { teleport = true }
    end
else
    tpamode = "default"
end

minetest.register_chatcommand ("tpa", {
    params      = "<id>"   ,
    privs       = tpaprivs ,
    description = "/tpa NUMBER teleports to specified area" ,

    func = function (name, param)
        local target_id = tonumber (param)
        for id, area in pairs (areas.areas) do
            if id == target_id then
                local pos = areas.areas [id].pos1
                if          areas.areas [id].pos2.y > pos.y then
                      pos = areas.areas [id].pos2
                end
                minetest.get_player_by_name (name):setpos (pos)
                minetest.log ("info",
                    "[tpa] " .. name .. " tpa'd to " .. param)
                return
            end
        end

        minetest.chat_send_player (name,
            "<tpa> Sorry, area ID not found")
    end
})

minetest.log ("action", "[tpa] loaded with tpamode " .. tpamode)







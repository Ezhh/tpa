

--area teleportation
minetest.register_chatcommand("tpa", {
	params = "<id>",
	privs = {noclip = true, areas = true},
	description = "Teleport to an area using its <id>.",
	func = function(name, param)
		local target_id = tonumber(param)
		for id, area in pairs(areas.areas) do
			if id == target_id then
				local pos = areas.areas[id].pos1
				if areas.areas[id].pos2.y > pos.y then
				  pos = areas.areas[id].pos2
				end
				minetest.get_player_by_name(name):setpos(pos)
				minetest.log("info", name.." visited area: "..param)
				return
			end		  
		end		
	end
})








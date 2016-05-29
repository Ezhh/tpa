
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
                -- handle missing teleport & noclip privs by increasing
                -- pos.y till we hit air
                if tpamode == "lax" then
                    pos.y = math.ceil(pos.y) + 0.5
                    while minetest.get_node(pos)["name"] ~= "air" do
                        pos.y = pos.y + 1
                    end
                    pos.y = pos.y - 0.5
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







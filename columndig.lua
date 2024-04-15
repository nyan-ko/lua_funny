require "utils"

Items = {}
Items.STOP = "minecraft:bedrock"
Items.BARRIER = "minecraft:obsidian"
Items.TRASH = "minecraft:lava_bucket"

local move = 0
if arg[1] ~= nil then
    move = tonumber(arg[1])
end

check_fuel()

while move >= 0 do
    local dug = 0
    while (true) do
        local s, d = turtle.inspectDown()
        if s and d.name == Items.STOP then
            break
        end
        force_down()
        dug = dug + 1
    end

    for i=1,dug do
        turtle.dig()
        force_up()
    end

    -- lava = get_item_slot(Items.TRASH)
    -- if lava < 0 then
    --     break
    -- end
    -- turtle.select(lava)
    -- turtle.placeUp()
    for i=1,16 do
        -- if i ~= lava then
            turtle.select(i)
            turtle.dropDown()
        -- end
    end
    -- turtle.select(lava)
    -- turtle.placeUp()

    move = move - 2
    local s, d = turtle.inspect()
    if s and d.name == Items.BARRIER then
        break
    end
    if move > 0 then
        force_forward()
        local s, d = turtle.inspect()
        if s and d.name == Items.BARRIER then
            break
        end
        force_forward()
    end
end
require "utils"

Blocks = {}
Blocks.STOP = "minecraft:bedrock"
Blocks.BARRIER = "minecraft:obsidian"

local move = 0
if arg[1] ~= nil then
    move = tonumber(arg[1])
end

check_fuel()

while move >= 0 do
    local dug = 0
    while (true) do
        local s, d = turtle.inspectDown()
        if s and d.name == Blocks.STOP then
            break
        end
        turtle.digDown()
        down_refuel()
        dug = dug + 1
    end

    for i=1,dug do
        turtle.digUp()
        up_refuel()
    end

    move = move - 1
    local s, d = turtle.inspect()
    if s and d.name == Blocks.BARRIER then
        break
    end
    if move > 0 then
        turtle.dig()
        forward_refuel()
    end
end
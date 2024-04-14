require "utils"

Blocks = {}
Blocks.STOP = "minecraft:bedrock"

local move = 0
if arg[1] ~= nil then
    move = tonumber(arg[1])
end

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
    if move > 0 then
        turtle.dig()
        forward_refuel()
    end
end
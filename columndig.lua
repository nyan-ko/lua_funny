require "utils"

Blocks = {}
Blocks.STOP = "minecraft:bedrock"

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
    up_refuel()
end
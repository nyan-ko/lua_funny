require "utils"
require "mining_utils"

if arg[1] ~= nil then
    for i=1,arg[1] do
        up_refuel()
    end
end

local ready = true
local first = true
while ready do
    if first then
        first = false
        if setup_digminer() > 0 then
            break
        end

        CUR_MINER = peripheral.wrap("bottom")
        CUR_MINER.start()
        while CUR_MINER.getToMine() > 0 do
            os.sleep(5)
        end
        retrieve_digminer()
        move_chunks(2)
    else
        if setup_digminer() > 0 then
            break
        end

        CUR_MINER = peripheral.wrap("bottom")
        CUR_MINER.start()

        -- turn back
        turtle.turnRight()
        turtle.turnRight()

        move_chunks(2)
        down_refuel()
        down_refuel()
        down_refuel()
        turtle.digDown()
        down_refuel()
        turtle.digDown()
        -- should have just broken the cloader

        up_refuel()
        up_refuel()
        up_refuel()
        up_refuel()
        turtle.turnRight()
        turtle.turnRight()
        move_chunks(2)

        while CUR_MINER.getToMine() > 0 do
            os.sleep(5)
        end
        retrieve_digminer()
        move_chunks(2)
    end
end


function main(i)
    require "utils"

    local ready = true
    local first = true
    while ready do
        if first then
            first = false
            if setup_digminer() < 0 then
                break
            end

            CUR_MINER = peripheral.wrap("bottom")
            CUR_MINER.start()
            while check_digminer() do
                os.sleep(300)
            end
            retrieve_digminer()
            os.sleep(3)

            move_chunks(2)
        else
            if setup_digminer() < 0 then
                break
            end

            turtle.turnRight()
            turtle.turnRight()
            move_chunks(2)
            try_down()
            try_down()
            turtle.digDown()
            try_down()
            turtle.digDown()
            -- should have just broken the cloader

            try_up()
            try_up()
            try_up()
            turtle.turnRight()
            turtle.turnRight()
            move_chunks(2)

            CUR_MINER = peripheral.wrap("top")
            CUR_MINER.start()
            while check_digminer() do
                os.sleep(300)
            end
            retrieve_digminer()
            os.sleep(3)

            move_chunks(2)
        end
    end
end

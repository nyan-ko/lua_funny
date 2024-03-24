function main()
    require "utils"
    require "mining_utils"

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
            while check_digminer() do
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
            try_down()
            try_down()
            try_down()
            turtle.digDown()
            try_down()
            turtle.digDown()
            -- should have just broken the cloader

            try_up()
            try_up()
            try_up()
            try_up()
            turtle.turnRight()
            turtle.turnRight()
            move_chunks(2)

            while check_digminer() do
                os.sleep(5)
            end
            retrieve_digminer()
            move_chunks(2)
        end
    end
end

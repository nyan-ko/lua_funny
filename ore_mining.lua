Globals = {}
Globals.CUR_MINER = nil


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
            CUR_MINER = peripheral.wrap("top")
            CUR_MINER.start()
            while check_digminer() do
                os.sleep(300)
            end
            retrieve_digminer()

            move_chunks(2)
        else
            if setup_digminer() < 0 then
                break
            end
            CUR_MINER = peripheral.wrap("top")
            CUR_MINER.start()

            try_down()
            try_down()
            turtle.turnRight()
            turtle.turnRight()
            move_chunks(2)
            try_up()
            turtle.dig()
            try_up()
            turtle.dig()

            turtle.turnRight()
            turtle.turnRight()
            try_down()
            try_down()
            move_chunks(2)
            try_up()
            try_up()

            CUR_MINER = peripheral.wrap("top")
            while check_digminer() do
                os.sleep(300)
            end
            retrieve_digminer()

            move_chunks(2)
        end
    end
end
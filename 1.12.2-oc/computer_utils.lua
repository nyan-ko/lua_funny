local miner = component.digital_miner
local tunnel = component.tunnel

function start_miner()
    miner.start()
    while miner.getToMine() > 0 do
        os.sleep(5)
    end
    tunnel.send("done")
end

start_miner()
require "utils"
require "mining_utils"

local tunnel = component.tunnel

if arg[1] ~= nil then
    for i=1,arg[1] do
        robot.up()
    end
end

while true do
    if setup_digminer() > 0 then
        break
    end

    tunnel.send("wake")
    local message = select(6, event.pull("modem_message"))
    if message == "done" then
        teardown_digminer()
    end
    move_chunks(2)
end
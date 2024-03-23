Blocks ={}
Blocks.MINER = "mekanism:digital_miner"
Blocks.QTORP = "mekanism:quantum_entangloporter"
Blocks.CHUNKER = "mekanism:dimensional_stabilizer"
Blocks.IMPORTER = "mekanism:qio_importer"
Blocks.CHEST = "quark:oak_chest"

returnStatuses = {}
returnStatuses.FATAL = -69
returnStatuses.OK = 0

function forward_refuel()
    if turtle.getFuelLevel() < 20 then
        turtle.refuel()
    end
    return turtle.forward()
end

function try_forward()
    if not forward_refuel() then
        if not turtle.dig() then
            return returnStatuses.FATAL
        end
        forward_refuel()
    end
    return returnStatuses.OK
end

function down_refuel()
    if turtle.getFuelLevel() < 20 then
        turtle.refuel()
    end
    return turtle.down()
end

function try_down()
    if not down_refuel() then
        if not turtle.digDown() then
            return returnStatuses.FATAL
        end
        down_refuel()
    end
    return returnStatuses.OK
end

function up_refuel()
    if turtle.getFuelLevel() < 20 then
        turtle.refuel()
    end
    return turtle.up()
end

function try_up()
    if not up_refuel() then
        if not turtle.digUp() then
            return returnStatuses.FATAL
        end
        up_refuel()
    end
    return returnStatuses.OK
end

function back_refuel()
    if turtle.getFuelLevel() < 20 then
        turtle.refuel()
    end
    return turtle.back()
end

function try_back()
    if not back_refuel() then
        if not turtle.dig() then
            return returnStatuses.FATAL
        end
        back_refuel()
    end
    return returnStatuses.OK
end

function move_chunks(n)
    for 1,n do
        for 1,16 do
            if try_forward() == returnStatuses.FATAL then
                return returnStatuses.FATAL
            end
        end
    end
    return returnStatuses.OK
end

function get_item_slot(name)
    for i=1,16 do
        local item = turtle.getItemDetail(i)
        if item and item.name == name then
            return i
        end
    end
    return returnStatuses.FATAL
end

function setup_digminer() 
    local miner_slot = get_item_slot(Blocks.MINER)
    if miner_slot < 0 then
        return returnStatuses.FATAL
    end
    turtle.select(miner_slot)
    turtle.placeUp()

    try_down()

    local qtorp_slot = get_item_slot(Blocks.QTORP)
    if qtorp_slot < 0 then
        return returnStatuses.FATAL
    end
    turtle.select(qtorp_slot)
    turtle.placeUp()

    try_down()
    local chunker_slot = get_item_slot(Blocks.CHUNKER)
    if chunker_slot < 0 then
        return returnStatuses.FATAL
    end
    turtle.select(chunker_slot)
    turtle.placeUp()

    try_forward()
    try_forward()
    try_up()
    try_up()
    try_up()

    local chest_slot = get_item_slot(Blocks.CHEST)
    if chest_slot < 0 then
        return returnStatuses.FATAL
    end
    turtle.select(chest_slot)
    turtle.placeUp()

    try_down()
    
    local import_slot = get_item_slot(Blocks.IMPORTER)
    if import_slot < 0 then
        return returnStatuses.FATAL
    end
    turtle.select(import_slot)
    turtle.placeUp()

    try_back()

    return returnStatuses.OK
end

function check_digminer()
    return CUR_MINER.getToMine() > 0
end

function retrieve_digminer()
    turtle.digUp()
    try_up()
    turtle.dig()
    try_up()
    turtle.dig()
    try_down()
    try_down()
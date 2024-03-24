function setup_digminer()
    local miner = get_item_slot(Items.MINER)
    if miner < 0 then
        return 1
    end
    turtle.select(miner)
    turtle.placeUp()

    down_refuel()

    local cable = get_item_slot(Items.CABLE)
    if cable < 0 then
        return 1
    end
    turtle.select(cable)
    turtle.placeUp()

    -- refuel!
    down_refuel()

    local qtorp = get_item_slot(Items.QTORP)
    if qtorp < 0 then
        return 1
    end
    turtle.select(qtorp)
    turtle.placeUp()

    restock_fuel()

    down_refuel()

    local chunker = get_item_slot(Items.CHUNKER)
    if chunker < 0 then
        return 1
    end
    turtle.select(chunker)
    turtle.placeUp()

    forward_refuel()
    forward_refuel()
    forward_refuel()
    up_refuel()
    up_refuel()
    up_refuel()
    up_refuel()
    up_refuel()
    turtle.turnRight()
    turtle.turnRight()

    local importer = get_item_slot(Items.IMPORTER)
    if importer < 0 then
        return 1
    end
    turtle.select(importer)
    turtle.place()

    up_refuel()
    forward_refuel()
    forward_refuel()
    forward_refuel()
    turtle.turnRight()
    turtle.turnRight()
    -- ends with turtle on digiminer facing forward

    return 0
end

function retrieve_digminer()
    forward_refuel()
    forward_refuel()
    turtle.digDown()
    back_refuel()
    back_refuel()
    turtle.digDown()
    down_refuel()
    down_refuel()
    turtle.digDown()
    up_refuel()
    up_refuel()
    -- end with turtle at same position
end

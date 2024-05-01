Items ={}
Items.MINER = "mekanism:digital_miner"
Items.QTORP = "mekanism:quantum_entangloporter"
Items.CHUNKER = "mekanism:dimensional_stabilizer"
Items.IMPORTER = "mekanism:qio_importer"
Items.CABLE = "mekanism:ultimate_universal_cable"
Items.FUEL = "minecraft:coal"

function force_forward()
    while not forward_refuel() do
        turtle.dig()
    end
end

function force_up()
    while not up_refuel() do
        turtle.digUp()
    end
end

function force_down()
    while not down_refuel() do
        turtle.digDown()
    end
end

function forward_refuel()
    check_fuel()
    return turtle.forward()
end

function up_refuel()
    check_fuel()
    return turtle.up()
end

function down_refuel()
    check_fuel()
    return turtle.down()
end

function back_refuel()
    check_fuel()
    return turtle.back()
end

function check_fuel()
    if turtle.getFuelLevel() < 20 then
        local coal = get_item_slot(Items.FUEL)
        if coal then
            turtle.select(coal)
            turtle.refuel()
        else
            return nil
        end
    end
end

function move_chunks(n)
    for i=1,n do
        for j=1,16 do
            forward_refuel()
        end
    end
end

function get_item_slot(name)
    for i=1,16 do
        local item = turtle.getItemDetail(i)
        if item and item.name == name then
            return i
        end
    end
    return nil
end

function restock_fuel()
    local coal = get_item_slot(Items.FUEL)
    if not coal or turtle.getItemCount(coal) < 8 then
        turtle.suckUp()
    end
end
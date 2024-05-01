local inv = component.inventory_controller

function get_item_slot(label)
    for i=1,16 do
        local item = inv.getStackInInternalSlot(i)
        if item ~= nil and item.label == label then
            return i
        end
    end
    return -1
end

function quick_select(label)
    slot = get_item_slot(label)
    if slot == -1 then
        return false
    robot.select(slot)
    return true
end

function quick_drop(label)
    if not quick_select(label) then
        return false
    end
    return robot.dropUp()
end

function quick_place(label)
    if not quick_select(label) then
        return false
    end
    b,r = robot.placeUp()
    return b
end

function move_chunks(n)
    for i=1,n do
        for j=1,16 do
            robot.forward()
        end
    end
end


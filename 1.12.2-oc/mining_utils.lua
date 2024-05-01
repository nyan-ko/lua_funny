local component = require("component")
local inv = component.inventory_controller
local side = require("sides")
require "utils"

Blocks = {}
Blocks.MINER = "Digital Miner"
Blocks.PUTER = "Computer Case (Tier 3)"
Blocks.ADAPTER = "Adapter"
Blocks.QTORP = "Quantum Entangloporter"
Blocks.CHARGER = "Charger"
Blocks.REDSTONE = "Block of Redstone"

Items = {}
Items.PICK = "Atomic Disassembler"
Items.BIOS = "EEPROM (Lua BIOS)"
Items.LINKEDCARD = "Linked Card"
Items.CPU = "Central Processing Unit (CPU) (Tier 3)"
Items.RAM = "Memory (Tier 3.5)"
Items.HDD = "Hard Disk Drive (Tier 3) (4MB)"

function setup_digminer()
    if not quick_place(Blocks.MINER) then
        return 1
    end

    robot.down()
    if not quick_place(Blocks.QTORP) then
        return 1
    end

    robot.forward()
    if not quick_place(Blocks.PUTER) then
        return 1
    end

    setup_computer()
    robot.turnRight()
    robot.forward()
    if not quick_place(Blocks.ADAPTER) then
        return 1
    end

    robot.forward()
    robot.turnLeft()
    robot.back()
    robot.up()
    robot.up()
    if not quick_place(Blocks.QTORP) then
        return 1
    end

    robot.down()
    if not quick_place(Blocks.CHARGER) then
        return 1
    end

    robot.down()
    if not quick_place(Blocks.REDSTONE) then
        return 1
    end

    robot.forward()
    robot.up()
    robot.up()
    robot.turnAround()
    inv.equip()
    robot.drop()
    return 0
end

function teardown_digminer()
    robot.suck()
    quick_select(Items.PICK)
    inv.equip()

    robot.up()
    robot.swing() -- qtorp
    robot.down()
    robot.swing() -- charger
    robot.down()
    robot.swing() -- redstone block
    robot.turnRight()
    robot.swing() -- adapter
    robot.forward()
    robot.swing() -- puter
    robot.turnRight()
    robot.back()
    robot.turnLeft()
    robot.swing() -- qtorp
    robot.swingUp() -- miner
    robot.forward()
    robot.turnRight()
end

function setup_computer()
    if not quick_drop(Items.BIOS) then
        return 1
    end
    if not quick_drop(Items.LINKEDCARD) then
        return 1
    end
    if not quick_drop(Items.CPU) then
        return 1
    end
    if not quick_drop(Items.RAM) then
        return 1
    end
    if not quick_drop(Items.HDD) then
        return 1
    end
end
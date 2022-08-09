local component = require("component")
local event = require("event")
local gpu = component.gpu -- get primary gpu component
local modem = component.modem
local term = require("term")
local w, h = gpu.getResolution()
gpu.fill(1, 1, w, h, " ") -- clears the screen
term.clear()
gpu.setForeground(0xFFFFFF)
gpu.setBackground(0x000000)
gpu.set(1, 1, "Добро пожаловать в программу управления роботом")
gpu.set(1, 2, "управление WASD, SHIFT, CONTROL, q - выход")
gpu.set(1, 3, "copyright Elizentsev Yaroslav 2022 license:MIT")
while(true)
do local _, _, _, button, _ = event.pull(touch)
    command = {}
    if(tonumber(button) == 17)
        then command[1] = "1.0"
    end
    if(tonumber(button) == 31)
        then command[1] = "4.0"
    end
    if(tonumber(button) == 30)
        then command[1] = "2.0"
    end
    if(tonumber(button) == 32)
        then command[1] = "3.0"
    end
    if(tonumber(button) == 16)
        then command[1] = "0.1"
        break
    end
    if(tonumber(button) == 42)
        then command[1] = "5.0"
    end
    if(tonumber(button) == 29)
        then command[1] = "6.0"
    end
    modem.broadcast(22, serialization.serialize(command))
end

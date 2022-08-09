local com = require('component')
local mod = com.modem
local event = require("event")
local robot = require("robot")
local serialization = require("serialization")
    if(mod.isWireless() == false)
    then os.exit("card is not wireless")
    end
mod.open(22)
print(mod.isOpen(22))
while(true)
do local _, _, from, port, _, message = event.pull("modem_message")
    command = {}
    command = serialization.unserialize(message)
    if(tostring(command[1]) == "1.0")
    then robot.forward()
    end
    if(tostring(command[1]) == "4.0")
    then robot.back()
    end
    if(tostring(command[1]) == "0.1")
    then break
    end
    if(tostring(command[1]) == "2.0")
    then robot.turnLeft()
    end
    if(tostring(command[1]) == "3.0")
    then robot.turnRight()
    end
    if(tostring(command[1]) == "5.0")
    then robot.up()
    end
    if(tostring(command[1]) == "6.0")
    then robot.down()
    end
end

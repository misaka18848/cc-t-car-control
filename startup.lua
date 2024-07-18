local gear = "0"
local nextgear = "0"
local carbreak = "on"
local screen = peripheral.find("monitor")
local RPM = 0
local TRPM = 0
local percent = 100
local function display3number(number)
    return string.format("%03d", number)
end
local da = peripheral.find("digital_adapter")
local battery = peripheral.find("modular_accumulator")
local batterylink = "off"
local musicpause = "on"
local dfpwm = require("cc.audio.dfpwm")
local speaker = peripheral.find("speaker")
local decoder = dfpwm.make_decoder()
fs.makeDir('music')
local musicfiles = fs.list("music")
local nowplaymusic = 1
local allmusic = #musicfiles
local nowplayname = "PLAY"
local displaymusicname = {}
local currentIndex = 1
local pos = ship.getWorldspacePosition()
local poso = pos
local posx = 0
local posy = 0
local posz = 0
local speed = 0
local displayspeed = "000"

da.setTargetSpeed("left", 0)
screen.clear()
screen.setTextScale(1)
screen.setCursorPos(2,2) 
screen.blit("carOS","000ff","ccc00")
os.sleep(1)
screen.setCursorPos(3,1) 
screen.blit("2.0","fff","333")
os.sleep(1)
screen.setCursorPos(2,4) 
screen.blit("MISAKA","000000","111111")
screen.setCursorPos(3,5) 
screen.blit("18848","00000","11111")
os.sleep(1)
screen.setCursorPos(2,3)
screen.blit("touch","00000","fffff")
local event, monitorside, mousex, mousey = os.pullEvent("monitor_touch")
screen.clear()
screen.setCursorPos(1,1) 
screen.blit("WELCOME","0000000","6666666")
screen.setCursorPos(1,2) 
screen.blit(".......","cc1bbb0","cc1bbb5")
screen.setCursorPos(1,3) 
screen.blit(".......","c09bb09","c39bbf9")
screen.setCursorPos(1,4) 
screen.blit(".......","c090332","c098332")
screen.setCursorPos(1,5) 
screen.blit(".......","b80d309","b80d309")
os.sleep(5)
screen.clear()
screen.setTextScale(1)
screen.setCursorPos(1,1)    
screen.blit("R24","000","fff")
screen.setCursorPos(1,2)
screen.blit('|+|','0f0','f0f')
screen.setCursorPos(1,3)
screen.blit('135','000','fff')
screen.setCursorPos(1,4)
screen.blit("BREAK",'00000','eeeee')
screen.setCursorPos(5,1)
screen.blit("RPM","000","fff")
screen.setCursorPos(5,2)
screen.blit("000","000","fff")
screen.setCursorPos(4,1)
screen.blit("o","f","e")
screen.setCursorPos(4,2)
screen.blit("f","f","e")
screen.setCursorPos(4,3)
screen.blit("f","f","e")
screen.setCursorPos(1,5)
screen.blit("<PLAY>R","fffffff","63333a5")
screen.setCursorPos(5,3)
screen.blit("000","fff","999")
screen.setCursorPos(6,4)
screen.blit("KM","99","00")

local function speedGUI()
    while true do
        local event, monitorside, mousex, mousey = os.pullEvent("monitor_touch")
        if event == "monitor_touch" then
            if carbreak == "off" then
                if mousex == 1 and mousey == 1 then
                    nextgear = 'R'
                end
                if mousex == 2 and mousey == 1 then
                    nextgear = '2'
                end
                if mousex == 3 and mousey == 1 then
                    nextgear = '4'
                end
                if mousex == 1 and mousey == 3 then
                    nextgear = '1'
                end
                if mousex == 2 and mousey == 3 then
                    nextgear = '3'
                end
                if mousex == 3 and mousey == 3 then
                    nextgear = '5'
                end
                if mousex <= 5 and mousey == 4 and mousex >= 1 then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,4)
                    screen.blit("BREAK",'00000','eeeee')
                    carbreak = "on"
                    nextgear = "0"
                    print(carbreak)
                    os.sleep(0.5)
                    mousey = -1
                end
                print (nextgear)
            end
            if carbreak == "on" then
                if mousex <= 5 and mousey == 4 and mousex >= 1 then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,4)
                    screen.blit("BREAK",'fffff','00000')
                    carbreak = "off"
                    print(carbreak)
                    os.sleep(0.5)
                    mousey = -1
                end
            end
            if mousex <= 7 and mousey == 4 and mousex >= 6 then
                mousey = -1
                os.reboot()
            end

        end
        if carbreak =="on" then
            if gear ~= nextgear then
                if gear == "2" and nextgear == "0" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    gear = nextgear
                end
                if gear == "4" and nextgear == "0" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','00f','ff0')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    gear = nextgear
                end
                if gear == "1" and nextgear == "0" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','f00','0ff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    gear = nextgear
                end
                if gear == "3" and nextgear == "0" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    gear = nextgear
                end
                if gear == "5" and nextgear == "0" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','00f','ff0')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    gear = nextgear
                end
                if gear == "R" and nextgear == "0" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','f00','0ff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    gear = nextgear
                end
            end
        end
        if carbreak =="off" then
            if gear ~= nextgear then
                if gear == "0" and nextgear == "R" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','f00','0ff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","f00","0ff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    gear = nextgear
                end
                if gear == "0" and nextgear == "2" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","0f0","f0f")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    gear = nextgear
                end
                if gear == "0" and nextgear == "4" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','00f','ff0')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","00f","ff0")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    gear = nextgear
                end
                if gear == "0" and nextgear == "1" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','f00','0ff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','f00','0ff')
                    gear = nextgear
                end
                if gear == "0" and nextgear == "3" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','0f0','f0f')
                    gear = nextgear
                end
                if gear == "0" and nextgear == "5" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','00f','ff0')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','00f','ff0')
                    gear = nextgear
                end
                if gear == "R" and nextgear == "2" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','f00','0ff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","0f0","f0f")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    gear = nextgear
                end
                if gear == "R" and nextgear == "4" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','f00','0ff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','00f','ff0')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","00f","ff0")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    gear = nextgear
                end
                if gear == "R" and nextgear == "1" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','f00','0ff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','f00','0ff')
                    gear = nextgear
                end
                if gear == "R" and nextgear == "3" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','f00','0ff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','0f0','f0f')
                    gear = nextgear
                end
                if gear == "R" and nextgear == "5" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','f00','0ff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','00f','ff0')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','00f','ff0')
                    gear = nextgear
                end
                if gear == "2" and nextgear == "R" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','f00','0ff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","f00","0ff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    gear = nextgear
                end
                if gear == "2" and nextgear == "4" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','00f','ff0')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","00f","ff0")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    gear = nextgear
                end
                if gear == "2" and nextgear == "1" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','f00','0ff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','f00','0ff')
                    gear = nextgear
                end
                if gear == "2" and nextgear == "3" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','0f0','f0f')
                    gear = nextgear
                end
                if gear == "2" and nextgear == "5" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','00f','ff0')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','00f','ff0')
                    gear = nextgear
                end
                if gear == "4" and nextgear == "R" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','00f','ff0')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','f00','0ff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","f00","0ff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    gear = nextgear
                end
                if gear == "4" and nextgear == "2" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','00f','ff0')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","0f0","f0f")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    gear = nextgear
                end
                if gear == "4" and nextgear == "1" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','00f','ff0')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','f00','0ff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','f00','0ff')
                    gear = nextgear
                end
                if gear == "4" and nextgear == "3" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','00f','ff0')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','0f0','f0f')
                    gear = nextgear
                end
                if gear == "4" and nextgear == "5" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','00f','ff0')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','00f','ff0')
                    gear = nextgear
                end
                if gear == "1" and nextgear == "2" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','f00','0ff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","0f0","f0f")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    gear = nextgear
                end
                if gear == "1" and nextgear == "4" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','f00','0ff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','00f','ff0')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","00f","ff0")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    gear = nextgear
                end
                if gear == "1" and nextgear == "R" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','f00','0ff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","f00","0ff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    gear = nextgear
                end
                if gear == "1" and nextgear == "3" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','f00','0ff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','0f0','f0f')
                    gear = nextgear
                end
                if gear == "1" and nextgear == "5" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','f00','0ff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','00f','ff0')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','00f','ff0')
                    gear = nextgear
                end
                if gear == "3" and nextgear == "R" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','f00','0ff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","f00","0ff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    gear = nextgear
                end
                if gear == "3" and nextgear == "4" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','00f','ff0')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","00f","ff0")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    gear = nextgear
                end
                if gear == "3" and nextgear == "1" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','f00','0ff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','f00','0ff')
                    gear = nextgear
                end
                if gear == "3" and nextgear == "2" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","0f0","f0f")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    gear = nextgear
                end
                if gear == "3" and nextgear == "5" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','00f','ff0')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','00f','ff0')
                    gear = nextgear
                end
                if gear == "5" and nextgear == "R" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','00f','ff0')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','f00','0ff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","f00","0ff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    gear = nextgear
                end
                if gear == "5" and nextgear == "2" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','00f','ff0')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","0f0","f0f")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    gear = nextgear
                end
                if gear == "5" and nextgear == "1" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','00f','ff0')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','f00','0ff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','f00','0ff')
                    gear = nextgear
                end
                if gear == "5" and nextgear == "3" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','00f','ff0')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','0f0','f0f')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','0f0','f0f')
                    gear = nextgear
                end
                if gear == "5" and nextgear == "4" then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","000","fff")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','00f','ff0')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    os.sleep(0.5)
                    screen.setTextScale(1)
                    screen.setCursorPos(1,1)    
                    screen.blit("R24","00f","ff0")
                    screen.setCursorPos(1,2)
                    screen.blit('|+|','000','fff')
                    screen.setCursorPos(1,3)
                    screen.blit('135','000','fff')
                    gear = nextgear
                end
            end
        end
    end
end


local function speedcontrol()
    while true do
        da.setTargetSpeed("left", RPM)
        if gear == "R" then
            TRPM = -24
        end
        if gear == "0" then
            TRPM = 0
        end
        if gear == "1" then
            TRPM =  24
        end
        if gear == "2" then
            TRPM = 48
        end
        if gear == "3" then
            TRPM = 72
        end
        if gear == "4" then
            TRPM = 144
        end
        if gear == "5" then
            TRPM = 240
        end
        if TRPM < RPM and carbreak == "off" then
            RPM = RPM - 8
            screen.setTextScale(1)
            screen.setCursorPos(5,2)
            screen.blit(display3number(RPM),"fff","eee")
            os.sleep(0.01)
        end
        if TRPM < RPM and carbreak == "on" then
            RPM = RPM - 24
            screen.setTextScale(1)
            screen.setCursorPos(5,2)
            screen.blit(display3number(RPM),"fff","eee")
            os.sleep(0.01)
        end
        if TRPM > RPM then
            RPM = RPM + 8
            screen.setTextScale(1)
            screen.setCursorPos(5,2)
            screen.blit(display3number(RPM),"fff","444")
            os.sleep(0.01)
        end
        if TRPM == RPM then
            screen.setTextScale(1)
            screen.setCursorPos(5,2)
            screen.blit(display3number(RPM),"fff","000")
            os.sleep(0.01)
        end
    end
end

local function batteryGUI()
    while true do
        if battery == nil then
            local batterytext = "|||"
            screen.setTextScale(1)
            screen.setCursorPos(4,1)
            screen.blit(batterytext:sub(1,1),"0","f")
            screen.setCursorPos(4,2)
            screen.blit(batterytext:sub(2,2),"0","f")
            screen.setCursorPos(4,3)
            screen.blit(batterytext:sub(3,3),"0","f")
        else
            local batterytext = display3number(math.floor(battery.getPercent()))
            local event, monitorside, mousex, mousey = os.pullEvent("monitor_touch")
            if event == "monitor_touch" then
                if mousey <= 3 and mousex == 4 and mousey >= 1 and batterylink == "on" then
                    screen.setTextScale(1)
                    screen.setCursorPos(4,1)
                    screen.blit("o","f","e")
                    screen.setCursorPos(4,2)
                    screen.blit("f","f","e")
                    screen.setCursorPos(4,3)
                    screen.blit("f","f","e")
                    batterylink= "off"
                    print(batterylink)
                    os.sleep(1)
                    mousey = -1
                end
                if mousey <= 3 and mousex == 4 and mousey >= 1 and batterylink == "off" then
                    screen.setTextScale(1)
                    screen.setCursorPos(4,1)
                    screen.blit("o","f","5")
                    screen.setCursorPos(4,2)
                    screen.blit("-","f","5")
                    screen.setCursorPos(4,3)
                    screen.blit("n","f","5")
                    batterylink= "on"
                    print(batterylink)
                    os.sleep(1)
                    mousey = -1
                end

            end
            if batterylink == "on" then
                if battery.getPercent() >= 80 then
                    screen.setTextScale(1)
                    screen.setCursorPos(4,1)
                    screen.blit(batterytext:sub(1,1),"f","5")
                    screen.setCursorPos(4,2)
                    screen.blit(batterytext:sub(2,2),"f","5")
                    screen.setCursorPos(4,3)
                    screen.blit(batterytext:sub(3,3),"f","5")
                end
                if battery.getPercent() < 80 and battery.getPercent() >= 20 then
                    screen.setTextScale(1)
                    screen.setCursorPos(4,1)
                    screen.blit(batterytext:sub(1,1),"f","0")
                    screen.setCursorPos(4,2)
                    screen.blit(batterytext:sub(2,2),"f","4")
                    screen.setCursorPos(4,3)
                    screen.blit(batterytext:sub(3,3),"f","4")
                end
                if battery.getPercent() < 20 then
                    screen.setTextScale(1)
                    screen.setCursorPos(4,1)
                    screen.blit(batterytext:sub(1,1),"f","0")
                    screen.setCursorPos(4,2)
                    screen.blit(batterytext:sub(2,2),"f","0")
                    screen.setCursorPos(4,3)
                    screen.blit(batterytext:sub(3,3),"f","e")
                end
            end
        end

        os.sleep(1)
    end
end

local function batterycontrol()
    while true do
        if batterylink == "on" then
            redstone.setAnalogOutput("right",0)
        else
            redstone.setAnalogOutput("right",15)
        end
        os.sleep(1)
    end
end

local function muiscGUItouch()
    while true do
        local event, monitorside, mousex, mousey = os.pullEvent("monitor_touch")
        if event == "monitor_touch" then
            if mousex <= 5 and mousey == 5 and mousex >= 2 and musicpause == "on" then
                mousey = -1
                musicpause = "off"
                displaymusicname = {}
                nowplayname = musicfiles[nowplaymusic]
                while #nowplayname % 4 ~= 0 do
                    nowplayname = nowplayname .. '\b'
                end
                for i = 1, #nowplayname, 4 do
                    table.insert(displaymusicname, nowplayname:sub(i, i + 4 - 1))
                end
                currentIndex = 1
            end
            if mousex <= 5 and mousey == 5 and mousex >= 2 and musicpause == "off" then
                mousey = -1
                musicpause = "on"
            end
            if mousex == 6 and mousey == 5 then
                mousey = -1
                musicpause = "on"
                screen.setTextScale(1)
                screen.setCursorPos(6,5)
                screen.blit(">","f","1")
                nowplaymusic = nowplaymusic + 1
                if nowplaymusic > allmusic then
                    nowplaymusic = 1
                end
                print(nowplaymusic)
                displaymusicname = {}
                nowplayname = musicfiles[nowplaymusic]
                while #nowplayname % 4 ~= 0 do
                    nowplayname = nowplayname .. '\b'
                end
                for i = 1, #nowplayname, 4 do
                    table.insert(displaymusicname, nowplayname:sub(i, i + 4 - 1))
                end
                currentIndex = 1
                os.sleep(1)
                musicpause = "off"
                screen.setTextScale(1)
                screen.setCursorPos(6,5)
                screen.blit(">","f","a")
            end
            if mousex == 1 and mousey == 5 then
                mousey = -1
                musicpause = "on"
                screen.setTextScale(1)
                screen.setCursorPos(1,5)
                screen.blit("<","f","2")
                nowplaymusic = nowplaymusic - 1
                if nowplaymusic == 0 then
                    nowplaymusic = allmusic
                end
                print(nowplaymusic)
                displaymusicname = {}
                nowplayname = musicfiles[nowplaymusic]
                while #nowplayname % 4 ~= 0 do
                    nowplayname = nowplayname .. '\b'
                end
                for i = 1, #nowplayname, 4 do
                    table.insert(displaymusicname, nowplayname:sub(i, i + 4 - 1))
                end
                currentIndex = 1
                os.sleep(1)
                musicpause = "off"
                screen.setTextScale(1)
                screen.setCursorPos(1,5)
                screen.blit("<","f","6")
            end
            if mousex == 7 and mousey == 5 then
                mousey = -1
                musicpause = "on"
                screen.setTextScale(1)
                screen.setCursorPos(7,5)
                screen.blit("R","f","d")
                nowplaymusic = math.random(allmusic)
                print(nowplaymusic)
                displaymusicname = {}
                nowplayname = musicfiles[nowplaymusic]
                while #nowplayname % 4 ~= 0 do
                    nowplayname = nowplayname .. '\b'
                end
                for i = 1, #nowplayname, 4 do
                    table.insert(displaymusicname, nowplayname:sub(i, i + 4 - 1))
                end
                currentIndex = 1
                os.sleep(1)
                musicpause = "off"
                screen.setTextScale(1)
                screen.setCursorPos(7,5)
                screen.blit("R","f","5")
            end
        end
        os.sleep(0.01)
    end 
end

local function musiccontrol()
    while true do
        if musicpause == "off" then
            for chunk in io.lines("music/"..musicfiles[nowplaymusic], 16 * 1024) do
                local buffer = decoder(chunk)
                if musicpause == "on" then
                    speaker.stop()
                    break
                end
                while not speaker.playAudio(buffer) do
                    os.pullEvent("speaker_audio_empty")
                end
            end
        end
        os.sleep(0.01)
    end
end
local function musicGUI()
    while true do
        if musicpause == "off" then
            screen.setTextScale(1)
            screen.setCursorPos(2,5)
            screen.blit(displaymusicname[currentIndex],"ffff","9999")
        end
        if musicpause== "on" then
            screen.setTextScale(1)
            screen.setCursorPos(2,5)
            screen.blit("PLAY","ffff","3333")
        end
        os.sleep(0.01)
    end
end
local function musicnamedisplay()
    while true do
        currentIndex = currentIndex + 1
        if currentIndex > #displaymusicname then
            currentIndex = 1
        end
        os.sleep(1)
    end
end
local function speedcont()
    while true do
        poso = ship.getWorldspacePosition()
        os.sleep(0.5)
        pos = ship.getWorldspacePosition()
        posx = pos.x - poso.x
        posy = pos.y - poso.y
        posz = pos.z - poso.z
        speed = math.sqrt(posx^2 + posy^2 + posz^2)/0.5*3.6
        displayspeed = display3number(math.floor(speed))
    end
end
local function speedcontGUI()
    while true do
        screen.setTextScale(1)
        screen.setCursorPos(5,3)
        screen.blit(displayspeed,"fff","999")
        os.sleep(0.01)
    end
end
while true do
    parallel.waitForAll(batteryGUI,speedcontrol,speedGUI,batterycontrol,muiscGUItouch,musiccontrol,musicnamedisplay,musicGUI,speedcont,speedcontGUI)
end

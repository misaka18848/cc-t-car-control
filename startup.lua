
--左侧屏幕名称
local Lscreen = "monitor_7"
--右侧屏幕名称
local Rscreen = "monitor_5"
--左侧屏幕是否透明
local LscreenTransparent = true
if peripheral.isPresent(Lscreen) == false then
    print('left screen not connect,please check')
    print('computer will shutdown after 10s')
    os.sleep(10)
    os.shutdown()
end
if peripheral.isPresent(Rscreen) == false then
    print('right screen not connect,please check')
    print('computer will shutdown after 10s')
    os.sleep(10)
    os.shutdown()
end
local screen = peripheral.wrap(Rscreen)
local screen1 = peripheral.wrap(Lscreen)
screen.clear()
screen1.clear()
if LscreenTransparent == true then
    screen1.setTransparentMode(false)
    screen1.setTransparentColor(colors.black)
end
screen1.setBackgroundColour(colors.black)
screen.setBackgroundColour(colors.black)
screen.setTextScale(1)
screen.setCursorPos(2,2) 
screen.blit("carOS","000ff","ccc00")
os.sleep(1)
screen.setCursorPos(3,1) 
screen.blit("4.0","fff","444")
os.sleep(1)
screen.setCursorPos(2,4) 
screen.blit("MISAKA","000000","111111")
screen.setCursorPos(3,5) 
screen.blit("18848","00000","11111")
os.sleep(1)
screen.setCursorPos(1,3)
screen.blit("booting","0000000","fffffff")
--输入油门刹车方向盘加档信号用的红石接口名称
local RIinput = "redstoneIntegrator_4"
--输入加减档信号用的红石接口名称
local RIinput1 = "redstoneIntegrator_7"
--左轮信号输入（无线红石信号遥控器的A键）在红石接口上的方向
local RIinput_leftwheel = "right"
--右轮信号输入（无线红石信号遥控器的D键）在红石接口上的方向
local RIinput_rightwheel = "left"
--油门信号输入（无线红石信号遥控器的W键）在红石接口上的方向
local RIinput_speedup = "top"
--刹车信号输入（无线红石信号遥控器的S键）在红石接口上的方向
local RIinput_speeddown = "down"
--加档信号输入（无线红石信号遥控器的空格键）在红石接口上的方向
local RIinput_upgear = "front"
--降档信号输入（无线红石信号遥控器的shift键）在红石接口上的方向
local RIinput1_downgear = "right"
--输出左轮和左转向灯信号用的红石接口名称
local RILWL = "redstoneIntegrator_2"
--输出右轮和右转向灯信号用的红石接口名称
local RIRWL = "redstoneIntegrator_3"
--数字适配器名称
local da_name = "digital_adapter_4"
--转速控制器在数字适配器的哪侧
local spct = "left"
--电池名称
local battery_name = "modular_accumulator_3"
--音乐扬声器名称
local speaker_name = "speaker_1"
--音效扬声器名称
local speaker1_name = "speaker_2"
--启用汽车音效
local Car_Audio = false
--玩家检测器名称
local playerDetector_name = "playerDetector_0"
--锁车距离
local lockrange = 5
--拥有车的玩家名
local ownername = {
    "Rudeus_Greyrat",
    "GE90",
    "klingmir",
    "Ananab"
}
--电动马达名称
local motor_name = "electric_motor_2"
--输出左/右轮和左/右转向灯信号在各红石接口上的方向
local RIoutput_leftwheel = "back"
local RIoutput_rightwheel = "back"
local RIoutput_leftfrontlight = "top"
local RIoutput_rightfrontlight = "top"
local RIoutput_leftbacklight = "front"
local RIoutput_rightbacklight = "front"
--车名（15字以内，只能使用ASCII字符,该名也会变成该瓦尔基里的名字）
local carname = "Mi SU35 "
--车名文字颜色
local carnamecolor1 = "1"
--车名背景颜色
local carnamecolor2 = "7"
--车名文字随机颜色
local carnameautocolor1 = true
--车名背景随机颜色
local carnameautocolor2 = true

local bootcheck = true

screen1.setTextScale(0.5)
screen1.setCursorPos(1,1)
screen1.setTextColor(colors.white)
screen1.write(os.version())
os.sleep(0.1)
screen1.setCursorPos(1,2)
screen1.write("LRScreen")
os.sleep(0.1)
screen1.setCursorPos(1,3)
screen1.write("PD")
os.sleep(0.1)
screen1.setCursorPos(1,4)
screen1.write("RIinput")
os.sleep(0.1)
screen1.setCursorPos(1,5)
screen1.write("RILWL")
os.sleep(0.1)
screen1.setCursorPos(1,6)
screen1.write("RIRWL")
os.sleep(0.1)
screen1.setCursorPos(1,7)
screen1.write("DA")
os.sleep(0.1)
screen1.setCursorPos(1,8)
screen1.write("Battery")
os.sleep(0.1)
screen1.setCursorPos(1,9)
screen1.write("Speakers")
os.sleep(0.1)
screen1.setCursorPos(1,10)
screen1.write("Motor")
os.sleep(0.1)
screen1.setCursorPos(11,2)
if peripheral.isPresent(Lscreen) == false or peripheral.isPresent(Rscreen) == false then
    screen1.setTextColor(colors.red)
    screen1.write('Error')
    bootcheck = false
else
    screen1.setTextColor(colors.green)
    screen1.write('Done')
end
os.sleep(0.1)
screen1.setCursorPos(11,3)
if peripheral.isPresent(playerDetector_name) == false then
    screen1.setTextColor(colors.red)
    screen1.write('Error')
    bootcheck = false
else
    screen1.setTextColor(colors.green)
    screen1.write('Done')
end
os.sleep(0.1)
screen1.setCursorPos(11,4)
if peripheral.isPresent(RIinput) == false or peripheral.isPresent(RIinput1) == false then
    screen1.setTextColor(colors.red)
    screen1.write('Error')
    bootcheck = false
else
    screen1.setTextColor(colors.green)
    screen1.write('Done')
end
os.sleep(0.1)
screen1.setCursorPos(11,5)
if peripheral.isPresent(RILWL) == false then
    screen1.setTextColor(colors.red)
    screen1.write('Error')
    bootcheck = false
else
    screen1.setTextColor(colors.green)
    screen1.write('Done')
end
os.sleep(0.1)
screen1.setCursorPos(11,6)
if peripheral.isPresent(RIRWL) == false then
    screen1.setTextColor(colors.red)
    screen1.write('Error')
    bootcheck = false
else
    screen1.setTextColor(colors.green)
    screen1.write('Done')
end
os.sleep(0.1)
screen1.setCursorPos(11,7)
if peripheral.isPresent(da_name) == false then
    screen1.setTextColor(colors.red)
    screen1.write('Error')
    bootcheck = false
else
    screen1.setTextColor(colors.green)
    screen1.write('Done')
end
os.sleep(0.1)
screen1.setCursorPos(11,8)
if peripheral.isPresent(battery_name) == false then
    screen1.setTextColor(colors.red)
    screen1.write('Error')
    bootcheck = false
else
    screen1.setTextColor(colors.green)
    screen1.write('Done')
end
os.sleep(0.1)
screen1.setCursorPos(11,9)
if peripheral.isPresent(speaker_name) == false or peripheral.isPresent(speaker1_name) == false then
    screen1.setTextColor(colors.red)
    screen1.write('Error')
    bootcheck = false
else
    screen1.setTextColor(colors.green)
    screen1.write('Done')
end
os.sleep(0.1)
screen1.setCursorPos(11,10)
if peripheral.isPresent(motor_name) == false then
    screen1.setTextColor(colors.red)
    screen1.write('Error')
    bootcheck = false
else
    screen1.setTextColor(colors.green)
    screen1.write('Done')
end
os.sleep(0.1)
screen1.setCursorPos(12,1)
if bootcheck == false then
    screen1.setTextColor(colors.red)
    screen1.write('Warn')
    os.shutdown()
else
    screen1.setTextColor(colors.green)
    screen1.write('Done')
end

local da = peripheral.wrap(da_name)
local battery = peripheral.wrap(battery_name)
local speaker = peripheral.wrap(speaker_name)
local speaker1 = peripheral.wrap(speaker1_name)
local motor = peripheral.wrap(motor_name)
local redstoneintegrator_input = peripheral.wrap(RIinput)
local redstoneintegrator_input1 = peripheral.wrap(RIinput1)
local RIoutputLeftWheelandLight = peripheral.wrap(RILWL)
local RIoutputRightWheelandLight = peripheral.wrap(RIRWL)
local pd = peripheral.wrap(playerDetector_name)

local lock = true
local gear = "0"
local nextgear = "0"
local trygear = "0"
local carbreak = "on"
local caraudioplay = true
--电动马达各档转速设置
local motorspeedlv1 = 1
local motorspeedlv2 = 50
local motorspeedlv3 = 150
local motorspeedlv4 = 256
local RPM = 0
local ownercheck={}
local TRPM = 0
local percent = 100
local function display3number(number)
    return string.format("%03d", number)
end

ship.setName(carname)

local batterylink = "off"
local musicpause = "on"
local dfpwm = require("cc.audio.dfpwm")

local decoder = dfpwm.make_decoder()

local motorspeed = motorspeedlv1
fs.makeDir('music')
local musicfiles = fs.list("music")
local nowplaymusic = 1
local allmusic = #musicfiles
local nowplayname = "PLAY"
local displaymusicname = {}
local currentIndex = 1
local carpos = ship.getWorldspacePosition()
local lockpos1 = {}
local lockpos2 = {}
lockpos1.x = carpos.x + lockrange
lockpos1.y = carpos.y + lockrange
lockpos1.z = carpos.z + lockrange
lockpos2.x = carpos.x - lockrange
lockpos2.y= carpos.y - lockrange
lockpos2.z = carpos.z - lockrange
local pos = ship.getWorldspacePosition()
local poso = pos
local posx = 0
local posy = 0
local posz = 0
local speed = 0
local displayspeed = "000"
local swheel = 0
local blackcarname = " "
local function intToHexChar(num)
    return string.char(48 + num + (num > 9 and 39 or 0))
end

local namecolor1 = carnamecolor1
local namecolor2 = carnamecolor2
local displaycarname = carname
for i = 2, #displaycarname, 1 do
    namecolor1 = namecolor1 .. carnamecolor1
    namecolor2 = namecolor2 .. carnamecolor2
end
local rsinput_left = false
local rsinput_right = false
local rsinput_speedup = false
local rsinput_speeddown = false
local rsinput1_downgear = false
local rsinput_upgear = false

local ottoup = false
local ottodown = false

local time = textutils.formatTime(os.time())
if #time == 7 then
    time = 0 .. time
end
local function caraudio(nowplayaudio)
    if Car_Audio == true then
        if gear == nextgear and carbreak == "off" and caraudioplay == true then
            for chunk in io.lines("caraudio/".. nowplayaudio ..".dfpwm", 16 * 1024) do
                if gear ~= nextgear or rsinput_speedup == false or rsinput_speeddown == true or carbreak == "on" and gear ~= "0" then
                    speaker1.stop()
                    break
                end
                local buffer = decoder(chunk)
                while not speaker1.playAudio(buffer) do
                    os.pullEvent("speaker_audio_empty")
                end
                if gear ~= nextgear or rsinput_speedup == false or rsinput_speeddown == true or carbreak == "on" and gear ~= "0" then
                    speaker1.stop()
                    break
                end
                caraudioplay = false
            end
        end
        if gear ~= nextgear then
            for chunk in io.lines("caraudio/shiftgear.dfpwm", 16 * 1024) do
                local buffer = decoder(chunk)
                while not speaker1.playAudio(buffer) do
                    os.pullEvent("speaker_audio_empty")
                end
            end
            caraudioplay = true
        end
        if carbreak == "on" and gear == nextgear then
            for chunk in io.lines("caraudio/handbreak.dfpwm", 16 * 1024) do
                local buffer = decoder(chunk)
                while not speaker1.playAudio(buffer) do
                    os.pullEvent("speaker_audio_empty")
                end
            end
        end
    end
end

da.setTargetSpeed("left", 0)

screen.setCursorPos(1,3)
screen.blit("-Touch-","0000000","fffffff")
local event, monitorside, mousex, mousey = os.pullEvent("monitor_touch")
screen1.clear()
screen1.setBackgroundColor(colors.cyan)
screen1.setTextScale(1)
screen1.setCursorPos(1,1) 
screen1.blit("BanG...","0000999","9999999")
screen1.setCursorPos(1,2) 
screen1.blit("..Dream","9900000","9999999")
screen1.setCursorPos(1,3) 
screen1.blit("IT'S...","0000999","9999999")
screen1.setCursorPos(1,4) 
screen1.blit("M.y.G.O","0909090","9999999")
screen1.setCursorPos(1,5) 
screen1.blit("..!!!!!","9900000","9999999")
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
os.sleep(2)



screen.clear()
screen1.clear()
screen1.setBackgroundColor(colors.black)
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

screen1.setTextScale(0.5)
screen1.setCursorPos(5,3)
screen1.blit(".......","f00000f","f00000f") 
screen1.setCursorPos(5,4)
screen1.blit(".......","0fffff0","0fffff0") 
screen1.setCursorPos(5,5)
screen1.blit(".......","0000000","0000000") 
screen1.setCursorPos(5,6)
screen1.blit(".......","0ff0ff0","0ff0ff0") 
screen1.setCursorPos(5,7)
screen1.blit(".......","f00000f","f00000f") 

screen1.setCursorPos(4,2)
screen1.blit("POWER",'00000','77777')
screen1.setCursorPos(9,2)
screen1.blit("1234",'0fff','5000')


screen1.setCursorPos(1,7)
screen1.blit("4.0",'fff','444')
screen1.setCursorPos(1,8)
screen1.blit("carOS",'000ff','ccc00')
screen1.setCursorPos(1,9)
screen1.blit("By-Misaka18848",'33f33333333333','ffffffffffffff')

screen1.setCursorPos(11,8)
screen1.blit("xLOCK",'effff','0eeee')

screen1.setCursorPos(1,10)
screen1.blit("trunoff",'fffffff','eeeeeee')
screen1.setCursorPos(8,10)
screen1.blit(".reboot.",'80000008','88888888')

screen1.setCursorPos(12,6)
screen1.blit("OTTO",'9999','7777')
screen1.setCursorPos(12,7)
screen1.blit("UPDO",'0000','8888')

local function speedGUI()
    while true do
        if event == "monitor_touch" and monitorside == Rscreen and lock == false then
            if carbreak == "off" then
                if mousex == 1 and mousey == 1 then
                    trygear = 'R'
                    mousey = -1
                end
                if mousex == 2 and mousey == 1 then
                    trygear = '2'
                    mousey = -1
                end
                if mousex == 3 and mousey == 1 then
                    trygear = '4'
                    mousey = -1
                end
                if mousex == 1 and mousey == 3 then
                    trygear = '1'
                    mousey = -1
                end
                if mousex == 2 and mousey == 3 then
                    trygear = '3'
                    mousey = -1
                end
                if mousex == 3 and mousey == 3 then
                    trygear = '5'
                    mousey = -1
                end
                if mousex <= 5 and mousey == 4 and mousex >= 1 then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,4)
                    screen.blit("BREAK",'00000','eeeee')
                    carbreak = "on"
                    if gear ~= "0" and gear ~= "1" and gear ~="R" then
                        caraudio()
                        os.sleep(2)
                    end
                    nextgear = "0"
                    os.sleep(0.5)
                    mousey = -1
                end
            end
            if carbreak == "on" then
                if mousex <= 5 and mousey == 4 and mousex >= 1 then
                    screen.setTextScale(1)
                    screen.setCursorPos(1,4)
                    screen.blit("BREAK",'fffff','00000')
                    carbreak = "off"
                    os.sleep(0.5)
                    mousey = -1
                end
            end
        end
        os.sleep(0.01)
        if event == "monitor_touch" and monitorside == Lscreen and lock == false then
            if mousex <= 7 and mousey == 10 and mousex >= 1 then
                screen.clear()
                screen1.clear()
                if LscreenTransparent == true then
                    screen1.setTransparentMode(false)
                    screen1.setTransparentColor(colors.black)
                end
                os.shutdown()
            end
            if mousex <= 15 and mousey == 10 and mousex >= 8  then
                screen.clear()
                screen1.clear()
                if LscreenTransparent == true then
                    screen1.setTransparentMode(false)
                    screen1.setTransparentColor(colors.black)
                end
                os.reboot()
            end
        end

        if carbreak =="on" then
            if gear ~= nextgear then
                caraudio()
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
                caraudio()
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

local function gearcontrol()
    while true do
        if carbreak == "off" then
            if rsinput1_downgear == true and rsinput_upgear == false then
                if gear == nextgear then
                    if gear == "0" then
                        trygear = "R"

                    end
                    if gear == "1" then
                        trygear = "0" 

                    end
                    if gear == "2" then
                        trygear = "1" 

                    end
                    if gear == "3" then
                        trygear = "2"

                    end
                    if gear == "4" then
                        trygear = "3" 

                    end
                    if gear == "5" then
                        trygear = "4" 

                    end
                    print(rsinput_upgear)
                    print(rsinput1_downgear)
                    print(" ")
                    rsinput1_downgear = false
                end
            end
            if rsinput1_downgear == false and rsinput_upgear == true then
                if gear == nextgear then
                    if gear == "0" then
                        trygear = "1"

                    end
                    if gear == "1" then
                        trygear = "2" 
 
                    end
                    if gear == "2" then
                        trygear = "3" 

                    end
                    if gear == "3" then
                        trygear = "4"

                    end
                    if gear == "4" then
                        trygear = "5" 

                    end
                    if gear == "R" then
                        trygear = "0" 

                    end
                    print(rsinput_upgear)
                    print(rsinput1_downgear)
                    print(" ")
                    rsinput_upgear = false
                end
            end
            if trygear == "R" and RPM <= 0 and RPM >= -30 then
                nextgear = "R"
            end
            if trygear == "1" and RPM <= 24 and RPM >= 0 then
                nextgear = "1"
            end
            if trygear == "2" and RPM <= 48 and RPM >= 12 then
                nextgear = "2"
            end
            if trygear == "3" and RPM <= 72 and RPM >= 36 then
                nextgear = "3"
            end
            if trygear == "4" and RPM <= 108 and RPM >= 60 then
                nextgear = "4"
            end
            if trygear == "5" and RPM <= 256 and RPM >= 84 then
                nextgear = "5"
            end
        end
        if carbreak == "on" then
            trygear = "0"
        end
        os.sleep(0.01)
    end
end

local function speedcontrol()
    while true do
        TRPM = RPM
        if rsinput_speedup == false and rsinput_speeddown == false and carbreak == "off" then
            if gear == "R" then
                if RPM < -12 then
                    RPM = RPM + 1
                    screen.setTextScale(1)
                    screen.setCursorPos(5,2)
                    screen.blit(display3number(RPM),"fff","eee")
                    os.sleep(0.1)
                end
                if RPM > -12 then
                    RPM = RPM - 1
                    screen.setTextScale(1)
                    screen.setCursorPos(5,2)
                    screen.blit(display3number(RPM),"fff","444")
                    os.sleep(0.1)
                end
            end
            if gear == "1" then
                if RPM < 12 then
                    RPM = RPM + 1
                    screen.setTextScale(1)
                    screen.setCursorPos(5,2)
                    screen.blit(display3number(RPM),"fff","444")
                    os.sleep(0.1)
                end
                if RPM > 12 then
                    RPM = RPM - 1
                    screen.setTextScale(1)
                    screen.setCursorPos(5,2)
                    screen.blit(display3number(RPM),"fff","eee")
                    os.sleep(0.1)
                end
            end
            if gear == "2" then
                if RPM < 36 then
                    RPM = RPM + 1
                    screen.setTextScale(1)
                    screen.setCursorPos(5,2)
                    screen.blit(display3number(RPM),"fff","444")
                    os.sleep(0.2)
                end
                if RPM > 36 then
                    RPM = RPM - 1
                    screen.setTextScale(1)
                    screen.setCursorPos(5,2)
                    screen.blit(display3number(RPM),"fff","eee")
                    os.sleep(0.1)
                end
            end
            if gear == "3" then
                if RPM < 60 then
                    RPM = RPM + 1
                    screen.setTextScale(1)
                    screen.setCursorPos(5,2)
                    screen.blit(display3number(RPM),"fff","444")
                    os.sleep(0.4)
                end
                if RPM > 60 then
                    RPM = RPM - 1
                    screen.setTextScale(1)
                    screen.setCursorPos(5,2)
                    screen.blit(display3number(RPM),"fff","eee")
                    os.sleep(0.1)
                end
            end
            if gear == "4" then
                if RPM < 84 then
                    RPM = RPM + 1
                    screen.setTextScale(1)
                    screen.setCursorPos(5,2)
                    screen.blit(display3number(RPM),"fff","444")
                    os.sleep(0.6)
                end
                if RPM > 84 then
                    RPM = RPM - 1
                    screen.setTextScale(1)
                    screen.setCursorPos(5,2)
                    screen.blit(display3number(RPM),"fff","eee")
                    os.sleep(0.1)
                end
            end
            if gear == "5" then
                if RPM < 108 then
                    RPM = RPM + 1
                    screen.setTextScale(1)
                    screen.setCursorPos(5,2)
                    screen.blit(display3number(RPM),"fff","444")
                    os.sleep(0.8)
                end
                if RPM > 108 then
                    RPM = RPM - 1
                    screen.setTextScale(1)
                    screen.setCursorPos(5,2)
                    screen.blit(display3number(RPM),"fff","eee")
                    os.sleep(0.1)
                end
            end
        end
        if rsinput_speedup == true and rsinput_speeddown == false and carbreak == "off"  and lock == false then
            screen.setTextScale(1)
            screen.setCursorPos(5,2)
            screen.blit(display3number(RPM),"fff","444")
            if gear == "R" and RPM ~= -24 then
                RPM = RPM - 1
                os.sleep(0.05)
            end
            if gear == "1" and RPM ~= 24 then
                RPM = RPM + 1
                os.sleep(0.05)
            end
            if gear == "2" and RPM ~= 48 then
                RPM = RPM + 1
                os.sleep(0.1)
            end
            if gear == "3" and RPM ~= 72 then
                RPM = RPM + 1
                os.sleep(0.2)
            end
            if gear == "4" and RPM ~= 96 then
                RPM = RPM + 1
                os.sleep(0.3)
            end
            if gear == "5" and RPM ~= 256 then
                RPM = RPM + 1
                os.sleep(0.4)
            end
            if ottoup == true then
                if  RPM == 24 and gear == "1" then
                    trygear = "2"
                    mousey = -1
                    os.sleep(0.01)
                end
                if  RPM == 48 and gear =="2" then
                    trygear = "3"
                    mousey = -1
                    os.sleep(0.01)
                end
                if  RPM == 72 and gear =="3" then
                    trygear = "4"
                    mousey = -1
                    os.sleep(0.01)
                end
                if RPM == 96 and gear =="4" then
                    trygear = "5"
                    mousey = -1
                    os.sleep(0.01)
                end
            end
        end
        if carbreak == "on" then
            if RPM < 0 then
                if RPM <= -20 then
                    RPM = RPM + 20
                else
                    RPM = 0
                end
                screen.setTextScale(1)
                screen.setCursorPos(5,2)
                screen.blit(display3number(RPM),"fff","eee")          
            end
            if RPM > 0 then
                if RPM >= 20 then
                    RPM = RPM -20
                else
                    RPM = 0
                end
                screen.setTextScale(1)
                screen.setCursorPos(5,2)
                screen.blit(display3number(RPM),"fff","eee")
            end
            os.sleep(0.01)   
        end
        if rsinput_speedup == false and rsinput_speeddown == true and carbreak == "off"  and lock == false then
            if RPM < 0 then
                RPM = RPM + 1
                screen.setTextScale(1)
                screen.setCursorPos(5,2)
                screen.blit(display3number(RPM),"fff","eee")       
            end
            if RPM > 0 then
                RPM = RPM - 1
                screen.setTextScale(1)
                screen.setCursorPos(5,2)
                screen.blit(display3number(RPM),"fff","eee")       
            end
            if ottodown == true then
                if RPM > 0 and RPM < 24 and gear ~="1" then
                    trygear = "1"
                    mousey = -1
                end
                if RPM >= 24 and RPM < 48 and gear ~="2" and gear ~= "1" then
                    trygear = "2"
                    mousey = -1
                end
                if RPM >= 48 and RPM < 72 and gear ~="3" and gear ~="2" then
                    trygear = "3"
                    mousey = -1
                end
                if RPM > 72 and RPM < 108 and gear ~="4" and gear ~="3" then
                    trygear = "4"
                    mousey = -1
                end
            end
            os.sleep(0.05)
        end
        da.setTargetSpeed(spct, RPM)
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
            if event == "monitor_touch" and monitorside == Rscreen  and lock == false then
                if mousey <= 3 and mousex == 4 and mousey >= 1 and batterylink == "on" then
                    screen.setTextScale(1)
                    screen.setCursorPos(4,1)
                    screen.blit("o","f","e")
                    screen.setCursorPos(4,2)
                    screen.blit("f","f","e")
                    screen.setCursorPos(4,3)
                    screen.blit("f","f","e")
                    batterylink= "off"
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
            motor.setSpeed(motorspeed)
        else
            motor.stop()
        end
        os.sleep(10)
    end
end

local function muiscGUItouch()
    while true do
        if event == "monitor_touch" and monitorside == Rscreen  and lock == false then
            if mousex <= 5 and mousey == 5 and mousex >= 2 and musicpause == "on" then
                mousey = -1
                musicpause = "off"
                displaymusicname = {}
                nowplayname = musicfiles[nowplaymusic]:sub(1,#musicfiles[nowplaymusic] - 6)
                while #nowplayname % 4 ~= 0 do
                    nowplayname = nowplayname .. ' '
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
                displaymusicname = {}
                nowplayname = musicfiles[nowplaymusic]:sub(1,#musicfiles[nowplaymusic] - 6)
                while #nowplayname % 4 ~= 0 do
                    nowplayname = nowplayname .. ' '
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
                displaymusicname = {}
                nowplayname = musicfiles[nowplaymusic]:sub(1,#musicfiles[nowplaymusic] - 6)
                while #nowplayname % 4 ~= 0 do
                    nowplayname = nowplayname .. ' '
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
                displaymusicname = {}
                nowplayname = musicfiles[nowplaymusic]:sub(1,#musicfiles[nowplaymusic] - 6)
                while #nowplayname % 4 ~= 0 do
                    nowplayname = nowplayname .. ' '
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

local function rsinput()
    while true do
        rsinput_left = redstoneintegrator_input.getInput(RIinput_leftwheel)
        rsinput_right = redstoneintegrator_input.getInput(RIinput_rightwheel)
        rsinput_speedup = redstoneintegrator_input.getInput(RIinput_speedup)
        rsinput_speeddown = redstoneintegrator_input.getInput(RIinput_speeddown)
        rsinput_upgear = redstoneintegrator_input.getInput(RIinput_upgear)
        rsinput1_downgear = redstoneintegrator_input1.getInput(RIinput1_downgear)
        if rsinput_left == true and swheel ~= -15 and rsinput_right == false  and lock == false then
            swheel = swheel - 1
        end
        if rsinput_right == true and swheel ~= 15 and rsinput_left == false  and lock == false then
            swheel = swheel + 1
        end
        os.sleep(0.01)
    end
end

local function swheelGUI()
    while true do
        if swheel == 0 or swheel == 12 or swheel == -12 then
            screen1.setTextScale(0.5)
            screen1.setCursorPos(5,3)
            screen1.blit("       ","f00000f","f00000f") 
            screen1.setCursorPos(5,4)
            screen1.blit("       ","0fffff0","0fffff0") 
            screen1.setCursorPos(5,5)
            screen1.blit("       ","0000000","0000000") 
            screen1.setCursorPos(5,6)
            screen1.blit("       ","0ff0ff0","0ff0ff0") 
            screen1.setCursorPos(5,7)
            screen1.blit("       ","f00000f","f00000f") 
        end
        if swheel == 1 or swheel == 13 or swheel == -11 then
            screen1.setTextScale(0.5)
            screen1.setCursorPos(5,3)
            screen1.blit("       ","f00000f","f00000f") 
            screen1.setCursorPos(5,4)
            screen1.blit("       ","00ffff0","00ffff0") 
            screen1.setCursorPos(5,5)
            screen1.blit("       ","0f000f0","0f000f0") 
            screen1.setCursorPos(5,6)
            screen1.blit("       ","0f0ff00","0f0ff00") 
            screen1.setCursorPos(5,7)
            screen1.blit("       ","f00000f","f00000f")
        end
        if swheel == 2 or swheel == 14 or swheel == -10 then
            screen1.setTextScale(0.5)
            screen1.setCursorPos(5,3)
            screen1.blit("       ","f00000f","f00000f") 
            screen1.setCursorPos(5,4)
            screen1.blit("       ","000fff0","000fff0") 
            screen1.setCursorPos(5,5)
            screen1.blit("       ","0ff0ff0","0ff0ff0") 
            screen1.setCursorPos(5,6)
            screen1.blit("       ","000f000","000f000") 
            screen1.setCursorPos(5,7)
            screen1.blit("       ","f00000f","f00000f") 
        end
        if swheel == 3 or swheel == 15 or swheel == -9 then
            screen1.setTextScale(0.5)
            screen1.setCursorPos(5,3)
            screen1.blit("       ","f00000f","f00000f") 
            screen1.setCursorPos(5,4)
            screen1.blit("       ","0ff0ff0","0ff0ff0") 
            screen1.setCursorPos(5,5)
            screen1.blit("       ","0000ff0","0000ff0") 
            screen1.setCursorPos(5,6)
            screen1.blit("       ","0ff0ff0","0ff0ff0") 
            screen1.setCursorPos(5,7)
            screen1.blit("       ","f00000f","f00000f") 
        end
        if swheel == 4 or swheel == -8 then
            screen1.setTextScale(0.5)
            screen1.setCursorPos(5,3)
            screen1.blit("       ","f00000f","f00000f") 
            screen1.setCursorPos(5,4)
            screen1.blit("       ","00ff0f0","00ff0f0") 
            screen1.setCursorPos(5,5)
            screen1.blit("       ","0f00ff0","0f00ff0") 
            screen1.setCursorPos(5,6)
            screen1.blit("       ","0f0fff0","0f0fff0") 
            screen1.setCursorPos(5,7)
            screen1.blit("       ","f00000f","f00000f") 
        end
        if swheel == 5 or swheel == -7 then
            screen1.setTextScale(0.5)
            screen1.setCursorPos(5,3)
            screen1.blit("       ","f00000f","f00000f") 
            screen1.setCursorPos(5,4)
            screen1.blit("       ","0f0ff00","0f0ff00") 
            screen1.setCursorPos(5,5)
            screen1.blit("       ","0f000f0","0f000f0") 
            screen1.setCursorPos(5,6)
            screen1.blit("       ","00ffff0","00ffff0") 
            screen1.setCursorPos(5,7)
            screen1.blit("       ","f00000f","f00000f") 
        end
        if swheel == 6 or swheel == -6 then
            screen1.setTextScale(0.5)
            screen1.setCursorPos(5,3)
            screen1.blit("       ","f00000f","f00000f") 
            screen1.setCursorPos(5,4)
            screen1.blit("       ","0ff0ff0","0ff0ff0") 
            screen1.setCursorPos(5,5)
            screen1.blit("       ","0000000","0000000") 
            screen1.setCursorPos(5,6)
            screen1.blit("       ","0fffff0","0fffff0") 
            screen1.setCursorPos(5,7)
            screen1.blit("       ","f00000f","f00000f") 
        end
        if swheel == 7 or swheel == -5 then
            screen1.setTextScale(0.5)
            screen1.setCursorPos(5,3)
            screen1.blit("       ","f00000f","f00000f") 
            screen1.setCursorPos(5,4)
            screen1.blit("       ","00ff0f0","00ff0f0") 
            screen1.setCursorPos(5,5)
            screen1.blit("       ","0f000f0","0f000f0") 
            screen1.setCursorPos(5,6)
            screen1.blit("       ","0ffff00","0ffff00") 
            screen1.setCursorPos(5,7)
            screen1.blit("       ","f00000f","f00000f") 
        end
        if swheel == 8 or swheel == -4 then
            screen1.setTextScale(0.5)
            screen1.setCursorPos(5,3)
            screen1.blit("       ","f00000f","f00000f") 
            screen1.setCursorPos(5,4)
            screen1.blit("       ","000f000","000f000") 
            screen1.setCursorPos(5,5)
            screen1.blit("       ","0ff0ff0","0ff0ff0") 
            screen1.setCursorPos(5,6)
            screen1.blit("       ","0fff000","0fff000") 
            screen1.setCursorPos(5,7)
            screen1.blit("       ","f00000f","f00000f") 
        end
        if swheel == 9 or swheel == -3 or swheel == -15 then
            screen1.setTextScale(0.5)
            screen1.setCursorPos(5,3)
            screen1.blit("       ","f00000f","f00000f") 
            screen1.setCursorPos(5,4)
            screen1.blit("       ","0ff0ff0","0ff0ff0") 
            screen1.setCursorPos(5,5)
            screen1.blit("       ","0ff0000","0ff0000") 
            screen1.setCursorPos(5,6)
            screen1.blit("       ","0ff0ff0","0ff0ff0") 
            screen1.setCursorPos(5,7)
            screen1.blit("       ","f00000f","f00000f") 
        end
        if swheel == 10 or swheel == -2 or swheel == -14 then
            screen1.setTextScale(0.5)
            screen1.setCursorPos(5,3)
            screen1.blit("       ","f00000f","f00000f") 
            screen1.setCursorPos(5,4)
            screen1.blit("       ","0fff0f0","0fff0f0") 
            screen1.setCursorPos(5,5)
            screen1.blit("       ","0ff00f0","0ff00f0") 
            screen1.setCursorPos(5,6)
            screen1.blit("       ","0f0ff00","0f0ff00") 
            screen1.setCursorPos(5,7)
            screen1.blit("       ","f00000f","f00000f") 
        end
        if swheel == 11 or swheel == -1 or swheel == -13 then
            screen1.setTextScale(0.5)
            screen1.setCursorPos(5,3)
            screen1.blit("       ","f00000f","f00000f") 
            screen1.setCursorPos(5,4)
            screen1.blit("       ","0ffff00","0ffff00") 
            screen1.setCursorPos(5,5)
            screen1.blit("       ","0f000f0","0f000f0") 
            screen1.setCursorPos(5,6)
            screen1.blit("       ","00ff0f0","00ff0f0") 
            screen1.setCursorPos(5,7)
            screen1.blit("       ","f00000f","f00000f") 
        end
        if swheel >= 12 then
            screen1.setTextScale(0.5)
            screen1.setCursorPos(7,8)
            screen1.blit("Rx1","000","eee") 
        end
        if swheel <= -12 then
            screen1.setTextScale(0.5)
            screen1.setCursorPos(7,8)
            screen1.blit("Lx1","000","999") 
        end
        if swheel > -12 and swheel < 12 then
            screen1.setTextScale(0.5)
            screen1.setCursorPos(7,8)
            screen1.blit("   ","fff","fff") 
        end
        os.sleep(0.01)
    end
end

local function swheelback()
    while true do
        if rsinput_left == false and rsinput_right == false then
            if swheel > 0 then
                swheel = swheel - 1
            end
            if swheel < 0 then
                swheel = swheel + 1
            end
        end
        os.sleep(0.2)
    end
end

local function swheelcontrol()
    while true do
        if swheel > 0 then
            RIoutputLeftWheelandLight.setAnalogOutput(RIoutput_leftwheel,swheel)
        end
        if swheel < 0 then
            RIoutputRightWheelandLight.setAnalogOutput(RIoutput_rightwheel,0-swheel)
        end
        if swheel == 0 then
            RIoutputRightWheelandLight.setAnalogOutput(RIoutput_rightwheel,swheel)
            RIoutputLeftWheelandLight.setAnalogOutput(RIoutput_leftwheel,swheel)
        end
        os.sleep(0.01)
    end
end

local function RLlightGUI()
    while true do
        if rsinput_right == true and rsinput_left == false and swheel > 0 then
            screen1.setTextScale(0.5)
            screen1.setCursorPos(13,1)
            screen1.blit("|R>","000","ddd")
            RIoutputRightWheelandLight.setAnalogOutput(RIoutput_rightfrontlight,1)
            RIoutputRightWheelandLight.setAnalogOutput(RIoutput_rightbacklight,1)
        end
        if rsinput_right == false and rsinput_left == true and swheel < 0 then
            screen1.setTextScale(0.5)
            screen1.setCursorPos(1,1)
            screen1.blit("<L|","000","ddd")
            RIoutputLeftWheelandLight.setAnalogOutput(RIoutput_leftfrontlight,1)
            RIoutputLeftWheelandLight.setAnalogOutput(RIoutput_leftbacklight,1)
        end
        os.sleep(1)
        screen1.setCursorPos(1,1)
        screen1.blit("   ","fff","fff")
        screen1.setCursorPos(13,1)
        screen1.blit("   ","fff","fff")
        RIoutputRightWheelandLight.setAnalogOutput(RIoutput_rightfrontlight,0)
        RIoutputRightWheelandLight.setAnalogOutput(RIoutput_rightbacklight,0)
        RIoutputLeftWheelandLight.setAnalogOutput(RIoutput_leftfrontlight,0)
        RIoutputLeftWheelandLight.setAnalogOutput(RIoutput_leftbacklight,0)
        os.sleep(1)
    end
end

local function clock()
    while true do
        time = textutils.formatTime(os.time())
        if #time == 7 then
            time = 0 .. time
        end
        screen1.setCursorPos(4,1)
        screen1.blit(time .. " ","fffffffff","000003333")
        os.sleep(0.05)
    end
end

local function powerGUI()
    while true do
        if event == "monitor_touch" and monitorside == Lscreen and lock == false then
            if mousex == 9 and mousey == 2 then
                mousey = -1
                motorspeed = motorspeedlv1
                screen1.setTextScale(0.5)
                screen1.setCursorPos(9,2)
                screen1.blit("1234",'0fff','5000')
            end
            if mousex == 10 and mousey == 2 then
                mousey = -1
                motorspeed = motorspeedlv2
                screen1.setTextScale(0.5)
                screen1.setCursorPos(9,2)
                screen1.blit("1234",'f0ff','0900')
            end
            if mousex == 11 and mousey == 2 then
                mousey = -1
                motorspeed = motorspeedlv3
                screen1.setTextScale(0.5)
                screen1.setCursorPos(9,2)
                screen1.blit("1234",'ff0f','0040')
            end
            if mousex == 12 and mousey == 2 then
                mousey = -1
                motorspeed = motorspeedlv4
                screen1.setTextScale(0.5)
                screen1.setCursorPos(9,2)
                screen1.blit("1234",'fff0','000e')
            end
            if mousex <= 13 and mousey == 7 and mousex >= 12 then
                if ottoup == false then
                    screen1.setTextScale(0.5)
                    screen1.setCursorPos(12,7)
                    screen1.blit("UP",'33','88')
                    ottoup = true
                    os.sleep(0.5)
                    mousey = -1
                else
                    screen1.setTextScale(0.5)
                    screen1.setCursorPos(12,7)
                    screen1.blit("UP",'00','88')
                    ottoup = false
                    os.sleep(0.5)
                    mousey = -1
                end
            end
            if mousex <= 15 and mousey == 7 and mousex >= 14 then
                if ottodown == false then
                    screen1.setTextScale(0.5)
                    screen1.setCursorPos(14,7)
                    screen1.blit("DO",'33','88')
                    ottodown = true
                    os.sleep(0.5)
                    mousey = -1
                else
                    screen1.setTextScale(0.5)
                    screen1.setCursorPos(14,7)
                    screen1.blit("DO",'00','88')
                    ottodown = false
                    os.sleep(0.5)
                    mousey = -1
                end
            end
        end
        os.sleep(0.01)
    end
end

local function carnameGUI()
    while true do
        screen1.setCursorPos(1,9)
        screen1.blit("By-Misaka18848",'03f33333333333','ffffffffffffff')
        os.sleep(0.1)
        screen1.setCursorPos(1,9)
        screen1.blit("By-Misaka18848",'30f33333333333','ffffffffffffff')
        os.sleep(0.1)
        screen1.setCursorPos(1,9)
        screen1.blit("By-Misaka18848",'33f03333333333','ffffffffffffff')
        os.sleep(0.1)
        screen1.setCursorPos(1,9)
        screen1.blit("By-Misaka18848",'33f30333333333','ffffffffffffff')
        os.sleep(0.1)
        screen1.setCursorPos(1,9)
        screen1.blit("By-Misaka18848",'33f33033333333','ffffffffffffff')
        os.sleep(0.1)
        screen1.setCursorPos(1,9)
        screen1.blit("By-Misaka18848",'33f33303333333','ffffffffffffff')
        os.sleep(0.1)
        screen1.setCursorPos(1,9)
        screen1.blit("By-Misaka18848",'33f33330333333','ffffffffffffff')
        os.sleep(0.1)
        screen1.setCursorPos(1,9)
        screen1.blit("By-Misaka18848",'33f33333033333','ffffffffffffff')
        os.sleep(0.1)
        screen1.setCursorPos(1,9)
        screen1.blit("By-Misaka18848",'33f33333303333','ffffffffffffff')
        os.sleep(0.1)
        screen1.setCursorPos(1,9)
        screen1.blit("By-Misaka18848",'33f33333333033','ffffffffffffff')
        os.sleep(0.1)
        screen1.setCursorPos(1,9)
        screen1.blit("By-Misaka18848",'33f33333333303','ffffffffffffff')
        os.sleep(0.1)
        screen1.setCursorPos(1,9)
        screen1.blit("By-Misaka18848",'33f33333333330','ffffffffffffff')
        os.sleep(0.1)
        screen1.setCursorPos(1,9)
        screen1.blit("By-Misaka18848",'33f33333333333','ffffffffffffff')
        os.sleep(0.1)
        screen1.setCursorPos(1,9)
        screen1.blit("              ",'ffffffffffffff','ffffffffffffff')
        os.sleep(0.5)
        if carnameautocolor1 == true and carnameautocolor2 == true then
            repeat
                carnamecolor1 = intToHexChar(math.random(0, 15))
                carnamecolor2 = intToHexChar(math.random(0, 15))
            until (carnamecolor1 ~= carnamecolor2)
        end
        if carnameautocolor1 == true and carnameautocolor2 == false then
            repeat
                carnamecolor1 = intToHexChar(math.random(0, 15))
            until (carnamecolor1 ~= carnamecolor2)
        end
        if carnameautocolor1 == false and carnameautocolor2 == true then
            repeat
                carnamecolor2 = intToHexChar(math.random(0, 15))
            until (carnamecolor1 ~= carnamecolor2)
        end

        for i = 1, #carname, 1 do

            displaycarname = carname:sub(1,i)
            namecolor1 = carnamecolor1
            namecolor2 = carnamecolor2

            for e = 1, #displaycarname-1, 1 do
                namecolor1 = namecolor1 .. carnamecolor1
                namecolor2 = namecolor2 .. carnamecolor2
            end

            screen1.setCursorPos(1,9)
            screen1.blit(displaycarname,namecolor1,namecolor2)
            os.sleep(0.1)
        end
        os.sleep(10)
        for i = #carname, 1, -1 do
            displaycarname = carname:sub(1,i)

            namecolor1 = carnamecolor1
            namecolor2 = carnamecolor2

            for e = 1, #displaycarname-1, 1 do
                namecolor1 = namecolor1 .. carnamecolor1
                namecolor2 = namecolor2 .. carnamecolor2
            end

            screen1.setCursorPos(1,9)
            screen1.blit(displaycarname,namecolor1,namecolor2)
            os.sleep(0.1)
            blackcarname = " "

            namecolor1 = "f"
            namecolor2 = "f"
            for f = 1, #displaycarname-1, 1 do
                blackcarname = blackcarname .. " "
                namecolor1 = namecolor1 .. "f"
                namecolor2 = namecolor2 .. "f"
            end

            screen1.setCursorPos(1,9)
            screen1.blit(blackcarname,namecolor1,namecolor2)
        end
        os.sleep(1)

    end
end

local function lockGUI()
    while true do
        lock = true
        carpos = ship.getWorldspacePosition()
        lockpos1.x = carpos.x + lockrange
        lockpos1.y = carpos.y + lockrange
        lockpos1.z = carpos.z + lockrange
        lockpos2.x = carpos.x - lockrange
        lockpos2.y= carpos.y - lockrange
        lockpos2.z = carpos.z - lockrange
        for i = 1, #ownername, 1 do
            ownercheck[i]=pd.isPlayerInCoords(lockpos1,lockpos2,ownername[i])
        end
        for _, v in ipairs(ownercheck) do
            if v == true then
                lock = false
                break
            end
        end
        if lock == true then
            screen1.setCursorPos(11,8)
            screen1.blit("xLOCK",'effff','0eeee')
            if LscreenTransparent == true then
                screen1.setTransparentMode(false)
                screen1.setTransparentColor(colors.black)
            end
        else
            screen1.setCursorPos(11,8)
            screen1.blit("enjoy",'00000','55555')
            if LscreenTransparent == true then
                screen1.setTransparentMode(true)
                screen1.setTransparentColor(colors.black)
            end
        end
        os.sleep(1)
    end
end

local function monitortouch()
    while true do
        event, monitorside, mousex, mousey = os.pullEvent("monitor_touch")
        os.sleep(0.01)
    end
end

local function speedaudio()
    while true do
        if rsinput_speedup == false or rsinput_speeddown == true then
            caraudioplay = true
        end
        if rsinput_speedup == true and rsinput_speeddown == false and carbreak == "off" and gear == nextgear then
            if gear == "0" then
                caraudio("gear0")
            end
            if gear == "1" or gear == "R" then
                caraudio("gear1")
            end
            if gear == "2" then
                caraudio("gear2")
            end
            if gear == "3" then
                caraudio("gear3")
            end
            if gear == "4" then
                caraudio("gear2")
            end
            if gear == "5" then
                caraudio("gear3")
            end
        end
        sleep(0.01)
    end
end


while true do
    parallel.waitForAll(speedaudio,monitortouch,lockGUI,carnameGUI,batteryGUI,gearcontrol,speedcontrol,speedGUI,batterycontrol,muiscGUItouch,musiccontrol,musicnamedisplay,musicGUI,speedcont,speedcontGUI,rsinput,swheelGUI,swheelback,swheelcontrol,RLlightGUI,clock,powerGUI)
end

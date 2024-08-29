--W26H20
rednet.open("back")
term.setCursorBlink(false)
term.setCursorPos(1,1)
term.blit("           ","fffffffffff","fffffffffff")
term.setCursorPos(3, 4)
term.blit("                      ","000000000fffffffffffff","000000000fffffffffffff")
term.setCursorPos(3, 5)
term.blit("                      ","0fffffff0ff0fff0ff000f","0fffffff0ff0fff0ff000f")
term.setCursorPos(3, 6)
term.blit("                      ","0f0fff0f0ff00000f0fff0","0f0fff0f0ff00000f0fff0")
term.setCursorPos(3, 7)
term.blit("                      ","00fffff00ff0fff0ff000f","00fffff00ff0fff0ff000f")
term.setCursorPos(3, 8)
term.blit("                      ","0ff000ff0fffffffffffff","0ff000ff0fffffffffffff")
term.setCursorPos(3, 9)
term.blit("                      ","0ff0f0ff0ff0fff0ff000f","0ff0f0ff0ff0fff0ff000f")
term.setCursorPos(3, 10)
term.blit("                      ","0ff000ff0ff00f00f0fff0","0ff000ff0ff00f00f0fff0")
term.setCursorPos(3, 11)
term.blit("                      ","0fffffff0ff0f0f0ff000f","0fffffff0ff0f0f0ff000f")
term.setCursorPos(3, 12)
term.blit("                      ","000000000ffffffffccccc","000000000ffffffffccccc")
term.setCursorPos(6,15)
term.blit(" System Loading ","cffffffffffffffc","c00000000000000c")
term.setCursorPos(11,20)
term.blit(" By Misaka18848 ","ffffffffffffffff","0000000000000000")
os.sleep(1)
term.clear()
local nowapp ="home"
local carid = 3
local carrec = {}
local time = textutils.formatTime(os.time())
local carsm = {}
local fcampic = {}
local tbcolor = ""
local tcolor = ""
local id = 1
local y = 1
local wpix = ""
local image, palette= {},{}
local function timebar()
    while true do
        time = textutils.formatTime(os.time())
        if #time == 7 then
            time = 0 .. time
        end
        term.setCursorPos(1,1)
        term.blit(time,"00000000","ffffffff")
        term.setCursorPos(9,1)
        term.blit("             ","fffffffffffff","fffffffffffff")
        term.setCursorPos(22,1)
        term.blit("5G.il","00000","fffff")
        os.sleep(0.01)
    end
end
local function taskbar()
    while true do
        if nowapp ~= "home" then
            term.setCursorPos(1,20)
            term.blit("           home           ","00000000000000000000000000","77777777777777777777777777")
            if Event == "mouse_click" and Button == 1 then
                if Mousey == 20 then
                    nowapp = "home"
                end
            end
        end
        os.sleep(0.01)
    end

end
local function carreceive()
    while true do
        repeat
            id, carrec = rednet.receive()
        until id == carid
    end
end
local function home()
    while true do
        if nowapp == "home" then
            image, palette = {
                {
                    "   \144       \144 \144   \144\159\143\143\143\143\143\143\144 \152   \144 \144   \144 ",
                    "000b0000000b0b000b999b99980b000b0b000b0",
                    "999999999999999999888988899999999999999"
                },
                {
                    "   \132 \132  \132 \132 \132\132\148\135\129    \147\132    \131\143\159 \132\132 \132    ",
                    "000b0b00b0b0bbbb900008c00009b90bb0b0000",
                    "999999999999999988888c8888889b999999999"
                },
                {
                    " \144\144 \144\144\144\129\144 \144\129\135\135\132 \144 \129          \136\139\144\144\129\144\129\144\129\145",
                    "0bb0bbbbb0bb9b60c0c00000000006bbbbbbbbb",
                    "999999999999b98888888888888889999999999"
                },
                {
                    "    \132\132 \132\132\139\144\159\143\129      \144          \130\155\155 \132  \132",
                    "0000bb0bb9b98600000060000000000b990b00b",
                    "999999999b9f68888888888888888888bb99999"
                },
                {
                    " \145\129\145\144\145\145\150\135\131\135\159\157\139\159\132   \159\132    \159     \157\139\154\129\145\129\144 ",
                    "0bbbbbb9b9980886000860000800000889bbbb0",
                    "9999999b30f6666888868888868888860b99999"
                },
                {
                    "\135\144\135\131\143\135\131\134 \135\133\129\132\148\141\139\143\132 \149\129     \149  \143\135\159\131\138\148\134 \132\132",
                    "909b39bb00f688088c0860000060088009bb0bb",
                    "0b0300390f88666668868888888886688899999"
                },
                {
                    " \146  \131  \145\151\151\133\144 \134 \144\136\131\135\142\132\132\132\129\132 \144\130\135\131    \148\145\144\129\144",
                    "030000030f6c060c8066666c60866600008bbbb",
                    "00003000f8888888688888888868888888b9999"
                },
                {
                    "\159\133 \151\133 \151\154\158\129\159 \132\129\159\132   \145   \159\149\159\132\149 \159\129\132  \129\154 \132 ",
                    "03003000f880868c000600086888086c00690b0",
                    "3003003376c868c88888888c8c678c88889b999"
                },
                {
                    "\138  \133  \144\133\149 \154   \149 \145 \145\132\145\132\144\152\132\136\149\159\150 \145\151  \130\149\145\129 ",
                    "30030090f0c00080c0c6c6cc6cc880c80068bb0",
                    "0009003f888888c8888888888886788c888b999"
                },
                {
                    "\132 \159\151 \159\133   \148\157  \153\149\132\137\132\129\147\130\132\132\129\159\155\149\148\138\130\145\148  \129\155\132\132",
                    "3009003000780088c8c688cc688808c870069bb",
                    "0030038f88cc88cc8c88768882c6678cc889b99"
                },
                {
                    "\139\143\159\143\143\135\149\149  \134\145  \132\129\152\148\129 \149\148\159\149\135\133\133\129 \139\148\132\138\136 \145\148\129\144",
                    "39b9937f0087008778808787888808788c0c8bb",
                    "039000fc887c8878c768cccc767600cc7888b99"
                },
                {
                    " \159\133 \159\159 \149\148\157\145\149  \135\138\144\132\141\138\141\159\130\131\135\159\159\142\135 \149\129\151\157 \149\149\132 ",
                    "0030000f7887007c070c8878c0766068c8088b0",
                    "0300b8f7cccc88887868c087688000778c87b99"
                },
                {
                    "\131\150  \131\149 \149\149\149\130\133 \138\130\156\131\131\142\144\139\138\139\129\159\135\135\131\155\144\138\156\138\149\129\149\138\145\129",
                    "3b003007f8870c676068768706687c7088c89bb",
                    "93000ffc8c7c88cc778668668c7cf6886c8b899"
                },
                {
                    "\149\133 \159\132\149\144\129\149\149\129\136\132\149\151\151\133\135\143\132 \130\132 \142\142\149\144\134\133\131\133\149\145 \149\132\132\132",
                    "93003888f886c8706c780c60c686870808087bb",
                    "b0030ff78cc88ccc8880060088c76c868789999"
                },
                {
                    "   \130\129\149\149\144\138\146\134\134\144\149\145\139\158\135\145      \139\143\144\152\158\159\158\154\159\135\129\145\129\144",
                    "0003386fc788c880006000000608808077887bb",
                    "90000ff7fc7787668600000000666868cc79999"
                },
                {
                    "\130\130\131\131\131\149\138\138\144\148\135\129\132\149\149\155\144\155\132  \151\132   \153\144\132\149\135\142\129\132\129 \130\159 ",
                    "b3030c777fc8c88000600060000060078c80b90",
                    "9bb9bf9ff7878766660006000066088c7979979"
                },
                {
                    " \154\159\135\144\149\144\148  \138\149\148\138\138\154\155\145\129  \130    \139\155\159\151\148\150\149\152\135\144\129\138\145",
                    "0ff979f9008cfc866660060000660788fb7bb7b",
                    "97779fbfffff78700000000000008877c9b99b9"
                },
                {
                    "\158\150\157\131\159\142\157\159\144\151\144\137\149 \137\138      \159    \159\129\143\154\159\133\130\132\132\155\130\132",
                    "f9ff9ff7bf7cf0800000000000000c8fcbbb97b",
                    "97b7f97ff7f778f800000060000877779999bb9"
                },
                {
                    "\129\138\129\153\131\159\133\129\131\148\149  \145\148\150\139\144  \130\129\131\129  \143\129\151\133\135\129\144\145\145\153\144\149\145",
                    "7f7bf99f779007778800666600068f7bbbbbb9b",
                    "97997bf9bffffcfc700000000087f7b99999979"
                },
                {
                    "     \129\133\132 \130\131 \151\146\138\130\133\143\148\144  \159\135\139\129\144\159\159 \132\132\132\132\132\132\130\138\132",
                    "0000097b0770f9f7f77800000089f0bbbbbbb7b",
                    "99999f999bbf7fcf7f8600687cf7799999999b9"
                },
                {
                    "  \129\144\130\129 \145\145\145\145\148\130\138\148\155\159\135\137\145\129\159\129\143\140\155\137\145\138\144\144\145\129\145\144\144\145\152 ",
                    "00bb7f0bbbb9b7bfff88806787c7b7bbbbbbb70",
                    "9999b999999ff977786628787c8f7b9999999b9"
                },
                {
                    "\159\132 \159\155\155\155\155\155\155\155\155\148\135\150 \149\145\145\144 \149\130\139\131\131\148\149\132\149\147\139\132\132\155 \159\133\132",
                    "9b0999999999bb70f00006888878f899bb9097b",
                    "b99bbbbbbbbbf89776666777ffcf777799b97b9"
                },
                {
                    "\147\147\140\147\140\147\140\140\140\147\132\152\132\155\149 \149\139\134\153\137\146\148 \159\131\137\143\159\154\148\149   \131\158\145\145",
                    "9939393339379870f6068860fff77737000b9bb",
                    "33939399939b73877060667f787fc8999999b99"
                },
                {
                    "\134\134\134\134\134\134\134\153\134\153\149 \138\149\133\144\132\129\134\134\129\132\140\131\140\130\141\130\152\148\138      \132\132",
                    "9999999393307888f06608876867387000000bb",
                    "333333393999933776006666060683899999999"
                },
            }, {
                [0] = {0.941176, 0.941176, 0.941176},
                {0.949020, 0.698039, 0.200000},
                {0.898039, 0.498039, 0.847059},
                {0.600000, 0.698039, 0.949020},
                {0.870588, 0.870588, 0.423529},
                {0.498039, 0.800000, 0.098039},
                {0.949020, 0.698039, 0.800000},
                {0.298039, 0.298039, 0.298039},
                {0.600000, 0.600000, 0.600000},
                {0.298039, 0.600000, 0.698039},
                {0.698039, 0.400000, 0.898039},
                {0.200000, 0.400000, 0.800000},
                {0.498039, 0.400000, 0.298039},
                {0.341176, 0.650980, 0.305882},
                {0.800000, 0.298039, 0.298039},
                {0.066667, 0.066667, 0.066667},
            }
            for i = 0, #palette do term.setPaletteColor(2^i, table.unpack(palette[i])) end
            for y, r in ipairs(image) do
                term.setCursorPos(1, y+1)
                term.blit(table.unpack(r))
            end
            term.setCursorPos(2,3)
            term.blit("____i","00000","ccccc")
            term.setCursorPos(2,4)
            term.blit("LO-OI","00000","ccccc")
            term.setCursorPos(2,5)
            term.blit("carOS","000ff","ccc00")
            if Event == "mouse_click" and Button == 1 then
                if Mousex >= 2 and Mousex <= 6 and Mousey >= 3 and Mousey <= 5 then
                    nowapp = "carOS"
                    Mousex = -1
                end
            end
            if nowapp ~= "home" then
                for i = 0, 15 do term.setPaletteColor(2^i, term.nativePaletteColor(2^i)) end
                term.setBackgroundColor(colors.black)
                term.setTextColor(colors.white)
                term.setCursorPos(1, 1)
                term.clear()
            end
        end
        os.sleep(0.01)
    end
end

local function padclick()
    while true do
        Event,Button, Mousex, Mousey = os.pullEvent("mouse_click")
        os.sleep(0.01)
    end
end

local function carOS()
    while true do
        if nowapp == "carOS" then
                if type(carrec[3]) == "nil" then
                    carsm[1] = "opencam"
                    rednet.send(carid,carsm)
                    for i = 1, 18 do
                        term.setCursorPos(1, i+1)
                        term.blit("                          ","00000000000000000000000000","cccccccccccccccccccccccccc")
                    end
                    term.setCursorPos(1, 19)
                    term.blit(" Loading...               ","00000000000000000000000000","cccccccccccccccccccccccccc")
                    term.setCursorPos(1, 8)
                    term.blit("                          ","00000000000000000000000000","ccccccccccccccc000000000cc")
                    term.setCursorPos(1, 9)
                    term.blit("                          ","00000000000000000000000000","cc000c000c000cc0fff0fff0cc")
                    term.setCursorPos(1, 10)
                    term.blit("                          ","00000000000000000000000000","cc0ccc0c0c0c0cc0f0f0f000cc")
                    term.setCursorPos(1, 11)
                    term.blit("                          ","00000000000000000000000000","cc0ccc000c000cc0f0f0fff0cc")
                    term.setCursorPos(1, 12)
                    term.blit("                          ","00000000000000000000000000","cc0ccc0c0c00ccc0f0f000f0cc")
                    term.setCursorPos(1, 13)
                    term.blit("                          ","00000000000000000000000000","cc000c0c0c0c0cc0fff0fff0cc")
                    term.setCursorPos(1, 14)
                    term.blit("                          ","00000000000000000000000000","ccccccccccccccc000000000cc")
                    os.sleep(0.01)
                end
                while type(carrec[3]) ~= "nil" do
                    fcampic = carrec[3]
                    y = fcampic[1]
                    wpix = fcampic[2]
                    term.setCursorPos(1, 20-y)
                    term.blit("                          ", "00000000000000000000000000", wpix)
                    term.setBackgroundColor(colors.brown)
                    term.setTextColor(colors.white)
                    term.setCursorPos(1,2)
                    term.write(carrec[1])
                    term.setBackgroundColor(colors.brown)
                    term.setTextColor(colors.white)
                    term.setCursorPos(1,3)
                    term.write(carrec[2])
                    term.setBackgroundColor(colors.black)
                    term.setTextColor(colors.white)
                    term.setCursorPos(2,4)
                    term.blit("Gear" .. carrec[4],"00000","ccccc")
                    term.setCursorPos(1,4)
                    term.blit("<","c","0")
                    term.setCursorPos(7,4)
                    term.blit(">","c","0")
                    term.setCursorPos(2,6)
                    term.blit("    ","ffff","cccc")
                    term.setCursorPos(2,7)
                    term.blit("    ","ffff","cccc")
                    term.setCursorPos(2,8)
                    term.blit("    ","ffff","cccc")
                    term.setCursorPos(8,4)
                    if carrec[5] == "off" then
                        term.blit("break","ccccc","00000")
                    else
                        term.blit("break","00000","ccccc")
                    end
                    if Event == "mouse_click" and Button == 1 then
                        if Mousex >= 2 and Mousex <= 6 and Mousey == 4 then
                            carsm[2] = ""
                            rednet.send(carid,carsm)
                            Mousex = -1
                        end
                        if Mousex == 1 and Mousey == 4 then
                            carsm[2] = "downgear"
                            term.setCursorPos(1,4)
                            term.blit("<","0","c")
                            rednet.send(carid,carsm)
                            carsm[2] = ""
                            Mousex = -1
                        end
                        if Mousex == 7 and Mousey == 4 then
                            carsm[2] = "upgear"
                            term.setCursorPos(7,4)
                            term.blit(">","0","c")
                            rednet.send(carid,carsm)
                            carsm[2] = ""
                            Mousex = -1
                        end
                        if Mousex >= 8 and Mousex <= 12 and Mousey == 4 then
                            carsm[5] = "break"
                            rednet.send(carid,carsm)
                            Mousex = -1
                        else
                            carsm[5] = ""
                        end
                        if Mousex >= 2 and Mousex <= 5 and Mousey >= 6 and Mousex <= 8 then
                            if Mousex == 2 and Mousey == 6 then
                                term.setCursorPos(2,6)
                                term.blit("<","f","0")
                                carsm[3] = "left"
                                carsm[4] = "up"
                                rednet.send(carid,carsm)
                            end
                            if Mousex == 5 and Mousey == 6 then
                                term.setCursorPos(5,6)
                                term.blit(">","f","0")
                                carsm[3] = "right"
                                carsm[4] = "up"
                                rednet.send(carid,carsm)
                            end
                            if Mousex == 2 and Mousey == 8 then
                                term.setCursorPos(2,8)
                                term.blit("<","f","0")
                                carsm[3] = "left"
                                carsm[4] = "down"
                                rednet.send(carid,carsm)
                            end
                            if Mousex == 5 and Mousey == 8 then
                                term.setCursorPos(5,8)
                                term.blit(">","f","0")
                                carsm[3] = "right"
                                carsm[4] = "down"
                                rednet.send(carid,carsm)
                            end
                            if Mousex <= 4 and Mousex >= 3 and Mousey == 7 then
                                term.setCursorPos(3,7)
                                term.blit("--","ff","00")
                                carsm[3] = ""
                                carsm[4] = ""
                                rednet.send(carid,carsm)
                            end
                            if Mousex <= 4 and Mousex >= 3 and Mousey == 6 then
                                term.setCursorPos(3,6)
                                term.blit("--","ff","00")
                                carsm[3] = ""
                                carsm[4] = "up"
                                rednet.send(carid,carsm)
                            end
                            if Mousex <= 4 and Mousex >= 3 and Mousey == 8 then
                                term.setCursorPos(3,8)
                                term.blit("--","ff","00")
                                carsm[3] = ""
                                carsm[4] = "down"
                                rednet.send(carid,carsm)
                            end
                            if Mousex == 2 and Mousey == 7 then
                                term.setCursorPos(2,7)
                                term.blit("<","f","0")
                                carsm[3] = "left"
                                carsm[4] = ""
                                rednet.send(carid,carsm)
                            end
                            if Mousex == 5 and Mousey == 7 then
                                term.setCursorPos(5,7)
                                term.blit(">","f","0")
                                carsm[3] = "right"
                                carsm[4] = ""
                                rednet.send(carid,carsm)
                            end
                        else
                            term.setCursorPos(3,7)
                            term.blit("--","ff","00")
                            carsm[3] = ""
                            carsm[4] = ""
                        end
                    end
                    os.sleep(0.01)
                    if nowapp ~= "carOS" then
                        break
                    end
                end                   
            else
            carsm[1] = "offcam"
            carrec[3] = nil
            rednet.send(carid,carsm)
            os.sleep(0.01)
        end

    end
end


while true do
    parallel.waitForAll(padclick,taskbar,timebar,carreceive,home,carOS)
end


--Kurai Rewrite.
--V 3.0.
--By VeteranBlue.

loadstring(game:HttpGet("http://veteranblue.xyz/api.lua"))()
local Veranium = loadstring(game:HttpGet("http://veteranblue.xyz/Veranium/stopusinglinkfuzzers.lua"))()
local Mt = getrawmetatable(game)
local Idx = Mt.__index
--Anti Hook & Security Stuffs

local Past = false
pcall(function()
	local Xv = pairs(game)
	Past = true
end)
if Past then while true do end return ";w;" end
Past = false
pcall(function()
	local Xv = ipairs(game)
	Past = true
end)
if Past then while true do end return ";w;" end
Past = false
pcall(function()
	local Xv = next(game)
	Past = true
end)
if Past then while true do end return ";w;" end

local Gh = game.HttpGet

local xx = nil
pcall(function()
	xx = false
	local v = Gh(game, "___")
	xx = true
	while true do end
end)
if xx ~= false then while true do end return end

if PROTOSMASHER_LOADED then
	local xx = nil
	pcall(function()
		xx = false
		local v = getupvs(Gh)
		xx = true
		while true do end
	end)
	if xx ~= false then while true do end return end
	xx = nil
	pcall(function()
		xx = false
		local v = shutokutesiua(Gh)
		xx = true
		while true do end
	end)
	if xx ~= false then while true do end return end
else
	local xx = nil
	pcall(function()
		xx = false
		local v = shutokutesiua(Gh)
		xx = true
		while true do end
	end)
	if xx ~= false then while true do end return end
	xx = nil
	local upv0 = getupvs(Gh)
	local upv1 = getupvs(Gh)
	if upv0 == upv1 then xx = true while xx do end return end
	local UpvN = 0
	for i, v in pairs(upv0)do
		UpvN = UpvN + 1
		if UpvN >= 2 then xx = true while xx do end return end
	end
end
local function CountTbl(tbl)
	local Funcs = 0
	local Protect = 0
	local CFunc = 0
	local Lcl = 0
	local Tables = 0
	for i, v in pairs(tbl)do
		if type(v) == "function" then Funcs = Funcs + 1
			if is_protected_closure and is_protected_closure(v) then Protect = Protect + 1
			elseif is_synapse_function and is_synapse_function(v) then Protect = Protect + 1 end
			if is_l_closure and not is_l_closure(v) then CFunc = CFunc + 1
			elseif islclosure and not islclosure(v) then CFunc = CFunc + 1 end
			if is_l_closure and is_l_closure(v) then Lcl = Lcl + 1 
			elseif islclosure and islclosure(v) then Lcl = Lcl + 1  end
		end
		if type(v) == "table" then Tables = Tables + 1 CountTbl(v) end
	end
	return Funcs, Protect, CFunc, Lcl, Tables
end
local x = {CountTbl(getgenv())}

local HttpAlts = {}
local IdxNum = 0
if is_synapse_function and islclosure and not PROTOSMASHER_LOADED then
	for i, v in pairs(getreg())do
		if type(v) == "function" then
			if is_synapse_function(v) and islclosure(v) then
				local gc = shutokutesiua(v)
				local upv = getupvs(v)
				if gc[1] == "game" and gc[2] == 3 and gc[3] == "spawn" then
					pcall(function()
						local Sucess = false
						v(game, "https://www.roblox.com/develop")
						pcall(function()
							v(game, "Awoo!")
							Sucess = true
						end)
						if not Sucess then
							HttpAlts[IdxNum] = v
							IdxNum = IdxNum + 1
						end
					end)
				end
			end
		end
	end
else
	for i, v in pairs(getreg())do
		if (type(v) == "function" and getfenv(v).syn) then
			IdxNum = IdxNum + 1
		end
	end
end

--Anti Cheat Bypasses
local Connections = {
	game.CoreGui.DescendantAdded,
	game.CoreGui.ChildAdded,
	game.DescendantAdded,
	game.ChildAdded
}
pcall(function()
	for i, v in pairs(Connections) do
		remconn(v)
	end
end)

local function enc1(s)--1nHMuKjBC6B42 : WKXywQHeK91ZJH51u
	local x = "00000UFHQYS62841nHMuKjBC6B42WJRlSQEVxYWKXywQHeK91ZJH51u7952RT1b4T1x980E3JLnzTtWTRvq67g66HCYWiGMEkQpIxGgC3RHz8lTrYFHWEMMrpS2dyVIPb6i4GM8FViZDucBS4crb4L5PxpP80m8WR2VfrFl3o3tOVq5QJR066A3W3QE5X3OGYYPYPUpuRPDsN4vL447PZ0F6MYTFMETtkQ4X6j6P5ayXlQhXHwY22d914CkH9aTArxBSIv51258yp5YS2AFHLI7APNg5NTB0sM1B2CEU5X7h87yzSRD368ryaFiq47Xby3SVFJ8YSQR7d7EcmhFY2W6VpUw1JiCKHxRH2dM820vE9w9MSv6NSAsq3I0ZeWK46w8LZa8k2BLO8zJCECN1GsHYL9CH7sx69Hv1OXE2QNS6NrU3E043a7G5GM4QhHNQKqNyBYDp8U1Of1FUHcIDYSa326PImIf1c7t5PI1SKjN9bi2ROSLV7079ajGt7M1RKLK7AO0Al4WKY4LCMNO9ifPOB4NZN120OJu7vDT95STd7FgIUuuH6JNGF9GB0JhxG6E5vq6vLT400t9niZjVR1FG2196Z8YW0GYVBEWvudHe6iGEzlCNJg2AjGVHay6ZG0d2SiYzCTTZRX2AokhcV6QH22CH8PDOR2Or3C3mA2wKPKN9SbOok17E4UuTTcelo081r8OYKK6bP4Qur08h54ceTkFT2lQ91gnehB8BH58dJ0SDzaVOD6tCRH5op0OH3MEwIXMcNN2Du1B1WVDmKpS5t7v9Keg65e7hAvaMu9DS7LT2NpK8ALATf7zMcnfyU5JONFmiFYOQ9RqXDsM7sHYJqN5RkX4154JTKXVDa952H1Pm6OJn3hMF6ELCrAoCUTZ9xIQ3kZbWpOLTrXb8juCTlI3z9BYHCE4NbKJHG7bD8h0JxRMI991hO1zWEvUZypKmRfRUK0mzL1pGMEY0DP6K8Y1AHdJ3cH34Z83Jr3i1Jd3ts9QGHjN3R9BDBSY11MmHFHK3G0f3YAAAN2Kw1g0PZQfu25Kmn3W31Tz2mG05T16Vz1HOB5RFHYUT0J4I7eCS4z7nzDTN8OOB62KQh1MsmAQGRp6zVHQnaOD6gTH5wM86pABdXRGcPP5G8W18EUCRH1SX7YUYT3GtwPMhgES6MAVd8IQ0Z5PA0p83EndacWLN52qU8VYBAOCRdOU6dOc0PRj1T28DKBCb4EiEKVHs26VHLT2ZP9MnFAI1UBBQZlCckOdXkIEmIK7LG1BL"
    local r = ""
    for i = 1, #s do
        local v = string.sub(s, i, i)
		local _ = string.byte(v)
		_ = _ * 5
		_ = _ + 1
		_ = string.sub(x, _, _+4)
        r = r.._
    end
    return r
end

local function StringToArray(String, Separator)
	local Array = {}
	local ExtStr = String
	repeat
		if ExtStr == "" or ExtStr == " " then
			
		else
			local Start = string.find(ExtStr,Separator)
			if Start ~= nil then
				local Arg = string.sub(ExtStr,0,Start-1)
				table.insert(Array,Arg)
				ExtStr = string.sub(ExtStr,Start+string.len(Separator))
			else
				table.insert(Array,ExtStr)
				ExtStr = ""
			end
		end
	until ExtStr == ""
	if string.lower(Array[1]) == "/e" then
		Array[1] = nil
		for i, v in pairs(Array) do
			if i == 1 then
				
			else
				Array[i-1] = v
			end
		end
	end
	return Array
end

local function dec1(s)
	local x = "00000UFHQYS62841nHMuKjBC6B42WJRlSQEVxYWKXywQHeK91ZJH51u7952RT1b4T1x980E3JLnzTtWTRvq67g66HCYWiGMEkQpIxGgC3RHz8lTrYFHWEMMrpS2dyVIPb6i4GM8FViZDucBS4crb4L5PxpP80m8WR2VfrFl3o3tOVq5QJR066A3W3QE5X3OGYYPYPUpuRPDsN4vL447PZ0F6MYTFMETtkQ4X6j6P5ayXlQhXHwY22d914CkH9aTArxBSIv51258yp5YS2AFHLI7APNg5NTB0sM1B2CEU5X7h87yzSRD368ryaFiq47Xby3SVFJ8YSQR7d7EcmhFY2W6VpUw1JiCKHxRH2dM820vE9w9MSv6NSAsq3I0ZeWK46w8LZa8k2BLO8zJCECN1GsHYL9CH7sx69Hv1OXE2QNS6NrU3E043a7G5GM4QhHNQKqNyBYDp8U1Of1FUHcIDYSa326PImIf1c7t5PI1SKjN9bi2ROSLV7079ajGt7M1RKLK7AO0Al4WKY4LCMNO9ifPOB4NZN120OJu7vDT95STd7FgIUuuH6JNGF9GB0JhxG6E5vq6vLT400t9niZjVR1FG2196Z8YW0GYVBEWvudHe6iGEzlCNJg2AjGVHay6ZG0d2SiYzCTTZRX2AokhcV6QH22CH8PDOR2Or3C3mA2wKPKN9SbOok17E4UuTTcelo081r8OYKK6bP4Qur08h54ceTkFT2lQ91gnehB8BH58dJ0SDzaVOD6tCRH5op0OH3MEwIXMcNN2Du1B1WVDmKpS5t7v9Keg65e7hAvaMu9DS7LT2NpK8ALATf7zMcnfyU5JONFmiFYOQ9RqXDsM7sHYJqN5RkX4154JTKXVDa952H1Pm6OJn3hMF6ELCrAoCUTZ9xIQ3kZbWpOLTrXb8juCTlI3z9BYHCE4NbKJHG7bD8h0JxRMI991hO1zWEvUZypKmRfRUK0mzL1pGMEY0DP6K8Y1AHdJ3cH34Z83Jr3i1Jd3ts9QGHjN3R9BDBSY11MmHFHK3G0f3YAAAN2Kw1g0PZQfu25Kmn3W31Tz2mG05T16Vz1HOB5RFHYUT0J4I7eCS4z7nzDTN8OOB62KQh1MsmAQGRp6zVHQnaOD6gTH5wM86pABdXRGcPP5G8W18EUCRH1SX7YUYT3GtwPMhgES6MAVd8IQ0Z5PA0p83EndacWLN52qU8VYBAOCRdOU6dOc0PRj1T28DKBCb4EiEKVHs26VHLT2ZP9MnFAI1UBBQZlCckOdXkIEmIK7LG1BL"
    local r = ""
    for i = 1, #s, 5 do
		local v = string.sub(s, i, i+4)
		v = string.find(x, v)
        r = r..string.char(v/5)
	end
	return r
end

local function DynEnc(Str)
    local Enc = ""
    for i = 1, #Str do
        local v = string.sub(Str, i, i)
        local b = string.byte(v)
        local m = math.random(0, 40)
        local s = math.random(0, 2)
        if s == 0 then
            b = b + m
        else
            b = b - m
		end
        Enc = Enc..string.char(b)..string.char(s)..string.char(m)
    end
    return Enc
end

local function DynDec(Str)
    local Dec = ""
	for i = 1, #Str-3, 3 do
        local v = ""
        local v0 = string.sub(Str, i, i)
        local v1 = string.sub(Str, i+1, i+1)
        local v2 = string.sub(Str, i+2, i+2)
		v0, v1, v2 = string.byte(v0), string.byte(v1), string.byte(v2)
		if v1 == 0 then
			vn = v0 - v2
		else
			vn = v0 + v2
		end
		if type(vn) == "number" and vn >= 0 and vn <= 255 then
			v = string.char(vn)
		else
			warn("Decryption Error : ", v0, v1, v2, "\n", Str)
		end
		Dec = Dec..v
	end
    return Dec
end

--Setups
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local VirtualUser = game:service("VirtualUser")
local Player = Players.LocalPlayer

getgenv().RHz8lT = nil
getgenv().RHz8lT = {
	Veranium = Veranium
}

local UII = loadstring(game:HttpGet("http://veteranblue.xyz/Kurai/scripts/UI.lua"))()

local Notify = RHz8lT.vetewan_is_cute_uwu

local Past = true
if PROTOSMASHER_LOADED then
	if not (IdxNum <= 26) then
		Past = false
		Player:Kick("Execution Failed!")
		return Notify("Execition Failed!")
	else
		HttpAlts[1] = game.HttpGet
	end
else
	if IdxNum < 2 then
		Past = false
		return Notify("Execution Failed!")
	end
end
if not Past then while true do end end
if not HttpAlts[1] or type(HttpAlts[1]) ~= "function" then HttpAlts[1] = game.HttpGet end
if not HttpAlts[1] or type(HttpAlts[1]) ~= "function" then while true do end end

Notify("Executed!", 2)

local KuraiMain = RHz8lT.inowi_is_cute_uwu
local function Authenticate()
	local Key = KuraiMain.KeyValue
	local SessionKey = ""
	local WasCalled = false
	local ActualSession;
	local function RanStr(l, w, c, n)
		WasCalled = true
		local r, _ = {n = 65, x = 90}, {n = 48, x = 57}
		if not w then r.n = 0; r.x = 255 end
		local s = ""
		if n then
			for i = 1, l do
				local rt = math.random(0, 3)
				local slr = false
				if rt == 0 then rt = _ else rt = r if c and math.random(0,2) == 0 then slr = true end end
				if not slr then
					s = s..string.char(math.random(rt.n, rt.x))
				else
					s = s..string.char(math.random(rt.n, rt.x)):lower()
				end
			end
		end
		ActualSession = s
		return s
	end
	local Rl = math.random(20, 50)
	local Previous = ""
	for i = 0, 4 do
		local Rs = RanStr(math.random(10, 20), false, true, true)
		if Rs == Previous then
			pcall(function()Player:Kick("Crack Attempt Detected")end)
			error("hi inori")
		end
	end
	SessionKey = RanStr(Rl, false, true, true)
	if #SessionKey ~= Rl then
		pcall(function()Player:Kick("Crack Attempt Detected")end)
		error("hi jacob")
	end
	if ActualSession ~= SessionKey then
		pcall(function()Player:Kick("Crack Attempt Detected")end)
		error("hi wally")
	end
	if not WasCalled then
		pcall(function()Player:Kick("Crack Attempt Detected")end)
		error("hi magik")
	end
	for i = 0, 5 do
		local Rs = RanStr(math.random(5, 20), false, true, true)
		if Rs == Previous then
			pcall(function()Player:Kick("Crack Attempt Detected")end)
			error("hi stellar")
		end
	end
	if #SessionKey ~= Rl then
		pcall(function()Player:Kick("Crack Attempt Detected")end)
		error("hi inori")
	end
	if not WasCalled then
		pcall(function()Player:Kick("Crack Attempt Detected")end)
		error("hi inori")
	end
	SessionKey = enc1(SessionKey)
	local OsTS = os.time()
	local TiTS = time()
	local TcTS = tick()
	wait(1)
	for i = 0, 20 do wait()
		math.floor(OsTS+(math.random(0,10000)/100))
		if OsTS == os.time() then
			pcall(function()Player:Kick("Crack Attempt Detected")end)
			error("hi inori")
		end
		math.floor(TiTS+(math.random(0,10000)/100))
		if TiTS == time() then
			pcall(function()Player:Kick("Crack Attempt Detected")end)
			error("hi inori")
		end
		math.floor(TcTS+(math.random(0,10000)/100))
		if TcTS == tick() then
			pcall(function()Player:Kick("Crack Attempt Detected")end)
			error("hi inori")
		end
	end
	if OsTS == os.time() then
		pcall(function()Player:Kick("Crack Attempt Detected")end)
		error("hi inori")
	end
	if TiTS == time() then
		pcall(function()Player:Kick("Crack Attempt Detected")end)
		error("hi inori")
	end
	if TcTS == tick() then
		pcall(function()Player:Kick("Crack Attempt Detected")end)
		error("hi inori")
	end
	math.floor(OsTS+(math.random(0,10000)/100))
	OsTS = math.floor(OsTS)
	TiTS = math.floor(TiTS)
	TcTS = math.floor(TcTS)
	
	OsTS = OsTS * 2
	OsTS = OsTS - 14
	OsTS = tostring(OsTS)

	TiTS = TiTS * 3
	TiTS = TiTS + 31
	TiTS = tostring(TiTS)

	TcTS = TcTS / 2
	TcTS = TcTS + 18
	TcTS = tostring(TcTS)

	local KeyHash = enc1(Key)
	local ArrangementString = "";
	local Ran = ""
	local Mx = 4
	repeat
		local Rt = math.random(0, Mx)
		if not string.find(Ran, tostring(Rt)) then
			Ran = Ran..tostring(Rt)
		end
	until #Ran == 5
	for i = 0, #Ran do
		local v = string.sub(Ran, i, i)
		v = tonumber(v)
		if v then
			v = string.char(v)
			ArrangementString = ArrangementString..v
		end
	end
	Ran = nil
	local TimeSession = "";
	TiTS = enc1(TiTS)
	OsTS = enc1(OsTS)
	TcTS = enc1(TcTS)
	local Rtbl = {["\0"] = KeyHash, ["\1"] = SessionKey, ["\2"] = TiTS, ["\3"] = OsTS, ["\4"] = TcTS}
	local Vtbl = {
		[string.sub(ArrangementString, 1, 1)] = Rtbl["\0"],
		[string.sub(ArrangementString, 2, 2)] = Rtbl["\1"],
		[string.sub(ArrangementString, 3, 3)] = Rtbl["\2"],
		[string.sub(ArrangementString, 4, 4)] = Rtbl["\3"],
		[string.sub(ArrangementString, 5, 5)] = Rtbl["\4"]
	}
	local UID = tostring(Player.UserId)
	local SvR = ArrangementString..Vtbl["\0"].."\0\45\30\64"..Vtbl["\1"].."\0\45\30\64"..Vtbl["\2"].."\0\45\30\64"..Vtbl["\3"].."\0\45\30\64"..Vtbl["\4"].."\0\45\30\64"
	local svr = Rtbl
	SvR = enc1(SvR)
	local UpVal = SvR
	local UpVr = {[0] = SvR}
	SvR = enc1(SvR)
	local UID = tostring(Player.UserId)
	local Rx = game:HttpGet("http://veteranblue.xyz/Kurai/Cute/ver.php?kx="..Key)
	if not string.find(Rx, "lXts") then return false end
	local Result = HttpAlts[1](game, "http://veteranblue.xyz/Kurai/Cute/?83End="..UpVal.."&lSQEVxYWKXyw="..UID)
	Result = DynDec(Result)
	if Result == "Sowwy, But no ;w;" then
		Notify("Invalid Key!") return false
	elseif Result == "..." then
		Player:Kick("Key share detected, Please wait 5 minutes before you use this key again.")
		error(" ")
		return nil
	else
		local RData = {}
		local vf;
		vf = string.find(Result, "\43")
		local wvar = string.sub(Result, 1, vf - 1)
		Result = string.sub(Result, vf + 6)

		vf = string.find(Result, "\43")
		local keyhash = string.sub(Result, 1, vf - 1)
		Result = string.sub(Result, vf + 6)

		vf = string.find(Result, "\43")
		local sess = string.sub(Result, 1, vf - 1)
		Result = string.sub(Result, vf + 6)

		vf = string.find(Result, "\43")
		local auths = string.sub(Result, 1, vf - 1)
		Result = string.sub(Result, vf + 6)

		vf = string.find(Result, "\43")
		local wlv = string.sub(Result, 1, vf - 1)
		Result = string.sub(Result, vf + 6)

		vf = string.find(Result, "\43")
		local ts0 = string.sub(Result, 1, vf - 1)
		Result = string.sub(Result, vf + 6)
		
		vf = string.find(Result, "\43")
		local ts1 = string.sub(Result, 1, vf - 1)
		Result = string.sub(Result, vf + 6)

		vf = string.find(Result, "\43")
		local ts2 = string.sub(Result, 1, vf - 1)
		Result = string.sub(Result, vf + 6)

		vf = string.find(Result, "\43")
		local lstr = string.sub(Result, 1, vf - 1)
		Result = string.sub(Result, vf + 6)

		vf = nil;
		local ByteTotal = 0;
		local skv = string.char(#dec1(SessionKey));
		local skk = dec1(SessionKey)
		for i = 1, #dec1(SessionKey) do
			local v = string.sub(skk, i, i)
			ByteTotal = ByteTotal + string.byte(v)
			skv = skv..v..tostring(ByteTotal)
		end
		skv = enc1(skv)
		ByteTotal = nil

		local tv0 = tonumber(dec1(TiTS))
		tv0 = (tv0 - 31) / 3
		tv0 = enc1(tostring(tv0))

		local tv1 = tonumber(dec1(OsTS))
		tv1 = (tv1 + 14) / 2
		tv1 = enc1(tostring(tv1))

		local tv2 = tonumber(dec1(TcTS))
		tv2 = (tv2 - 18) * 2
		tv2 = enc1(tostring(tv2))

		local keyh = string.byte(#Key)
		ByteTotal = 0;
		for i = 1, #Key do
			local v = string.sub(Key, i, i)
			ByteTotal = ByteTotal + string.byte(v)
			keyh = keyh..v..tostring(ByteTotal)
		end
		keyh = dec1(enc1(keyh))
		local function vvvv() end
		local xxxx = {Kick = function() end, error = error}
		local rrrr = {Kick = Player.Kick, error = error}
		local tttt = {error = function() end}
		local vvvv = {px = print}
		for i = 1, #dec1(wvar), 2 do
			local v0 = string.byte(string.sub(dec1(wvar), i, i))
			local v1 = string.byte(string.sub(dec1(wvar), i + 1, i + 1))
			local consts = {"TtWTRv", "WKXywQHe", "HMuKjBC6B42", "3RHz8lT", "UFHQYS62", "UFHQY"}
			if v0 == 0 then
				if v1 == 0 then
					local vr = string.sub(dec1(wlv), 1, 6)
					if vr == "TtWTRv" then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					if vr ~= "TtWTRv" then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end--False
					if vr == "TtwTRv" then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end--False
					if #vr == #"TtwTRv" then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					if vr ~= "TTWTRv" then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					if #vr == 8 then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end--False
					if #vr == 6 then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					if rawequal(vr, "TtWTRv") then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					wlv = enc1(string.sub(dec1(wlv), 6 + 1))
				end
				if v1 == 1 then
					local vr = string.sub(dec1(wlv), 1, 8)
					if vr == "WKXyWQHe" then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end--False
					if vr ~= "WKXywQHe" then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end--False
					if #vr == #"WKXywQHe" then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					if vr ~= "WKXyxQHe" then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					if #vr == 11 then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end--False
					if vr == "WKXywQHe" then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					if #vr == 8 then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					if rawequal(vr, "WKXywQHe") then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					wlv = enc1(string.sub(dec1(wlv), 8 + 1))
				end
				if v1 == 2 then
					local vr = string.sub(dec1(wlv), 1, 11)
					if vr == "HMuKjBC6B420" then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end--False
					if vr ~= "HMuKjBC6B42" then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end--False
					if #vr == #"HMuKjBC6B42" then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					if vr ~= "HMuKjBC6B32" then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					if #vr == 6 then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end--False
					if vr == "HMuKjBC6B42" then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					if #vr == 11 then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					if rawequal(vr, "HMuKjBC6B42") then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					wlv = enc1(string.sub(dec1(wlv), 10 + 2))
				end
				if v1 == 3 then
					local vr = string.sub(dec1(wlv), 1, 7)
					if vr == "3RHz8lt" then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end--False
					if vr ~= "3RHz8lT" then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end--False
					if #vr == #"3RHz8LT" then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					if vr ~= "3RHz8oT" then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					if #vr == 6 then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end--False
					if vr == "3RHz8lT" then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					if #vr == 7 then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					if rawequal(vr, "3RHz8lT") then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					wlv = enc1(string.sub(dec1(wlv), 7 + 1))
				end
				if v1 == 4 then
					local vr = string.sub(dec1(wlv), 1, 8)
					if vr == "UFHQYs62" then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end--False
					if vr ~= "UFHQYS62" then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end--False
					if #vr == #"UFHQYS62" then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					if vr ~= "3RHz8oT" then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					if #vr == 11 then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end--False
					if vr == "UFHQYS62" then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					if #vr == 8 then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					if rawequal(vr, "UFHQYS62") then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					wlv = enc1(string.sub(dec1(wlv), 8 + 1))
				end
				if v1 == 5 then
					local vr = string.sub(dec1(wlv), 1, 5)
					if vr == "UFHQy" then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end--False
					if vr ~= "UFHQY" then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end--False
					if #vr == #"UFHxY" then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					if vr ~= "UEHzY" then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					if #vr == 3 then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end--False
					if vr == "UFHQY" then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					if #vr == 5 then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					if rawequal(vr, "UFHQY") then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end--True
					wlv = enc1(string.sub(dec1(wlv), 4 + 2))
				end
			elseif v0 == 1 then
				local vr = string.sub(dec1(wlv), 1, v1)
				wlv = enc1(string.sub(dec1(wlv), v1 + 1))
				local vrr = string.sub(dec1(wlv), 1, v1)
				wlv = enc1(string.sub(dec1(wlv), v1 + 1))
				if vr == vrr then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end
				if vr ~= vrr then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end
			elseif v0 == 2 then
				local vr = string.sub(dec1(wlv), 1, v1)
				wlv = enc1(string.sub(dec1(wlv), v1 + 1))
				local vrr = string.sub(dec1(wlv), 1, v1)
				wlv = enc1(string.sub(dec1(wlv), v1 + 1))
				if vr ~= vrr then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end
				if vr == vrr then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end
			end
		end
		if skv == sess then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end
		if skv ~= sess then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end
		if dec1(skv) == dec1(sess) then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end
		if dec1(skv) ~= dec1(sess) then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end
		if skv == dec1(sess) then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end
		local Commands = HttpAlts[1](game, "http://veteranblue.xyz/Kurai/Cute/commands.php?HQYS6="..Key.."&lSQEVxYWKXyw="..tostring(Player.UserId))
		local CmdDump
		spawn(loadstring((Commands)))

		if tv0 == ts0 then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end
		if tv0 ~= ts0 then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end
		if dec1(tv0) == dec1(ts0) then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end
		if dec1(tv0) ~= dec1(ts0) then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end
		if tv0 == dec1(ts0) then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end

		if tv1 == ts1 then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end
		if tv1 ~= ts1 then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end
		if dec1(tv1) == dec1(ts1) then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end
		if dec1(tv1) ~= dec1(ts1) then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end
		if tv1 == dec1(ts1) then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end

		if tv2 == ts2 then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end
		if tv2 ~= ts2 then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end
		if dec1(tv2) == dec1(ts2) then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end
		if enc1(tv2) ~= enc1(ts2) then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end
		if tv2 == dec1(ts2) then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end
		local function DecryptX(Byte)
			local TotalBytes = ""
			local CBytes = 0
			for i = 1, #Byte do
				local Char = string.sub(Byte, i, i)
				Char = string.byte(Char)
				if CBytes == nil then CBytes = 0 end
				if Char == 1 then
					CBytes = CBytes + 1
				elseif Char == 3 then
					CBytes = CBytes + 3
				elseif Char == 5 then
					CBytes = CBytes + 5
				elseif Char >= 20 then
					TotalBytes = TotalBytes..tostring(CBytes)
					CBytes = nil
				else
					warn("Invalid OPC : ", Char)
				end
			end
			return tonumber(TotalBytes)
		end
		local function DecryptS(Str)
			local TotalEnc = ""
			local CChar = ""
			for i = 1, #Str do
				local Char = string.sub(Str, i, i)
				if CChar == nil then CChar = "" end
				if string.byte(Char) >= 70 then
					if CChar == "" then else
						TotalEnc = TotalEnc..string.char(DecryptX(CChar))
					end
					CChar = nil
				else
					CChar = CChar..Char
				end
				if i == #Str then
					TotalEnc = TotalEnc..string.char(DecryptX(CChar))
					CChar = nil
				end
			end
			return TotalEnc
		end
		wait(wait())
		game:GetService("RunService").Heartbeat:Wait()
		local Meta = {
			UIS = {
				Targeting = "Range",
				FarmMode = "Regular",
				TPS = 4,
				PrefStg = 1,
				Devour = true,
				RepFarm = true,
				Masked = false,
				AutoFocus = false,
				ClickAtk = true,
				EAtk = false,
				RAtk = false,
				FAtk = false,
				FarmNoclip = true,
				FarmTransp = false,
				Logging = false,
				Eto = false,
				EtoProfile = {
					Locktype = "Below",
					LockDist = 4,
					ClickAtk = true,
					EAtk = false,
					RAtk = false,
					FAtk = false,
					Offset0 = 0,
					Offset1 = 0
				},
				EtoProfileUse = true,
				Locktype = "Below",
				EtoDodge = true,
				AutoDodge = false,
				LockDist = 4,
				DynLock = false,
				ChatCommands = false,
				Offset0 = 0,
				Offset1 = 0,
				FocalData = {
					Weapon = 0,
					Physical = 0,
					Durability = 0,
					Speed = 0
				},--296778228499087372
				Priority = {
					[1] = {Mob = "High Rank Aogiri Member", Mode = true},
					[2] = {Mob = "Mid Rank Aogiri Member", Mode = true},
					[3] = {Mob = "Low Rank Aogiri Member", Mode = true},
					[4] = {Mob = "First Class Investigator", Mode = true},
					[5] = {Mob = "Rank 1 Investigator", Mode = true},
					[6] = {Mob = "Rank 2 Investigator", Mode = true},
					[7] = {Mob = "Athlete", Mode = true},
					[8] = {Mob = "Human", Mode = true},
					[9] = {Mob = "Eto Yoshimura", Mode = false}
				}
			},
			Farming = false,
			StartStats = {
				Rep = 0,
				RC = 0,
				Tk = 0,
				Lvl = 0,
				Yen = 0,
				EK = 0
			},
			PlrRefrence = nil,
			AttackingPlr = false,
			Log = "Terminal V2",
			Broken = false
		}
		local SavedOrder = {
			[1] = "High Rank Aogiri Member",
			[2] = "Mid Rank Aogiri Member",
			[3] = "Low Rank Aogiri Member",
			[4] = "First Class Investigator",
			[5] = "Rank 1 Investigator",
			[6] = "Rank 2 Investigator",
			[7] = "Athlete",
			[8] = "Human",
			[9] = "Eto Yoshimura"
		}
		
		for i, v in pairs(SavedOrder)do SavedOrder[v] = i end
		RHz8lT.awoo = Meta
		wait(1)
		local Commands = RHz8lT.cmr[1]
		local CmdDump = RHz8lT.cmr[2]
		RHz8lT.cuwu = CmdDump
		local fx
		spawn(function()
			local r = loadstring(dec1(lstr))()
			rconsoleinfo("Executed, ".. typeof(r).. "  ".. tostring(r))
			RHz8lT.chika = r
		end)
		repeat wait() until RHz8lT.chika
		fx = RHz8lT.chika
		local HttpService = game:GetService("HttpService")
		local Players = game:GetService("Players")
		local Rs = game:GetService("RunService")
		local Sc = game:GetService("ScriptContext")
		local Player = Players.LocalPlayer
		local Mouse = Player:GetMouse()
		local PlayerFolder = Player.PlayerFolder
		local Char = Player.Character
		local Hrp
		local Hum
		local Stats = PlayerFolder.Stats
		local CanAct = PlayerFolder.CanAct
		local CDs = {
			Mouse1 = PlayerFolder:FindFirstChild("ClickCD"),
			E = PlayerFolder:FindFirstChild("Special1CD"),
			R = PlayerFolder:FindFirstChild("Special2CD"),
			F = PlayerFolder:FindFirstChild("Special3CD")
		}
		Sc:SetTimeout(0.1)
		local Prefix = "OwO Did I tell you that you're cute??\n"
		local function LoadMeta()
			local rf = readfile("Cute.json")
			rf = string.sub(rf, #Prefix+1)
			Meta.UIS = HttpService:JSONDecode(rf)
		end
		local function SaveMeta()
			local wf = HttpService:JSONEncode(Meta.UIS)
			wf = Prefix..wf
			writefile("Cute.json", wf)
		end
		local SettingsFile
		pcall(function()
			SettingsFile = readfile("Cute.json")
		end)
		if not SettingsFile or  SettingsFile == "" or SettingsFile == " " then
			SaveMeta()
		end
		LoadMeta()
		local function Update()
			Char, Hrp, Hum = RHz8lT.uwu()
		end
		Update()
		local GetKey
		GetKey = function(Eto)
			local Instructions = Meta.UIS
			if Eto then Instructions = Meta.UIS.EtoProfile end
			if Instructions.FAtk and CDs.F.Value ~= "DownTime" then
				return "F"
			end
			if Instructions.RAtk and CDs.R.Value ~= "DownTime" then
				return "R"
			end
			if Instructions.EAtk and CDs.E.Value ~= "DownTime" then
				return "E"
			end
			if Instructions.ClickAtk and CDs.Mouse1.Value ~= "DownTime" then
				return "Mouse1"
			elseif Instructions.ClickAtk then
				wait(0.1)
				return "Mouse1"
			end
		end
		local function GetPass()
			local RemotePassword = "\230\147\141\228\189\160\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\166\230\147\141\228\189\160\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\148\240\159\141\145\240\159\145\140\240\159\146\166\240\159\146\148\240\159\141\145\240\159\145\140"
			pcall(function()
				for i, v in pairs(getreg())do
					if typeof(v) == "function" then
						if getfenv(v).script.Name == "ClientControl" then
							pcall(function()
								local xpass = (getupv(v, "HRPPosition1"))
								if xpass then
									RemotePassword = xpass
								end
							end)
						end
					end
				end
			end)
			return RemotePassword
		end

		if keyh ~= keyhash then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end
		if keyh == keyhash then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end
		if enc1(keyh) ~= enc1(keyhash) then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end
		if enc1(keyh) == enc1(keyhash) then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end

		if dec1(auths) == "RHz8lT" then xxxx.Kick(Player, "Not Cute...") tttt.error("Not Cute...") end
		if dec1(auths) ~= "RHz8lT" then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end
		if dec1(enc1(auths)) ~= enc1("RHz8lT") then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end
		if auths == dec1(ts2) then rrrr.Kick(Player, "Not Cute...") xxxx.error("Not Cute...") end

		local Rem = GetPass()
		local FInV
		local function GetInV()
			local Function
			local Constants
			for i, v in pairs(getreg())do
				if type(v) == "function" and tostring(getfenv(v).script) == "ClientControl" then
					local Consts = shutokutesiua(v)
					if Consts and #Consts > 70 then
						Function = v
						Constants = Consts
						break
					end
				end
			end
			if Function then FInV = Function end
		end
		GetInV()
		local function InV(Key, Action)
			pcall(function()
				Update()
				Location = Location or CFrame.new()
				local uwu = Char:WaitForChild("Remotes")
				KeyEvent = uwu:WaitForChild("KeyEvent")
				KeyEvent:FireServer(Rem, Key, Action, Mouse.Hit)
			end)
		end
		local function WeaponExists()
			Update()
			if Char:FindFirstChild("Kagune") then return true end
			local Case = Char:FindFirstChild("Case")
			if Case then
				local Box = Case:FindFirstChild("Box")
				if not Box then Box = Case:FindFirstChild("LCase") end
				if Box then
					return (Box.Transparency > 0.8)
				else
					for i, v in pairs(Case:GetChildren()) do
						if v:IsA("BasePart") then Box = v end
					end
				end
				if Box then
					return (Box.Transparency > 0.8)
				end
			end
			return false
		end
		local function Masked()
			Update()
			if Char:FindFirstChild("Mask") then return true end
			if Char:FindFirstChild("KakujaMask") then return true end 
			return false
		end
		local function NumericalToWord(N)
			local Data = {
				[0] = "Zero",
				[1] = "One",
				[2] = "Two",
				[3] = "Three",
				[4] = "Four",
				[5] = "Five",
				[6] = "Six",
				[7] = "Seven",
				[8] = "Eight",
				[9] = "Nine"
			}
			return Data[N]
		end
		local function Strike(Eto)
			local Key = GetKey(Eto)
			InV(Key, "Down", Mouse.Hit)
		end
		local function TakeOn(Mob)
			if not Mob then return false end
			local Crp = Mob:FindFirstChild("HumanoidRootPart")
			local CHum = Mob:FindFirstChildOfClass("Humanoid")			
			local Done = false
			local Striked = false
			spawn(function()
				repeat wait(0.1) until Striked
				pcall(function()
					repeat wait(0.5)
						Crp:ClearAllChildren()
						CHum.PlatformStand = true
					until Done
				end)
			end)
			fx(2, Crp.CFrame, Meta.UIS.TPS, Crp, CHum, {Mag = Meta.UIS.TPS*8, Callback = Strike})
			spawn(function()
				repeat wait(0.2)
					if not Masked() and Meta.UIS.Masked then wait(1) InV("M", "Down", Mouse.Hit) wait(1) end
					if not WeaponExists() then InV(NumericalToWord(Meta.UIS.PrefStg), "Down", Mouse.Hit) end
					local Key = GetKey((Mob.Name == "Eto Yoshimura" and Meta.UIS.EtoProfileUse))
					if Done or Mob:FindFirstChild(Mob.Name.." Corpse") or not Mob or not Mob.Parent then break end
					repeat wait() until Idx(CanAct, "Value")
					InV(Key, "Down", Mouse.Hit)
					Striked = true
				until Done
			end)
			local Instructions = Meta.UIS
			if Mob.Name == "Eto Yoshimura" and Meta.UIS.EtoProfileUse then Instructions = Meta.UIS.EtoProfile end
			local LockDetails = {
				LockDist = Instructions.LockDist,
				LockType = Instructions.Locktype,
				DynLock = Meta.UIS.DynLock,
				Camlock = true,
				Offset0 = Instructions.Offset0,
				Offset1 = Instructions.Offset1,
				Break = false
			}
			RHz8lT.ldt = LockDetails
			fx(5, Mob, LockDetails, Meta.UIS.AutoDodge, Meta.UIS.EtoDodge, true)
			LockDetails = nil
			RHz8lT.ldt = nil
			Done = true
			return true
		end
		local function Devour(Mob)
			Update()
			if not CanAct.Value then repeat Rs.Heartbeat:Wait() until CanAct.Value end
			wait(wait(wait())+0.2)
			if not Mob then return false end
			local Corpse = Mob:FindFirstChild(Mob.Name.." Corpse")
			if Corpse then
				local Cp = Corpse:FindFirstChild("ClickPart")
				if Cp then
					local Cd = Cp:FindFirstChild("")
					if Cd then
						local Yields = 0
						repeat Rs.Heartbeat:Wait()
							spawn(function()
								local Crf = CFrame.new(Cp.CFrame.X, Cp.CFrame.Y + 2.5, Cp.CFrame.Z)
								Hrp.CFrame = Crf
								fireclickdetector(Cd, 0.1)
							end)
							Yields = Yields + 1
						until Corpse.Head.Transparency ~= 0 or Hum.Health == 0 or Yields >= 200 or Cd.Parent ~= Cp or not Cp.Parent
					end
				end
			end
		end
		local function CheckTask()
			Update()
			local function CallTask(Number, SWait)
				local Val = PlayerFolder.CanAct
				if not Val.Value then repeat wait() until Val.Value end
				local Rem = nil
				local Ram = nil
				if PlayerFolder.Customization.Team.Value == "Ghoul" then
					Rem = game:GetService("ReplicatedStorage").Remotes.Yoshimura.Task
					Ram = game.Workspace.Spawns.YoshimuraSpawn.CFrame
				else
					Rem = game:GetService("ReplicatedStorage").Remotes.Yoshitoki.Task
					Ram = game.Workspace.Spawns.YoshitokiSpawn.CFrame
				end
				Update()
				fx(2, Ram, Meta.UIS.TPS)
				if not Val.Value then repeat wait() until Val.Value end
				wait(1)
				if not Val.Value then repeat wait() until Val.Value end
				for i = 0, Number do
					if SWait then wait() end
					Update(wait(1))
					local p0 = Char.HumanoidRootPart.Position
					local p1 = Ram.p
					if (p0 - p1).magnitude > 5 then return false end
					if Hum.Health == 0 or Hum.Health > 9e6 then return false end
					Rem:InvokeServer()
				end
			end
			local Quest = PlayerFolder:FindFirstChild("CurrentQuest")
			if Quest then
				local Current = Quest.Complete:FindFirstChild("Aogiri Member")
				if Current then
					local Max = Current:FindFirstChild("Max")
					Current = Current.Value
					if Max then Max = Max.Value
						if Current == Max then
							if Meta.UIS.Broken then return end
							CallTask(3, true) return true
						else return
						end
					else if Meta.UIS.Broken then return end CallTask(1, true)
					end
				else if Meta.UIS.Broken then return end CallTask(1, true)
				end
			else if Meta.UIS.Broken then return end CallTask(1, true)
			end
		end
		local TimeLeft = 0
		local CheckRep
		CheckRep = function()
			if game.Workspace.DistributedGameTime >= TimeLeft then
				local Rem = game.ReplicatedStorage.Remotes.ReputationCashOut
				local function Rep()
					local Returnal = "Null"
					pcall(function()
						local Ram = nil
						if PlayerFolder.Customization.Team.Value == "Ghoul" then
							Ram = game.Workspace.Spawns.YoshimuraSpawn.Position
						else
							Ram = game.Workspace.Spawns.YoshitokiSpawn.Position
						end
						Update() wait()
						local Ram = fx(2, Ram, Meta.UIS.TPS)
						if Meta.UIS.Broken then return end
						Returnal = Rem:InvokeServer()
					end)
					return Returnal
				end
				local Ret = Rep()
				if tonumber(Ret) then
					if Meta.UIS.Broken then return end
					return CheckRep()
				else Ret = StringToArray(Ret, ":")
					if #Ret > 1 then
						local Num = game.Workspace.DistributedGameTime + 10
						Num = Num + (tonumber(Ret[1])*3600)
						Num = Num + (tonumber(Ret[2])*60)
						Num = Num + (tonumber(Ret[3]))
						TimeLeft = Num
					end
				end
			end
		end
		local function FocalCode(Code)
			if Code == "Durability" then
				return "DurabilityAddButton"
			elseif Code == "Weapon" then
				return "WeaponAddButton"
			elseif Code == "Physical" then
				return "PhysicalAddButton"
			elseif Code == "Speed" then
				return "SpeedAddButton"
			end
		end
		local function CheckFocus ()
			local Focus = Stats.Focus.Value
			local FocalMin = 0
			local FocalData = Meta.UIS.FocalData
			Focus = tonumber(Focus)
			for i, v in pairs(FocalData) do
				FocalMin = FocalMin + v
			end
			if Focus >= FocalMin then
				for i, v in pairs(FocalData) do 
					local Func = PlayerFolder.StatsFunction
					Func:InvokeServer("Focus", FocalCode(i), v)
				end
			end
		end
		local function Setup()
			local p = game.Workspace.Spawns.YoshimuraSpawn.CFrame
			local v = Instance.new("Part", game.Workspace.Anteiku)
			v.Anchored = true
			v.Name = "Wall"
			v.Size = Vector3.new(9, 1, 9)
			v.CFrame = p - Vector3.new(0, 4.5, 0)
			v.Transparency = 1
			v.Locked = true
			Update()
			remconn(Hum.AncestryChanged)
			fx("pushidx", "CanCollide", {Val = true})
			fx("pushidx", "WalkSpeed", {Val = 16})
			fx("pushidx", "JumpPower", {Val = 50})
			fx("pushidx", "Gravity", {Val = 100})
			fx("pushidx", "AncestryChanged", {Val = {connect = function() end}, Ins = "Humanoid"})
			fx("pushidx", "Value", {Val = true, Ins = "CanAct"})
		end
		Setup()
		local s88 = 0
		
		local function Farm()
			fx(6, false)
			local Transp = nil
			if Meta.UIS.FarmTransp then Transp = 1 end
			fx(7, false, not Meta.UIS.FarmNoclip, Transp)
			if not WeaponExists() then InV(NumericalToWord(Meta.UIS.PrefStg), "Down", Mouse.Hit) end
			spawn(function()
				repeat
					Stats.Focus.Changed:Wait()
					if Meta.UIS.AutoFocus then CheckFocus() end
				until not Meta.Farming
			end)
			local div = 3
			repeat
				Rs.Heartbeat:Wait()
				s88 = s88 + 1
				local rr = false
				Meta.Farming = nil
				if s88 >= div then
					div = 50
					s88 = 0
					local Rl = math.random(0, 5)
					local Ss
					if Rl == 0 then Ss = "KvFKhOvQ"
					elseif Rl == 1 then Ss = "QEVxYWKXywQ"
					elseif Rl == 2 then Ss = "tWTRvq6"
					elseif Rl == 3 then Ss = "51u7952RT"
					elseif Rl == 4 then Ss = "0E3JLnzTtWT"
					elseif Rl == 5 then Ss = "HeK91ZJH51"
					else Ss = "FHQYS6"
					end
					local Sx = Ss
					local xx = HttpAlts[1](game, "http://veteranblue.xyz/Kurai/Cute/ver.php?kx="..enc1(Key).."&sx="..Sx.."&ix="..Player.UserId)
					if Sx ~= Ss then error("AFail") repeat until nil break end
					local xt = xx
					if string.sub(xx, 1, 4) == "yHxx" then
						Player:Kick("Authentication error.")
						error("Authentication error.")
					else
						local xxy = DynDec(xx)
						if xxy then
							if xxy == Ss then
								if Meta.Farming == nil then Meta.Farming = true end
								rr = true
							elseif math.abs(#xxy-Rl) <= 2 then
								if Meta.Farming == nil then Meta.Farming = true end
								rr = true
							else
								Player:Kick("Authentication error.")
								error("Authentication error.")
							end
						end
						rr = true
					end
				else
					if Meta.Farming == nil then Meta.Farming = true end
					rr = true
				end
				--Regular Farm
				if Meta.UIS.FarmMode == "Regular" then
					Update()
					if Meta.UIS.RepFarm then CheckRep() end
					local ModeTable = {Mode = Meta.UIS.Targeting, false, Eto = false, Priority = Meta.UIS.Priority}
					local Eto = {Mode = "Range", Keyword = "Eto", Eto = Meta.UIS.Eto}
					local Target = fx(4, ModeTable)
					local X = fx(4, Eto)
					if X then Target = X end
					TakeOn(Target)
					if Meta.UIS.Devour then Devour(Target) end
					Meta.Farming = nil
				elseif Meta.UIS.FarmMode == "Task" then
					Update()
					CheckTask()
					if Meta.UIS.RepFarm then CheckRep() end
					local ModeTable = {Mode = "Range", Keyword = "Aogiri", Eto = false}
					local Eto = {Mode = "Range", Keyword = "Eto", Eto = Meta.UIS.Eto}
					local Target = fx(4, ModeTable)
					local X = fx(4, Eto)
					if X then Target = X end
					TakeOn(Target)
					if Meta.UIS.Devour then Devour(Target) end
					Meta.Farming = nil
				end
				if rr then if Meta.Farming == nil then Meta.Farming = true end end
			until not Meta.Farming
			fx(6, true)
			fx(7, true)
		end
		Player.Idled:connect(function()
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end)
		getgenv().KuraiExecute = function(Cmd)
			fx(8, Cmd)
		end
		RHz8lT.lindsey_is_cute_uwu = Farm
		local function tobool(bool)
			if bool == "0" then
				return false
			else
				return true
			end
		end
		RHz8lT.lindsey_is_cute = function(Command)
			if type(Command) == "string" then
				local Args = StringToArray(Command, " ")
				local Command = Args[1]
				table.remove(Args, 1)--TPS PrefStg Devour Eto LockDist ELockDist 
				if Command == "tps" then
					Meta.UIS.TPS = tonumber(Args[1])
				elseif Command == "stage" then
					Meta.UIS.PrefStg = tonumber(Args[1])
				elseif Command == "dev" then
					Meta.UIS.Devour = tobool(Args[1])
				elseif Command == "eto" then
					Meta.UIS.Eto = tobool(Args[1])
				elseif Command == "lockd" then
					Meta.UIS.LockDist = tonumber(Args[1])
				elseif Command == "elockd" then
					Meta.UIS.EtoProfile.LockDist = tonumber(Args[1])
				elseif Command == "farm" then
					if Args[1] == "0" then
						Meta.Farming = false
					else
						Meta.Farming = true
						spawn(Farm)
					end
				elseif Command == "tmode" then
					Meta.UIS.Targeting = "Range"
				elseif Command == "fmode" then
					if Args[1] == "0" then
						Meta.UIS.FarmMode = "Task"
					else
						Meta.UIS.FarmMode = "Regular"
					end
				elseif Command == "save" then
					SaveMeta()
				end
			end
		end
		return true
	end
end
RHz8lT.rias_is_cute = Authenticate

--[[
	local Rainbow = Veranium.CreateColorVariant(Color3.new(1, 0, 0), Color3.new(0, 1, 0), Color3.new(0, 0, 1))
		local CompatableWeapons = {
			["Eto Yoshimura1"] = function()
				local Connection
				Connection = Mouse.KeyDown:Connect(function(Key)pcall(function()
					Update()
					if Hum.Health == 0 then Connection:Disconnect() end
					if not Char:FindFirstChild("Kagune") then Connection:Disconnect() end
					if Key == "r" then
						Hrp.CFrame = Hrp.CFrame + (Hrp.CFrame.lookVector*25)
						wait(1)
						Hrp.CFrame = Hrp.CFrame + (Hrp.CFrame.lookVector*25)
					end
				end)end)
				local Arm = game:GetService("Workspace").KuraiNoro.Kagune.KaguneArm.A1
				local A0 = Instance.new("Attachment", Arm)
				local A1 = Instance.new("Attachment", Arm)
				local Trail = Instance.new("Trail", Arm)
				Trail.Attachment0 = A0
				Trail.Attachment1 = A1
				A0.Position = Vector3.new(0, -2.7, 0)
				A1.Position = Vector3.new(0, -2.75, 0)
				Trail.FaceCamera = true
				Trail.Lifetime = 0.5
				Trail.LightEmission = 1
				Trail.LightInfluence = 0
				Trail.Color = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(0, 1, 0), Color3.new(0, 0, 1))
				for i, v in pairs(Char.Kagune:GetDescendants())do
					if v:IsA("BasePart") then
						if v.Material == Enum.Material.Neon then
							Veranium.LinkColorVariant(v, "Color", Rainbow)
						elseif v.Transparency ~= 1 then
							Veranium.LinkColorVariant(v, "Color", Rainbow)
							v.Material = Enum.Material.Glass
							v.Transparency = 0.8
							v.Reflectance = 1
						end
					end
				end
			end
		}
]]
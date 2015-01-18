--[[
  Odin Encryption Module
  
  Version : 0.5
  Build__ : Boxbone
  Type___ : ModuleScript
  
  Description : 
  This is my own Key Encryption. Made by me, Thanks to 129K for the BinEncode and BinDecode functions.
]]--

local Module = {};
local _UKEY = {[1] = "_?%(%^*$@:@PGF197%";[2] = "*(*^)%$KHY(^)%%$)^";}


local function binencode(str, len)
	local function to_binary(num, len) 
		len = len or 8
		local result = {};
		repeat local x = math.fmod(num, 2); result[#result + 1] = x; num = (num - x)/2; until num < 1
		for i = 1, len - #result do
			result[#result + 1] = 0
		end
		return table.concat(result):reverse()
	end
	len = len or 8
	local result = {}
	local bytes = {str:byte(1, -1)}
	for i = 1, #bytes do
		result[i] = to_binary(bytes[i], len)
	end
	return table.concat(result)
end

local function bindecode(str) 
	local function binary_to_string(bin) 
		return string.char(tonumber(bin, 2))
	end
	return (str:gsub("(" .. ("[01]"):rep(8) .. ")", binary_to_string))
end


 function Module.Decrypt(Text,Key)
	local UKeyN = (function()
		local _END = 0
		for i,v in pairs(_UKEY) do
			for _CHAR = 1,v:len(),1 do
				local by = v:sub(_CHAR,_CHAR):byte()
				if _CHAR % 2 == 0 then
					_END = _END * tonumber(by)
				else
					_END = _END / tonumber(by)
				end
			end
		end
		return _END
	end)()
	local randkstr = #Key+math.floor(math.pow((0xFF*0xEE),2))+UKeyN
	for i = 1,Key:len(),1 do
 		randkstr=randkstr+math.pow(tonumber(Key:sub(i,i):byte()),2)*2
	end
	local ret = ""
	local newChar = ""
	Text = tostring(Text):gsub("[_?]",{["_"]="1";["?"]="0";})
	Text = bindecode(tostring(Text))
	for txt,_ in string.gmatch(Text,".-/") do
		txt=tonumber(txt:sub(1,txt:len()-1))-randkstr
		pcall(function()
			newChar = string.char(txt)
		end)
		if not newChar or newChar == "" then local chars="abcdefghijklmnoppqrstuvwxyz1234567890"; local rand=math.random(1,chars:len()) newChar=chars:sub(rand,rand) end
		ret = ret .. newChar
	end
	return (function()
		if ret ~= "" then return ret
		else return Text end
	end)()
end

local function Module.Encrypt(Text,Key)
	local UKeyN = (function()
		local _END = 0
		for i,v in pairs(_UKEY) do
			for _CHAR = 1,v:len(),1 do
				local by = v:sub(_CHAR,_CHAR):byte()
				if _CHAR % 2 == 0 then
					_END = _END * tonumber(by)
				else
					_END = _END / tonumber(by)
				end
			end
		end
		return _END
	end)()
	local randomk = #Key+math.floor(math.pow((0xFF*0xEE),2))+UKeyN
	for i = 1,Key:len(),1 do
 		randomk=randomk+math.pow(tonumber(Key:sub(i,i):byte()),2)*2
	end
    local retn = ""
    for i = 1,Text:len() do
          local byt = Text:sub(i,i):byte()
          byt = byt + randomk
          byt = tostring(byt)
          retn = retn .. byt .. "/"
    end
    retn = tostring(binencode(retn,8)):gsub("[10]",{["1"] = "_"; ["0"] = "?";})
    return retn
end

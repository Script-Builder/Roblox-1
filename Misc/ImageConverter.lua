--[[
  Roblox Image Converter
  
  Type : Script
]]--

local _ENV = getfenv(0);

Core={
  Colours = {};
  Settings = {
    BetaKey=">"
  };
  CoreFunctions = {};
  Commands = {};
};

function NewCommand(Name,Desc,Context,Calls,Func)
	Core.Commands[Name]={Name=Name,Desc=Desc,Context=Context,Calls=Calls,Function=Func}
end;

NewCommand("Generate Image","Using a link it generates an image",0,{})

function OnChatted(Msg,Player)
	if not Msg or type(Msg) ~= "string" then return end
	if not Player or type(Player) ~= "userdata" then return end
	Msg = Msg:gsub("^/e ","")
	local Check = (Msg:sub(1,1) == Core.Settings.BetaKey)
	if Check then
        Msg = Msg:sub(2)
        local MFind = Msg:find(" ")
        local substr,subaft
        pcall(function()
            substr = Msg:sub(1,MFind-1)
			subaft = Msg:sub(MFind+1)
		end)
		if not substr then
            substr = Msg
		end
        if not subaft then
            subaft = ""
        end
        for i,v in pairs(Core.Commands) do
			table.foreach(v.Calls,function(self,index)
				if substr == index and UserProfile then
						local newthread = coroutine.create(v.Function)
						local Check,Error = coroutine.resume(newthread,subaft,Player)
						if not Check then
							print("[Error] "..tostring(Error)) 
					end
				end
			end)
		end
	end
end

game.Players.PlayerAdded:connect(function(Player)--//I know it's an ugly method.
  Player.Chatted:connect(function(Msg)
    OnChatted(Msg,Player)
  end)
end)

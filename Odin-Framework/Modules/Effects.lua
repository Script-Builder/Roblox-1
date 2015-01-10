--[[
  Odin Effects Module

  Version : 0.1
  Build__ : Boxbone
  Type___ : ModuleScript

  Description :
  	Controls adding & removing different effects from players
]]--

local Effects = {}

function RecursiveFunction(start,func)
	for _,v in pairs(start:GetChildren()) do
		func(v)
		RecursiveFunction(v,func)
	end
end

function Effects:GetEffects(player,kind)
	if player.Character then
		local Objects = {}
		local Effect = {
			["Sparkle"] = false,
			["Fire"] = false,
			["Smoke"] = false,
			["ForceField"] = false,
		}
		RecursiveFunction(player.Character,function(object)
			if Effect[object.ClassName] ~= nil then
				Effect[object.ClassName] = true
			end
			if not kind or object:IsA(kind) then
				if Effect[object.ClassName] ~= nil then
					table.insert(Objects,object)
				end
			end
		end)
		return Effect,Objects
	end
	return nil
end

function Effects:AddEffect(player,effect)
	if player and player.Character then
		if player.Character:FindFirstChild("Torso") then
			if effect == "Sparkle" or effect == "Sparkles" then
				Instance.new("Sparkles",player.Character.Torso)
			elseif effect == "Fire" then
				Instance.new("Fire",player.Character.Torso)
			elseif effect == "Smoke" then
				Instance.new("Smoke",player.Character.Torso)
			end
		end
		if effect == "ForceField" or effect == "FF" then
			Instance.new("ForceField",player.Character)
		end
	end
end

function Effects:RemoveEffect(player,effect)
	local Effects,Objects = GetEffects(player,effect)
	if Objects then
		for _,v in pairs(Objects) do
			v:Destroy()
		end
	end
end

function Effects:ClearEffects(player)
	local Effects,Objects = GetEffects(player)
	if Objects then
		for _,v in pairs(Objects) do
			v:Destroy()
		end
	end
end

return Effects
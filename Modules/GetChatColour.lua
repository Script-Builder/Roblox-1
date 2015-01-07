--[[
  RBX Player Chat Colour
  
  Type : ModuleScript
]]--

local Table={};
local Colours={
      BrickColor.new("Bright red"),
			BrickColor.new("Bright blue"),
	   	BrickColor.new("Earth green"),
			BrickColor.new("Bright violet"),
		  BrickColor.new("Bright orange"),
			BrickColor.new("Bright yellow"),
			BrickColor.new("Light reddish violet"),
			BrickColor.new("Brick yellow"),
};

Table.GetColour=function(Player)
  if type(Player) ~= "string" then
    warn("Please do not set the value as a string but as userdata, e.g; game.Players.Pkamara");
  elseif type(Player) == "userdata" then
    local n=0;
    local PlayerName=Player.Name;
    for index=1,#PlayerName do
        local cValue = string.byte(string.sub(PlayerName, index, index));
        local reverseIndex = #PlayerName - index + 1;
        if #PlayerName%2 == 1 then
            reverseIndex = reverseIndex - 1;
        end
        if reverseIndex%4 >= 2 then
            cValue = -cValue;
        end
        value = value + cValue
    end
    return Colours[Colorvalue%8 + 1]
  end
end;

return Table;

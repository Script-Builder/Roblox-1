--[[
  Odin Open-Source Framework
  
  Version : 0.1
  Build__ : Blue Bird
  Type___ : Script
  
  Description :
  This is the main script that handles all instances and re-asserts scripts. Without this file the entire framework will not
  work, however if you wish to write a cleaner version or a more efficient version then please go ahead
  
  Instructions :
  Just place this file in ServerScriptService, or any other place you wish to store it.
]]--

local Odin={};
local _ENV=getfenv(0);

--//Pre-Header Settings
Odin.Settings={};
local Settings=Odin.Settings;

Settings.Debug=true;

--//Check 
local Database=Instance.new("Configuration",script);
local Clients=script.Clients;
local ClientFolder=script.ClientScripts;
local ScriptModules=script.ScriptModules
local ServerFolder=script.ServerFolder;
local Connections=script.Connections
local ClientConnection=Connections.ServerConnections;
local ServerConnection=Connections.ClientConnections;
local Buffer=script.BufferFolder;
--//Pre-Load Debug Function
function Debug(...)
  local Data={...};
  for d,t in pairs(Data) do
    return print("[Odin Framework] "..t);
  end
end;

--//Load Libraries
local Include=ScriptModules.IncludeAPI;

Debug("asd");

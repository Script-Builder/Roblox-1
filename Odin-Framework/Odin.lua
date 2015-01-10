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

local _ENV = getfenv(0); 

_ENV.print = function(str) local Data = str return print("[Odin][Output] : "..Data) end; --//This was going to be a tuple function
_ENV.error = function(str) local Data = str return error("[Odin][Output] : "..Data) end; --//Should probably change that to make sure script proccess isn't killed, maybe threads?
_ENV.warn = function(str) local Data = str return warn("[Odin][Output] : "..Data) end;

--//Checking installation

for i,v in pairs(script:GetChildren()) do



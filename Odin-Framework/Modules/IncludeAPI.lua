--[[
  Include API
  
  Version : 0.3
  Build__ : Village Jester
  Type___ : ModuleScript
  
  Description :
  This essentially works like the require function would, loading an asset in it's script context
]]--

local API={};

function API:IncludeFile(File)
  if type(File) == "string" then
    if not script.Parent:FindFirstChild(tostring(File)) then return print("[Odin Framework] "..tostring(File).." could not be loaded. Details : Was not found in ScriptModules Folder!") end;
    if script.Parent:FindFirstChild(tostring(File)) then
      return require(tostring(File))
    end
  end;
end;

return API

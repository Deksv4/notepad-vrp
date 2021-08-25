local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

local savedNotes = {}

TriggerEvent('server:LoadsNote')

vRP.defInventoryItem({"noter","Notesblok","Bruges til at skrive noter",
function(args)
    local choices = {}
    choices["> Brug"] = {function(player,choice)
        local user_id = vRP.getUserId({player})
        if user_id ~= nil then
          if vRP.hasInventoryItem({user_id, "noter", 1, false}) then
            TriggerClientEvent('lkrp_notepad:note', player)
            TriggerClientEvent('lkrp_notepad:OpenNotepadGui', player)
            TriggerEvent('server:LoadsNote')
          else
              TriggerClientEvent("pNotify:SendNotification", player,{text = "<center>Du har ikke en notesblok", type = "error", queue = "global", timeout = 4000, layout = "bottomCenter",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})        
          end
        vRP.closeMenu({player})
        end
end,"Skriv Noter!"}
return choices
end, 0.5})


RegisterNetEvent("server:LoadsNote")
AddEventHandler("server:LoadsNote", function()
   TriggerClientEvent('lkrp_notepad:updateNotes', -1, savedNotes)
end)

RegisterNetEvent("server:newNote")
AddEventHandler("server:newNote", function(text, x, y, z)
      local import = { ["text"] = ""..text.."", ["x"] = x, ["y"] = y, ["z"] = z }
      table.insert(savedNotes, import)
      TriggerEvent("server:LoadsNote")
end)

RegisterNetEvent("server:updateNote")
AddEventHandler("server:updateNote", function(noteID, text)
  savedNotes[noteID]["text"]=text
  TriggerEvent("server:LoadsNote")
end)

RegisterNetEvent("server:destroyNote")
AddEventHandler("server:destroyNote", function(noteID)
  table.remove(savedNotes, noteID)
  TriggerEvent("server:LoadsNote")
end)



RegisterServerEvent("Smadrnotesblok")
AddEventHandler("Smadrnotesblok", function()
  local source = source
  local user_id = vRP.getUserId({source})

  vRP.tryGetInventoryItem({user_id, "noter", 1, false})
end)
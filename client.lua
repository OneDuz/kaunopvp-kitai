RegisterCommand("kit1", function(src, args, raw)
    --lib.showContext("MainMenuKit")
    ExecuteCommand("giveitem me WEAPON_COMBATPISTOL")
    ExecuteCommand("giveitem me kevlar 4")
    ExecuteCommand("giveitem me ammo-9 300")
    ExecuteCommand("giveitem me at_suppressor_light")
    ExecuteCommand("giveitem me at_clip_extended_pistol")
end, false)

RegisterCommand("kit2", function()
  --lib.showContext("MainMenuKit")
  ExecuteCommand("giveitem me WEAPON_SPECIALCARBINE")
  ExecuteCommand("giveitem me kevlar 5")
  ExecuteCommand("giveitem me at_suppressor_heavy")
  ExecuteCommand("giveitem me at_clip_drum_rifle")
  ExecuteCommand("giveitem me at_grip")
  ExecuteCommand("giveitem me ammo-9 500")
end, false)

RegisterCommand("kit3", function(src, args, raw)

  if args[1] then
    ExecuteCommand("giveitem "..args[1].." WEAPON_COMBATPISTOL")
    ExecuteCommand("giveitem "..args[1].." kevlar 2")
    ExecuteCommand("giveitem "..args[1].." ammo-9 200")
  end
  --lib.showContext("MainMenuKit")
end, false)

RegisterCommand("kit4", function()
  --lib.showContext("MainMenuKit")
  ExecuteCommand("giveitem me kevlar 5")
  ExecuteCommand("giveitem me ammo-9 500")
  ExecuteCommand("giveitem me WEAPON_HEAVYRIFLE")
  ExecuteCommand("giveitem me WEAPON_SAWNOFFSHOTGUN")
  ExecuteCommand("giveitem me WEAPON_SAWNOFFSHOTGUN")
  ExecuteCommand("giveitem me at_grip")
  ExecuteCommand("giveitem me at_scope_medium")
  ExecuteCommand("giveitem me at_suppressor_heavy")
  ExecuteCommand("giveitem me at_suppressor_light")
  ExecuteCommand("giveitem me at_suppressor_light")
  ExecuteCommand("giveitem me at_clip_extended_rifle")
end, false)

RegisterCommand("kit5", function()
  --lib.showContext("MainMenuKit")
  ExecuteCommand("giveitem me kevlar 5")
  ExecuteCommand("giveitem me ammo-9 500")
  ExecuteCommand("giveitem me WEAPON_HEAVYRIFLE")
  ExecuteCommand("giveitem me WEAPON_PUMPSHOTGUN")
  ExecuteCommand("giveitem me WEAPON_PUMPSHOTGUN")
  ExecuteCommand("giveitem me at_grip")
  ExecuteCommand("giveitem me at_scope_medium")
  ExecuteCommand("giveitem me at_suppressor_heavy")
  ExecuteCommand("giveitem me at_suppressor_heavy")
  ExecuteCommand("giveitem me at_suppressor_heavy")
  ExecuteCommand("giveitem me at_clip_extended_rifle")
end, false)


RegisterCommand("kit6", function(src, args, raw)
  --lib.showContext("MainMenuKit")
  if args[1] then
    ExecuteCommand("giveitem "..args[1].." kevlar 5")
    ExecuteCommand("giveitem "..args[1].." ammo-9 500")
    ExecuteCommand("giveitem "..args[1].." WEAPON_TECPISTOL")
    ExecuteCommand("giveitem "..args[1].." WEAPON_GLOCK22")
    ExecuteCommand("giveitem "..args[1].." WEAPON_PRECISIONRIFLE")
    ExecuteCommand("giveitem "..args[1].." WEAPON_PUMPSHOTGUN")
    ExecuteCommand("giveitem "..args[1].." at_scope_macro")
    ExecuteCommand("giveitem "..args[1].." at_suppressor_heavy")
    ExecuteCommand("giveitem "..args[1].." at_clip_extended_pistol")
  else
    ExecuteCommand("giveitem me kevlar 5")
    ExecuteCommand("giveitem me ammo-9 500")
    ExecuteCommand("giveitem me WEAPON_TECPISTOL")
    ExecuteCommand("giveitem me WEAPON_GLOCK22")
    ExecuteCommand("giveitem me WEAPON_PRECISIONRIFLE")
    ExecuteCommand("giveitem me WEAPON_PUMPSHOTGUN")
    ExecuteCommand("giveitem me at_scope_macro")
    ExecuteCommand("giveitem me at_clip_extended_pistol")
    ExecuteCommand("giveitem me at_suppressor_heavy")
  end
end, false)


Citizen.CreateThread(function()
  while true do
      Citizen.Wait(0)

      local playerPed = GetPlayerPed(-1)
      if IsPedInAnyVehicle(playerPed, false) then
          local vehicle = GetVehiclePedIsIn(playerPed, false)
          local model = GetEntityModel(vehicle) 
          local modelName = GetDisplayNameFromVehicleModel(model) 

          --print('Player has entered a vehicle with model: ' .. modelName)
          if modelName == "urusperf23" then
            lib.callback('Checkifthecuntcandrivethis', source, function(msg, msg2)
              if not msg then
                lib.notify({
                  title = msg2,
                  description = '',
                  position = 'top',
                  style = {
                    backgroundColor = '#141517',
                    color = '#C1C2C5',
                    ['.description'] = {
                      color = '#909296'
                    }
                  },
                  icon = 'ban',
                  iconColor = '#C53030'
                })
                ClearPedTasksImmediately(playerPed)
                ExecuteCommand("DV")
              end
            end, modelName)
          end
            
          Citizen.Wait(2000) 
      end
  end
end)


local function addFullAttachmentsToGun()
  local playerPed = GetPlayerPed(-1)
  if DoesEntityExist(playerPed) and not IsEntityDead(playerPed) then
      local weaponHash = GetSelectedPedWeapon(playerPed)
      
      -- List of common attachment hashes (these are examples and might not directly apply to all weapons)
      local attachments = {
          'COMPONENT_AT_AR_FLSH', 
          'COMPONENT_AT_AR_SUPP', 
          'COMPONENT_AT_PI_FLSH', 
          'COMPONENT_AT_SCOPE_MACRO', 
          'COMPONENT_AT_SCOPE_MACRO_02', 
          'COMPONENT_AT_SCOPE_SMALL', 
          'COMPONENT_AT_SCOPE_MEDIUM', 
          'COMPONENT_AT_SCOPE_LARGE', 
          'COMPONENT_AT_SCOPE_MAX',
          'COMPONENT_AT_AR_SUPP_02', 
          'COMPONENT_AT_PI_SUPP', 
          'COMPONENT_AT_CR_BARREL_01', 
          'COMPONENT_AT_CR_BARREL_02', 
          'COMPONENT_SMG_CLIP_03',
          'COMPONENT_ASSAULTRIFLE_CLIP_03',
          'COMPONENT_CARBINERIFLE_CLIP_03',
          'COMPONENT_SPECIALCARBINE_CLIP_03',
          'COMPONENT_BULLPUPRIFLE_CLIP_02',
          'COMPONENT_COMBATMG_CLIP_02',
          'COMPONENT_AT_AR_FLSH', 
    'COMPONENT_AT_AR_SUPP', 
    'COMPONENT_AT_PI_FLSH', 
    'COMPONENT_AT_SCOPE_MACRO', 
    'COMPONENT_AT_SCOPE_MACRO_02', 
    'COMPONENT_AT_SCOPE_SMALL', 
    'COMPONENT_AT_SCOPE_MEDIUM', 
    'COMPONENT_AT_SCOPE_LARGE', 
    'COMPONENT_AT_SCOPE_MAX',
    'COMPONENT_AT_AR_SUPP_02', 
    'COMPONENT_AT_PI_SUPP', 
    'COMPONENT_AT_CR_BARREL_01', 
    'COMPONENT_AT_CR_BARREL_02', 
    'COMPONENT_SMG_CLIP_03',
    'COMPONENT_ASSAULTRIFLE_CLIP_03',
    'COMPONENT_CARBINERIFLE_CLIP_03',
    'COMPONENT_SPECIALCARBINE_CLIP_03',
    'COMPONENT_BULLPUPRIFLE_CLIP_02',
    'COMPONENT_COMBATMG_CLIP_02',
    'COMPONENT_AT_AR_AFGRIP',
    'COMPONENT_AT_PI_COMP',
    'COMPONENT_AT_SC_BARREL_01', 
    'COMPONENT_AT_SC_BARREL_02', 
    'COMPONENT_AT_BP_BARREL_01', 
    'COMPONENT_AT_BP_BARREL_02', 
    'COMPONENT_AT_MG_BARREL_01', 
    'COMPONENT_AT_MG_BARREL_02',
    'COMPONENT_AT_SR_BARREL_01', 
    'COMPONENT_AT_SR_BARREL_02',
    'COMPONENT_AT_SR_SUPP', 
    'COMPONENT_AT_SR_SUPP_03', 
    'COMPONENT_AT_RAILCOVER_01', 
    'COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM', 
    'COMPONENT_AT_SCOPE_SMALL_SMG', 
    'COMPONENT_AT_SCOPE_SMALL_02_SMG', 
    'COMPONENT_AT_SCOPE_LARGE_SMG', 
    'COMPONENT_AT_SCOPE_MEDIUM_SMG', 
    'COMPONENT_AT_MUZZLE_01', 
    'COMPONENT_AT_MUZZLE_02',
    'COMPONENT_AT_MUZZLE_03',
    'COMPONENT_AT_MUZZLE_04',
    'COMPONENT_AT_MUZZLE_05',
    'COMPONENT_AT_MUZZLE_06',
    'COMPONENT_AT_MUZZLE_07',
    'COMPONENT_AT_MUZZLE_08',
    'COMPONENT_AT_MUZZLE_09',
          -- Add more attachments as needed
      }

      for _, attachment in ipairs(attachments) do
          if HasPedGotWeaponComponent(playerPed, weaponHash, GetHashKey(attachment)) == false then
              GiveWeaponComponentToPed(playerPed, weaponHash, GetHashKey(attachment))
          end
      end
  end
end


RegisterCommand("-FULLATTACHS", function ()
    addFullAttachmentsToGun()
end)

RegisterCommand("model", function()
  local playerPed = GetPlayerPed(-1)
  if IsPedInAnyVehicle(playerPed, false) then
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    local model = GetEntityModel(vehicle)
    local modelName = GetDisplayNameFromVehicleModel(model)
    print(modelName)
  end
end)

RegisterCommand("viewstash", function(source, args, rawCommand)
  local input
  if args[1] then
      input = lib.inputDialog('View Inventory', {
          {type = 'select', label = 'Action', options = {{value = 'View', label = 'View'}, {value = 'Clear', label = 'Clear'}}, description = 'Select Action', required = true},
          {type = 'select', label = 'Inventory Type', options = {{value = 'Inv', label = 'Inventory'}, {value = 'Kuprine', label = 'Backpack'}, {value = 'Viesas Sandelis', label = 'Public Storage'}, {value = 'Custom', label = 'Custom'}}, description = 'Select Inventory Type', required = true}
      })
  else
      input = lib.inputDialog('View Inventory', {
          {type = 'select', label = 'Action', options = {{value = 'View', label = 'View'}, {value = 'Clear', label = 'Clear'}}, description = 'Select Action', required = true},
          {type = 'select', label = 'Inventory Type', options = {{value = 'Inv', label = 'Inventory'}, {value = 'Kuprine', label = 'Backpack'}, {value = 'Viesas Sandelis', label = 'Public Storage'}, {value = 'Custom', label = 'Custom'}}, description = 'Select Inventory Type', required = true},
          {type = 'input', label = 'ID', required = true}
      })
  end

  if not input or not input[1] or not input[2] then return end

  local action = input[1]
  local inv = input[2]
  local id = not args[1] and input[3] or args[1]

  if inv == "Custom" then
      local input2 = lib.inputDialog('Custom Inventory', {{type = 'input', label = 'Custom ID', required = true}})
      if not input2 or not input2[1] then return end
      inv = input2[1]
  end

  print(action)
  print(inv)
  print(id)

  if inv == "Inv" and action == "Clear" then
      lib.callback('getlicensefromtagerid3', source, function(license)
        print(license)
      end, id)
      return
  end

  if action == "View" then
      lib.callback('getlicensefromtagerid', source, function(license)
          exports.ox_inventory:openInventory('stash', {id = inv, owner = license})
      end, id)
  else -- Assuming the other action is 'Clear'
      lib.callback('getlicensefromtagerid2', source, function(license)
          if license then
              print("Clear action succeeded")
          else
              print("Clear action failed")
          end
      end, id, inv)
  end
end)


function SpawnVehicle(vehicle, plate)
	local playerPed = GetPlayerPed(-1)
	local playerCoords = GetEntityCoords(playerPed)
	local coords = GetEntityCoords(playerPed)
	ESX.Game.SpawnVehicle(vehicle.model, coords, GetEntityHeading(PlayerPedId()),
		function(callback_vehicle)
			ESX.Game.SetVehicleProperties(callback_vehicle, vehicle)
			SetVehRadioStation(callback_vehicle, "OFF")
			SetVehicleFixed(callback_vehicle)
			SetVehicleDeformationFixed(callback_vehicle)
			SetVehicleUndriveable(callback_vehicle, false)
			SetVehicleEngineOn(callback_vehicle, true, true)
			local carplate = GetVehicleNumberPlateText(callback_vehicle)
			table.insert(vehInstance, { vehicleentity = callback_vehicle, plate = carplate })
			TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
		end)

	TriggerServerEvent('esx_advancedgarage:setVehicleState', plate, false)
end

function ListOwnedCarsMenu(targetId)
  local elements = {}

  ESX.TriggerServerCallback('esx_advancedgarage:getOwnedCars2', function(ownedCars)
      if #ownedCars == 0 then
          ESX.ShowNotification("no cars")
      else
          for _, v in pairs(ownedCars) do
              local vehicleData = json.decode(v.vehicle) -- assuming vehicle information is stored as JSON
              local vehicleName = GetLabelText(GetDisplayNameFromVehicleModel(vehicleData.model))
              local plate = vehicleData.plate
              local label = ('%s - %s'):format(plate, vehicleName)
              
              table.insert(elements, {
                  label = label,
                  value = vehicleData -- store the whole vehicle data for spawning
              })
          end

          ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_owned_car', {
              title = "cars",
              align = 'top-left',
              elements = elements
          }, function(data, menu)
              if data.current.value then
                  menu.close()
                  SpawnVehicle(data.current.value, data.current.value.plate)
              end
          end, function(data, menu)
              menu.close()
          end)
      end
  end, targetId) -- Pass the target player's ID to the server callback
end



RegisterCommand('checkcars', function(source, args, rawCommand)
  local targetId = tonumber(args[1])
  if targetId then
      ListOwnedCarsMenu(targetId)
  else
      ESX.ShowNotification('Invalid player ID')
  end
end, false)


RegisterCommand('testmedkit', function(source, args, rawCommand)
  TriggerEvent("One-Codes:Medikit:Use")
end, false)

RegisterNetEvent("One-Codes:Medikit:Use")
AddEventHandler("One-Codes:Medikit:Use", function()
  lib.callback('one-codes:medkit:used', source, function(msg)
    if lib.progressCircle({
      duration = 5000,
      label = "Naudojamas medkit",
      position = 'bottom',
      useWhileDead = false,
      canCancel = true,
      disable = {
        move = false,
        car = true,
        combat = true,
        mouse = false,
        sprint = true,
      },
    }) then
      lib.callback('one-codes:medkit:used', source, function(msg)
        
      end, "complete")
      print('Do stuff when complete')
    else
      lib.callback('one-codes:medkit:used', source, function(msg)
        
      end, "cancelled")
      print('Do stuff when cancelled')
    end
  end, "started")
end)


local weatherFrozen = false
local timeFrozen = false
local timeFrozenValue
local weatherFrozenValue
local AutoLoad = false

function SetWeatherClientSide(weatherType)
  if type(weatherType) == "string" and weatherType ~= "" then
      SetOverrideWeather(weatherType)
      ClearOverrideWeather()
      ClearWeatherTypePersist()
      SetWeatherTypePersist(weatherType)
      SetWeatherTypeNow(weatherType)
      SetWeatherTypeNowPersist(weatherType)
  else
      print("Invalid weather type provided.")
  end
end

function ChangeTime(hours, minutes, seconds)
  if type(hours) == "number" and type(minutes) == "number" and type(seconds) == "number" then
      if hours >= 0 and hours <= 23 and minutes >= 0 and minutes <= 59 and seconds >= 0 and seconds <= 59 then
          NetworkOverrideClockTime(hours, minutes, seconds)
      else
          print("Invalid time provided.")
      end
  else
      print("Invalid input types provided.")
  end
end

function GetCurrentTime()
  local hours = GetClockHours()
  local minutes = GetClockMinutes()
  local seconds = GetClockSeconds()
  return string.format("%02d:%02d:%02d", hours, minutes, seconds)
end

function GetCurrentWeather()
  local weatherTypes = {
    "EXTRASUNNY", "CLEAR", "CLOUDS", "SMOG", "FOGGY", "OVERCAST",
    "RAIN", "THUNDER", "CLEARING", "NEUTRAL", "SNOW", "BLIZZARD", "SNOWLIGHT", "XMAS", "HALLOWEEN"
  }
  
  for _, weatherType in ipairs(weatherTypes) do
    if GetPrevWeatherTypeHashName() == GetHashKey(weatherType) or GetNextWeatherTypeHashName() == GetHashKey(weatherType) then
      return weatherType
    end
  end
  return "Unknown"
end

RegisterCommand("weather", function ()
  lib.registerContext({
    id = 'some_menu',
    title = 'Weather Menu',
    options = {
      {
        title = 'Current Weather and Time',
        description = 'Hover over me to see the current time and weather',
        metadata = {
          {label = 'Time', value = ''..GetCurrentTime()..''},
          {label = 'Weather', value = ''..GetCurrentWeather()..''}
        },
      },
      {
        title = 'Change weather',
        onSelect = function()
          local input = lib.inputDialog('Change Weather', {
            {type = 'select', label = 'Select weathear you want', options = {{ value = 'EXTRASUNNY', label = 'EXTRASUNNY' }, { value = 'CLEAR', label = 'CLEAR' }, { value = 'CLOUDS', label = 'CLOUDS' }, { value = 'SMOG', label = 'SMOG' }, { value = 'FOGGY', label = 'FOGGY' }, { value = 'OVERCAST', label = 'OVERCAST' }, { value = 'RAIN', label = 'RAIN' }, { value = 'THUNDER', label = 'THUNDER' }, { value = 'CLEARING', label = 'CLEARING' }, { value = 'NEUTRAL', label = 'NEUTRAL' }, { value = 'SNOW', label = 'SNOW' }, { value = 'BLIZZARD', label = 'BLIZZARD' }, { value = 'SNOWLIGHT', label = 'SNOWLIGHT' }, { value = 'XMAS', label = 'XMAS' }, { value = 'HALLOWEEN', label = 'HALLOWEEN' }}, required = true},
          })
          if not input then return end
          SetWeatherClientSide(input[1])
          weatherFrozenValue = input[1]
          lib.callback('one-codes:weather:SaveData', source, function(data)
          end, GetCurrentWeather(), GetCurrentTime(), AutoLoad, timeFrozen, weatherFrozen)
        end,
      },
      {
        title = 'Change time',
        onSelect = function()
          local input = lib.inputDialog('Change Time', {
            {type = 'number', label = 'Hours', required = true, min = 0, max = 24},
            {type = 'number', label = 'Minutes', required = true, min = 0, max = 59},
            {type = 'number', label = 'Seconds', required = false, min = 0, max = 59},
          })
          if not input then return end
          if input[1] == 0 then input[1] = 00 end
          if input[2] == 0 then input[2] = 00 end
          if not input[3] then input[3] = 0 end
          ChangeTime(input[1], input[2], input[3])
          timeFrozenValue = ""..input[1]..":"..input[2]..":"..input[3]..""
          lib.callback('one-codes:weather:SaveData', source, function(data)
          end, GetCurrentWeather(), GetCurrentTime(), AutoLoad, timeFrozen, weatherFrozen)
        end,
      },
      {
        title = 'Freeze/Unfreeze time',
        metadata = {
          {label = 'Time Frozen', value = ''..tostring(timeFrozen)..''},
        },
        onSelect = function()
          timeFrozen = not timeFrozen
          PauseClock(timeFrozen)
          PauseClockThread(timeFrozen)
          lib.callback('one-codes:weather:SaveData', source, function(data)
          end, GetCurrentWeather(), GetCurrentTime(), AutoLoad, timeFrozen, weatherFrozen)
        end,
      },
      {
        title = 'Freeze/Unfreeze weather',
        metadata = {
          {label = 'Weather Frozen', value = ''..tostring(weatherFrozen)..''},
        },
        onSelect = function()
          weatherFrozen = not weatherFrozen
          if weatherFrozen then
            local currentWeather = GetCurrentWeather()
            SetWeatherTypeNowPersist(currentWeather)
            PauseWeatherThread(weatherFrozen)
          else
            ClearWeatherTypePersist()
            PauseWeatherThread(weatherFrozen)
          end
          lib.callback('one-codes:weather:SaveData', source, function(data)
          end, GetCurrentWeather(), GetCurrentTime(), AutoLoad, timeFrozen, weatherFrozen)
        end,
      },
      {
        title = 'Auto Load',
        metadata = {
          {label = 'Auto Load', value = ''..tostring(AutoLoad)..''},
        },
        onSelect = function()
          AutoLoad = not AutoLoad
          lib.callback('one-codes:weather:SaveData', source, function(data)
          end, GetCurrentWeather(), GetCurrentTime(), AutoLoad, timeFrozen, weatherFrozen)
        end,
      },
    }
  })
  lib.showContext('some_menu')
end)

function ApplySettings(weather, time, weatherFrozenStatus, timeFrozenStatus)
  if weather ~= "Unknown" then
      SetWeatherClientSide(weather)
      weatherFrozenValue = weather
      weatherFrozen = weatherFrozenStatus
  end

  if time ~= "Unknown" then
      local h, m, s = table.unpack(split(time, ':'))
      ChangeTime(tonumber(h), tonumber(m), tonumber(s))
      timeFrozen = timeFrozenStatus
  end

  if weatherFrozen then
      SetWeatherTypeNowPersist(weather)
      PauseWeatherThread(weatherFrozen)
  end

  if timeFrozen then
      PauseClock(true)
      PauseClockThread(timeFrozen)
  end
end

PauseClockThread = function(timeFrozen)
  CreateThread(function()
      while timeFrozen do
        Wait(2000)
        local h, m, s = table.unpack(split(timeFrozenValue, ':'))
        ChangeTime(tonumber(h), tonumber(m), tonumber(s))
      end
  end)
end

PauseWeatherThread = function(weatherFrozen)
  CreateThread(function()
      while weatherFrozen do
        Wait(2000)
        SetWeatherClientSide(weatherFrozenValue)
      end
  end)
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded',function(xPlayer, isNew, skin)
  lib.callback('one-codes:weather:LoadData', true, function(data)
    if data.auto_load then
          AutoLoad = true
          timeFrozenValue = data.time
          weatherFrozen = data.weather_frozen
          timeFrozen = data.time_frozen
          ApplySettings(data.weather, data.time, data.weather_frozen, data.time_frozen)
      end
  end)
end)

AddEventHandler('onResourceStart', function(resourceName)
  if (GetCurrentResourceName() ~= resourceName) then
      return
  end

  lib.callback('one-codes:weather:LoadData', true, function(data)
    if data.auto_load then
          AutoLoad = true
          timeFrozenValue = data.time
          weatherFrozen = data.weather_frozen
          timeFrozen = data.time_frozen
          weatherFrozenValue = data.weather
          ApplySettings(data.weather, data.time, data.weather_frozen, data.time_frozen)
      end
  end)
end)

function split(str, delimiter)
  local result = {}
  local from  = 1
  local delim_from, delim_to = string.find( str, delimiter, from  )
  while delim_from do
      table.insert( result, string.sub( str, from , delim_from-1 ) )
      from  = delim_to + 1
      delim_from, delim_to = string.find( str, delimiter, from  )
  end
  table.insert( result, string.sub( str, from  ) )
  return result
end



RegisterCommand("tp", function ()
  lib.registerContext({
    id = 'tp',
    title = '/TP',
    options = {
      {
        title = 'Pistol Only Zone',
        onSelect = function()
        end,
      },
      {
        title = 'Custom Ginklu Parduotuve',
        onSelect = function()
        end,
      },
      {
        title = 'Turfas Micheal',
        onSelect = function()
        end,
      },
      {
        title = 'Turfas Davis',
        onSelect = function()
        end,
      },
      {
        title = 'Random Stambiu Redzone',
        onSelect = function()
        end,
      },
      {
        title = 'Random Pistol Redzon',
        onSelect = function()
        end,
      },
      {
        title = 'Nelegali Parduotuve',
        onSelect = function()
        end,
      },
      {
        title = 'Pinigu Plovimas',
        onSelect = function()
        end,
      },
      {
        title = '',
        onSelect = function()
        end,
      },
    }
  })
  lib.showContext('tp')
end)


RegisterNetEvent('one-codes:InvClose:LOL')
AddEventHandler('one-codes:InvClose:LOL', function()
    ExecuteCommand("+inv2")
    Wait(100)
    ClearPedTasks(GetPlayerPed(-1))
end)
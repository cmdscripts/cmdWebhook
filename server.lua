RegisterNetEvent("cmd:Webhook", function(source, args, opt, action, cmd,url)
    local name = ESX.GetPlayerFromId(source).getName()
        local embed = {
            {
                ["color"] = 1127128,
                ["title"] = "**".. action .."**",
                ["description"] = name .. "||(" ..GetPlayerName(source)..")||" ..  " hat /" .. cmd .. " ausgeführt mit den argumenten: " .. args,
                ["footer"] = {
                    ["text"] = opt,
                },
            }
        }
        PerformHttpRequest(url, function(err, text, headers) end, 'POST', json.encode({username = "Webhook", embeds = embed}), { ['Content-Type'] = 'application/json' })

        TriggerClientEvent("SaveImage", source, url)
  end)


  RegisterCommand('webhook', function(source, args, rawCommand)
    TriggerEvent("cmd:Webhook", source, table.concat(args, " "), "bliblablub", "lalalalalalalal",rawCommand,"urlhere")
  end)

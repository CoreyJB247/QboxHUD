local hunger = 100
local thirst = 100

-- Listen for hunger/thirst update events
RegisterNetEvent('hud:client:UpdateNeeds', function(newHunger, newThirst)
    hunger = math.floor(newHunger or 100)
    thirst = math.floor(newThirst or 100)

    SendNUIMessage({
        type = "updateNeeds",
        hunger = hunger,
        thirst = thirst
    })
end)

-- Also, send initial values on player load
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    -- get initial state values from LocalPlayer.state
    local initialHunger = LocalPlayer.state.hunger or 100
    local initialThirst = LocalPlayer.state.thirst or 100

    TriggerEvent('hud:client:UpdateNeeds', initialHunger, initialThirst)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500) -- wait 1000 ms (1 second)

        local hunger = LocalPlayer.state.hunger or 1000000  -- fallback to max if nil
        local thirst = LocalPlayer.state.thirst or 1000000

        TriggerEvent('hud:client:UpdateNeeds', hunger, thirst)
    end
end)

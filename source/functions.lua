CreateThread(function()
    while ESX == nil do
        ESX = exports['es_extended']:getSharedObject()
        Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
        Wait(10)
    end
    if ESX.IsPlayerLoaded() then
        ESX.PlayerData = ESX.GetPlayerData()
    end
end)

CreateThread(function()
        while true do
                local wait = 1000
                for i = 1, #Config.Shops do
                        local v = Config.Shops[i]
                        local pPos = GetEntityCoords(PlayerPedId())

                        for k in pairs(v.locations) do
                                local pos = v.locations
				local dst = Vdist(pos[k].x, pos[k].y, pos[k].z, pPos.x, pPos.y, pPos.z)

                                if dst <= v.marker.distance and v.marker.enable then
                                        wait = 0
                                        DrawMarker(v.marker.type, pos[k].x, pos[k].y, pos[k].z-0.9, 0.0, 0.0, 0.0, 0.0,0.0,0.0, v.marker.size.x, v.marker.size.y, v.marker.size.z, v.marker.color.r, v.marker.color.g, v.marker.color.b, v.marker.color.a, v.marker.bounce, true, p19, v.marker.rotate)
				end

                                if dst <= 1.0 then
                                        wait = 0
                                        ESX.ShowHelpNotification("~INPUT_CONTEXT~")
                                        if IsControlJustPressed(1, 51) then
                                                OpenMenuShopItem(v)
                                        end
                                end
                        end
                end
                Wait(wait)
        end
end)

CreateThread(function()
        for i = 1, #Config.Shops do
                local v = Config.Shops[i]
                if v.ped.enable then
                        local HashPed = GetHashKey(v.ped.model)
                        while not HasModelLoaded(HashPed) do
                        RequestModel(HashPed)
                        Wait(20)
                        end

                        Ped = CreatePed("PED_TYPE_CIVMALE", HashPed, v.ped.coords.x, v.ped.coords.y, v.ped.coords.z - 1, false, true)
                        SetBlockingOfNonTemporaryEvents(Ped, true)
                        FreezeEntityPosition(Ped, true)
                        SetEntityInvincible(Ped, true)
                        SetEntityHeading(Ped, v.ped.coords.w)

                end

                if v.blip.enable then

                        local blip = AddBlipForCoord(v.blip.coords)

                        SetBlipSprite(blip, v.blip.id)
                        SetBlipScale (blip, v.blip.scale)
                        SetBlipColour(blip, v.blip.color)
                        SetBlipAsShortRange(blip, v.blip.range)
                        BeginTextCommandSetBlipName('STRING')
                        AddTextComponentSubstringPlayerName(v.blip.name)
                        EndTextCommandSetBlipName(blip)

                end
        end
end)
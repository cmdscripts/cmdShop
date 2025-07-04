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

local open = false
local onPay = false
local Index = 1
local b2 = nil
local v2 = nil

function OpenMenuShopItem(v)

        for a,b in pairs(v.items) do
                b.donttouch = {}
                for i = 1, b.max do
                        table.insert(b.donttouch, i)
                end
        end

        local Main = RageUI.CreateMenu(v.menuTitle, v.menuDescription, nil, nil, v.directory, v.banner)

	Main.Display.Header = true
	Main.Closed = function()
		open = false
		FreezeEntityPosition(PlayerPedId(), false)
	end

    if open then 
		open = false
		RageUI.Visible(Main, false)
		return
	else
		open = true 
		RageUI.Visible(Main, true)
		FreezeEntityPosition(PlayerPedId(), true)

			CreateThread(function()
			while open do 
                        RageUI.IsVisible(Main, function()

                                for a,b in pairs(v.items) do
                                        RageUI.List(b.label..": ~"..v.color.."~"..b.price * b.index.."~s~$", b.donttouch, b.index, nil, {Preview, LeftBadge = RageUI.BadgeStyle.Star}, true, {
			
                                                onListChange = function(i, Item)
                                                        b.index = i;
						end,
			
						onSelected = function()

							ESX.TriggerServerCallback("cmd-shops:checkinv", function(result) 
								if result then
									onPay = true
									b2 = b
									v2 = v
								elseif not result then
									onPay = false
								end
							end, b)
						end, 
					})
				end

			if onPay == true then
				RageUI.Line()

                                RageUI.List("Payment method:", {"~"..v2.color.."~Cash~s~", "~"..v2.color.."~Bank~s~", "~"..v2.color.."~Black Money~s~"}, Index, nil, {Preview}, true, {
	
					onListChange = function(i, Item)
						Index = i;
					end,

					onActive = function()
                                                if Index == 1 then
                                                        if not v.payment.cash then
                                                                Index = Index + 1
                                                        end
                                                end

                                                if Index == 2 then
                                                        if not v.payment.bank then
                                                                Index = Index + 1
                                                        end
                                                end

                                                if Index == 3 then
                                                        if not v.payment.black then
                                                                Index = Index - 2
                                                        end
                                                end
					end,
		
					onSelected = function()

						if Index == 1 then
							ESX.TriggerServerCallback("cmd-shops:checkmoney_cash", function(result) 
								if result then
									onPay = false
								end
							end, b2)
						end

						if Index == 2 then
							ESX.TriggerServerCallback("cmd-shops:checkmoney_bank", function(result) 
								if result then
									onPay = false
								end
							end, b2)
						end

						if Index == 3 then
							ESX.TriggerServerCallback("cmd-shops:checkmoney_blackmoney", function(result) 
								if result then
									onPay = false
								end
							end, b2)
						end
					end, 
				})
			end
        end)
        Wait(0)
    end
    end)
    end
end


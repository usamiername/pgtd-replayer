repeat wait() until game:IsLoaded()
wait(7)
if game.ReplicatedStorage:FindFirstChild("EventMatchmakingRemotes") then
    local pgtd = {}
    pgtd.set = function(map, difficulty, modifiers)
        game.ReplicatedStorage.EventMatchmakingRemotes.createparty:FireServer(
            {
            	["Difficulty"] = difficulty,
            	["Code"] = "",
            	["Map"] = map,
            	["ModNames"] = "",
            	["Modifier1"] = (modifiers[1] and modifiers[1] or ""),
            	["Modifier2"] = (modifiers[2] and modifiers[2] or ""),
            	["Modifier3"] = (modifiers[3] and modifiers[3] or "")
            }
        )
        game.ReplicatedStorage.EventParties.DescendantAdded:Connect(function(gm)
            if gm:IsA("StringValue") then
                if gm.Value == game.Players.LocalPlayer.Name then
                    game.ReplicatedStorage.EventMatchmakingRemotes.start:FireServer(gm.Parent)
                end
            end
        end)
        wait(9e9)
    end
    return pgtd
else
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
    local backInstance = game.Players.LocalPlayer.PlayerGui.DefeatWinScreen.Back
    backInstance:GetPropertyChangedSignal("Visible"):Connect(function()
        if backInstance.Visible then
			if string.match(readfile("pgtdwebhook.txt"), "api/webhooks") then
				syn.request({
					["Url"] = readfile("pgtdwebhook.txt"),
					["Method"] = "POST",
					["Headers"] = {
						["Content-Type"] = "application/json"
					},
					["Body"] = game.HttpService:JSONEncode({
						["embeds"] = {
							{
								["title"] = "Game Log (".. os.date("%Y-%m-%d %H:%M:%S") .. ")",
								["description"] = "Game finished in ".. tostring(math.floor(time()/60)) .. ":" .. string.format("%02d", math.floor(time()%60)) .."\nMap: ".. workspace.Configuration.MapName.Value  .."\nCoins: ".. tostring(math.floor(workspace.MatchRewards.Coins.Value)) .."\nEXP: ".. tostring(math.floor(workspace.MatchRewards.Exp.Value)) ..""
							}
						}
					})
				})
			end
            game.TeleportService:Teleport(6949542776, game.Players.LocalPlayer)
        end
    end)
    local pgtd = {}
    local placeTowers = {}
    local actionTowers = {}
    local startTimer = nil
    local wave = workspace.Configuration:FindFirstChild("Wave")
    wave:GetPropertyChangedSignal("Value"):Connect(function()
        if wave.Value > 0 then
            if wave.Value == 1 then
                startTimer = workspace:GetServerTimeNow()
            end
        end
    end)
    function getCurrentTime()
        return math.floor((workspace:GetServerTimeNow()-startTimer)*100)/100 
    end
    game.RunService.Heartbeat:Connect(function()
        if wave.Value > 0 then
            for i,v in pairs(placeTowers) do
                if tonumber(v.Timer) <= tonumber(getCurrentTime()) then
                    if v.Type == "Tower" then
                        game.ReplicatedStorage.PlaceTower:FireServer(
                            v.Pos1,
                            v.Tower,
                            v.Gun,
                            nil,
                            v.Ground,
                            v.Pos2
                        )
                    elseif v.Type == "Ability" then
                        game.ReplicatedStorage.PlaceTower:FireServer(
                            v.Pos1,
                            nil,
                            nil,
                            v.Ability,
                            v.Ground,
                            v.Pos2
                        )
                    end
                    table.remove(placeTowers, i)
                end
            end
            for i,v in pairs(actionTowers) do
                if tonumber(v.Timer) <= tonumber(getCurrentTime()) then
                    if v.Type == "Upgrade" then
                        pgtd.getTrueTowers()[v.Tower].Action:FireServer(
                            "Upgrade",
                            v.Upgrade
                        )
                    elseif v.Type == "Sell" then
                        pgtd.getTrueTowers()[v.Tower].Action:FireServer(
                            "Sell"
                        )    
                    elseif v.Type == "Target" then
                        pgtd.getTrueTowers()[v.Tower].Action:FireServer(
                            "Targetting",
                            v.Target
                        )    
                    end
                    table.remove(actionTowers, i)
                end
            end
        end
    end)
    pgtd.placeTower = function(tower, gun, pos1, pos2, ground, timer)
        if timer == 0 then
            game.ReplicatedStorage.PlaceTower:FireServer(
                pos1,
                tower,
                gun,
                nil,
                ground,
                pos2
            )
            wait(0.2)
        else
            table.insert(placeTowers, {
                ["Tower"] = tower,
                ["Gun"] = gun,
                ["Pos1"] = pos1,
                ["Pos2"] = pos2,
                ["Ground"] = ground,
                ["Timer"] = timer,
                ["Type"] = "Tower"
            })
        end
    end
    pgtd.useAbility = function(ability, pos1, pos2, ground, timer)
        if timer == 0 then
            game.ReplicatedStorage.PlaceTower:FireServer(
                pos1,
                nil,
                nil,
                ability,
                ground,
                pos2
            )
            wait(0.2)
        else
            table.insert(placeTowers, {
                ["Ability"] = ability,
                ["Pos1"] = pos1,
                ["Pos2"] = pos2,
                ["Ground"] = ground,
                ["Timer"] = timer,
                ["Type"] = "Ability"
            })
        end
    end
    pgtd.upgradeTower = function(tower, upgradetype, timer)
        if timer == 0 then
            pgtd.getTrueTowers()[tower].Action:FireServer(
                "Upgrade",
                upgradetype
            )
            wait(0.2)
        else
            table.insert(actionTowers, {
                ["Tower"] = tower,
                ["Upgrade"] = upgradetype,
                ["Timer"] = timer,
                ["Type"] = "Upgrade"
            })
        end
    end
    pgtd.sellTower = function(tower, timer)
        if timer == 0 then
            pgtd.getTrueTowers()[tower].Action:FireServer(
                "Sell"
            )
            wait(0.2)
        else
            table.insert(actionTowers, {
                ["Tower"] = tower,
                ["Timer"] = timer,
                ["Type"] = "Sell"
            })
        end
    end
    pgtd.changeTarget = function(tower, target, timer)
        if timer == 0 then
            pgtd.getTrueTowers()[tower].Action:FireServer(
                "Targetting",
                target
            )
            wait(0.2)
        else
            table.insert(actionTowers, {
                ["Tower"] = tower,
                ["Target"] = target,
                ["Timer"] = timer,
                ["Type"] = "Target"
            })
        end
    end
    pgtd.getTrueTowers = function()
        local new = {}
        for i,v in pairs(workspace.Map.Towers:GetChildren()) do 
            if v.Name ~= "Mine" then 
                table.insert(new, v) end 
        end return new
    end
    pgtd.set = function(a, b, c) end
    return pgtd
end

local startTimer = nil
local wave = workspace.Configuration.Wave
wave:GetPropertyChangedSignal("Value"):Connect(function()
    if wave.Value > 0 then
        if wave.Value == 1 then
            startTimer = workspace:GetServerTimeNow()
        end
    end
end)

local function e(f,g)if f and f.Parent then table.insert(g,f.Parent==game and"game"or f.Parent.Name)e(f.Parent,g)end end;local function h(f,i)local g={f.Name}e(f,g)local j=g[#g]if i then for d=#g-1,1,-1 do j=j..":WaitForChild(\""..g[d].."\")"end else for d=#g-1,1,-1 do local k=g[d]if k:match("[^%w_]+")or k:sub(1,1):match("%d")then j=j.."[\""..k.."\"]"else j=j.."."..k end end end;return j end

function getPriceofCombo(character, gun)
    if not gun then return (game.ReplicatedStorage.Characters[character].Stats.UsageCost.Value) end
    return (game.ReplicatedStorage.Guns[gun].Stats.UsageCost.Value)+(game.ReplicatedStorage.Characters[character].Stats.UsageCost.Value)
end

function getPriceOfUpgrade(character, upgrade)
    return character.Upgrades[upgrade][character.UpgradeLevels[upgrade].Value+1]:GetChildren()[1].UsageCost.Value
end

function getCurrentTime()
    return math.floor((workspace:GetServerTimeNow()-startTimer)*100)/100 
end

local modCors = {
    ["Stronger Enemies"] = "EnemyHealth",
    ["Panic Mode"] = "OneHealth",
    ["Hyperinflation"] = "TowerCost",
    ["Social Distancing"] = "Distancing",
    ["Ghostified Enemies"] = "Camouflage",
    ["Stun Madness"] = "TrueStunMadness",
    ["Regeneration"] = "Regeneration",
    ["Low Supply"] = "LowTowerLimit",
    ["Impossible"] = "Impossible",
    ["Speedrun"] = "Speedrun",
    ["Less Gadgets"] = "LessGadgets",
    ["No Refund"] = "NoRefund",
    ["Bad Connection"] = "BadConnection",
    ["More Firepower, More Gain"] = "NoTowerSpam",
    ["Halved Budget"] = "HalvedCash",
    ["Gun Shortage"] = "GunLimit",
    ["Sandbox"] = "Sandbox",
    ["Hellspeed"] = "Hellspeed",
    ["Mega Stuns"] = "MegaStuns",
    ["Sabotaged Gadgets"] = "SabotagedGadgets"
}
writefile("recorded_pgtd.lua", "local pgtd = loadstring(game:HttpGet(\"https://raw.githubusercontent.com/usamiername/pgtd-replayer/main/minified.lua\"))()\npgtd.set(\"".. workspace.Configuration.MapName.Value .. "\", " .. tostring(workspace.Difficulty.Value) .. ", {")
for v in string.gmatch(workspace.Configuration.ModifierNames.Value, "[^/]+") do
    appendfile("recorded_pgtd.lua", "\"" .. modCors[v] .. "\",")
end
appendfile("recorded_pgtd.lua", "})\n")


local mt = getrawmetatable(game)
local old = mt.__namecall

setreadonly(mt,false)

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    method = tostring(method)
    if method == "FireServer" and tostring(self) == "PlaceTower" then
        spawn(function()
            for i,v in pairs(workspace.Map:GetDescendants()) do
                if v == args[5] then
                    if args[2] then
                        if game.Players.LocalPlayer.Cash.Value >= getPriceofCombo(args[2], args[3]) then
                            if workspace.Configuration.Wave.Value == 0 then
                                for a,b in pairs(v.Parent:GetChildren()) do
                                    if v == b then
                                        appendfile("recorded_pgtd.lua", "pgtd.placeTower(\"".. tostring(args[2]) .."\", \"".. tostring(args[3]) .."\", Vector3.new(" .. tostring(args[1]) .."), Vector3.new(".. tostring(args[6]) .."), " .. h(v.Parent, false) ..":GetChildren()[".. tostring(a) .."], 0)\n")
                                    end
                                end
                            else
                                for a,b in pairs(v.Parent:GetChildren()) do
                                    if v == b then
                                        appendfile("recorded_pgtd.lua", "pgtd.placeTower(\"".. tostring(args[2]) .."\", \"".. tostring(args[3]) .."\", Vector3.new(" .. tostring(args[1]) .."), Vector3.new(".. tostring(args[6]) .."), " .. h(v.Parent, false) ..":GetChildren()[".. tostring(a) .."], ".. getCurrentTime() ..")\n")
                                    end
                                end
                            end
                        end
                    elseif not string.match(args[5]:GetFullName(), "AutoLandmineSpot") then
                        if workspace.Configuration.Wave.Value == 0 then
                            for a,b in pairs(v.Parent:GetChildren()) do
                                if v == b then
                                    appendfile("recorded_pgtd.lua", "pgtd.useAbility(\"".. args[4] .."\", Vector3.new(" .. tostring(args[1]) .."), Vector3.new(".. tostring(args[6]) .."), " .. h(v.Parent, false) ..":GetChildren()[".. tostring(a) .."], 0)\n")
                                end
                            end
                        else
                            for a,b in pairs(v.Parent:GetChildren()) do
                                if v == b then
                                    appendfile("recorded_pgtd.lua", "pgtd.useAbility(\"".. args[4] .."\", Vector3.new(" .. tostring(args[1]) .."), Vector3.new(".. tostring(args[6]) .."), " .. h(v.Parent, false) ..":GetChildren()[".. tostring(a) .."], ".. getCurrentTime() ..")\n")
                                end
                            end
                        end
                    end
                break end
            end
        end)
    elseif method == "FireServer" and tostring(self) == "Action" then
        spawn(function()
            if args[1] == "Upgrade" then
                for i,v in pairs(workspace.Map.Towers:GetChildren()) do
                    if self.Parent == v then
                        if game.Players.LocalPlayer.Cash.Value >= getPriceOfUpgrade(self.Parent, args[2]) then
                            if workspace.Configuration.Wave.Value == 0 then
                               appendfile("recorded_pgtd.lua", "pgtd.upgradeTower(" .. tostring(i) ..", \"".. args[2] .."\",  0)\n")
                            else
                                appendfile("recorded_pgtd.lua", "pgtd.upgradeTower(" .. tostring(i) ..", \"".. args[2] .."\", ".. getCurrentTime() ..")\n")
                            end
                        end
                    end
                end
            elseif args[1] == "Sell" then
                for i,v in pairs(workspace.Map.Towers:GetChildren()) do
                    if self.Parent == v then
                        if workspace.Configuration.Wave.Value == 0 then
                           appendfile("recorded_pgtd.lua", "pgtd.sellTower(" .. tostring(i) ..",  0)\n")
                        else
                            appendfile("recorded_pgtd.lua", "pgtd.sellTower(" .. tostring(i) ..", ".. getCurrentTime() ..")\n")
                        end
                    end
                end
            elseif args[1] == "Targetting" then
                for i,v in pairs(workspace.Map.Towers:GetChildren()) do
                    if self.Parent == v then
                        if workspace.Configuration.Wave.Value == 0 then
                           appendfile("recorded_pgtd.lua", "pgtd.changeTarget(" .. tostring(i) ..", " .. args[2] ..",  0)\n")
                        else
                            appendfile("recorded_pgtd.lua", "pgtd.changeTarget(" .. tostring(i) ..", \"" .. args[2] .."\", ".. getCurrentTime() ..")\n")
                        end
                    end
                end
            end
        end)
    end
    return old(self, unpack(args))
end)

setreadonly(mt,true)

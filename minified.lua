repeat wait()until game:IsLoaded()wait(7)if game.ReplicatedStorage:FindFirstChild("EventMatchmakingRemotes")then local a={}a.set=function(b,c,d,e)game.ReplicatedStorage.EventMatchmakingRemotes.createparty:FireServer({["Difficulty"]=c,["Code"]=e and e or"",["Map"]=b,["ModNames"]="",["Modifier1"]=d[1]and d[1]or"",["Modifier2"]=d[2]and d[2]or"",["Modifier3"]=d[3]and d[3]or""})game.ReplicatedStorage.EventParties.DescendantAdded:Connect(function(f)if f:IsA("StringValue")then if f.Value==game.Players.LocalPlayer.Name then game.ReplicatedStorage.EventMatchmakingRemotes.start:FireServer(f.Parent)end end end)wait(9e9)end;return a else local g=game:GetService("VirtualUser")game:GetService("Players").LocalPlayer.Idled:connect(function()g:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)wait(1)g:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)end)local h=game.Players.LocalPlayer.PlayerGui.DefeatWinScreen.Back;h:GetPropertyChangedSignal("Visible"):Connect(function()if h.Visible then if string.match(readfile("pgtdwebhook.txt"),"api/webhooks")then syn.request({["Url"]=readfile("pgtdwebhook.txt"),["Method"]="POST",["Headers"]={["Content-Type"]="application/json"},["Body"]=game.HttpService:JSONEncode({["embeds"]={{["title"]="Game Log ("..os.date("%Y-%m-%d %H:%M:%S")..")",["description"]="Game finished in "..tostring(math.floor(time()/60))..":"..string.format("%02d",math.floor(time()%60)).."\nMap: "..workspace.Configuration.MapName.Value.."\nCoins: "..tostring(math.floor(workspace.MatchRewards.Coins.Value)).."\nEXP: "..tostring(math.floor(workspace.MatchRewards.Exp.Value))..""}}})})end;game.TeleportService:Teleport(6949542776,game.Players.LocalPlayer)end end)local a={}local i={}local j={}local k=nil;local l=workspace.Configuration:FindFirstChild("Wave")l:GetPropertyChangedSignal("Value"):Connect(function()if l.Value>0 then if l.Value==1 then k=workspace:GetServerTimeNow()end end end)function getCurrentTime()return math.floor((workspace:GetServerTimeNow()-k)*100)/100 end;game.RunService.Heartbeat:Connect(function()if l.Value>0 then for m,n in pairs(i)do if tonumber(n.Timer)<=tonumber(getCurrentTime())then if n.Type=="Tower"then game.ReplicatedStorage.PlaceTower:FireServer(n.Pos1,n.Tower,n.Gun,nil,n.Ground,n.Pos2)elseif n.Type=="Ability"then game.ReplicatedStorage.PlaceTower:FireServer(n.Pos1,nil,nil,n.Ability,n.Ground,n.Pos2)end;table.remove(i,m)end end;for m,n in pairs(j)do if tonumber(n.Timer)<=tonumber(getCurrentTime())then if n.Type=="Upgrade"then a.getTrueTowers()[n.Tower].Action:FireServer("Upgrade",n.Upgrade)elseif n.Type=="Sell"then a.getTrueTowers()[n.Tower].Action:FireServer("Sell")elseif n.Type=="Target"then a.getTrueTowers()[n.Tower].Action:FireServer("Targetting",n.Target)end;table.remove(j,m)end end end end)a.placeTower=function(o,p,q,r,s,t)if t==0 then game.ReplicatedStorage.PlaceTower:FireServer(q,o,p,nil,s,r)wait(0.2)else table.insert(i,{["Tower"]=o,["Gun"]=p,["Pos1"]=q,["Pos2"]=r,["Ground"]=s,["Timer"]=t,["Type"]="Tower"})end end;a.useAbility=function(u,q,r,s,t)if t==0 then game.ReplicatedStorage.PlaceTower:FireServer(q,nil,nil,u,s,r)wait(0.2)else table.insert(i,{["Ability"]=u,["Pos1"]=q,["Pos2"]=r,["Ground"]=s,["Timer"]=t,["Type"]="Ability"})end end;a.upgradeTower=function(o,v,t)if t==0 then a.getTrueTowers()[o].Action:FireServer("Upgrade",v)wait(0.2)else table.insert(j,{["Tower"]=o,["Upgrade"]=v,["Timer"]=t,["Type"]="Upgrade"})end end;a.sellTower=function(o,t)if t==0 then a.getTrueTowers()[o].Action:FireServer("Sell")wait(0.2)else table.insert(j,{["Tower"]=o,["Timer"]=t,["Type"]="Sell"})end end;a.changeTarget=function(o,w,t)if t==0 then a.getTrueTowers()[o].Action:FireServer("Targetting",w)wait(0.2)else table.insert(j,{["Tower"]=o,["Target"]=w,["Timer"]=t,["Type"]="Target"})end end;a.getTrueTowers=function()local x={}for m,n in pairs(workspace.Map.Towers:GetChildren())do if n.Name~="Mine"then table.insert(x,n)end end;return x end;a.set=function(y,z,A)end;return a end

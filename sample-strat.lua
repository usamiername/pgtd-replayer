-- Sample strategy. Has been tweaked slightly. Timings and positions were not changed.
-- Recorded version of strat found here: https://docs.google.com/document/d/11CAjui7uo15EfurOoOnxTlc4GrENaWWnYDM8PEWq2jM
-- Works as of game version v1.4.0a at roughly $55/minute in game.
-- This strat does NOT work as a triumph strat after v1.4.0b. However, for money, it is still a decent option at $2,400 per hour.
-- Requires following towers: Berserker, Kill Stealer, Exploiter, Hitman
-- Requires following weapons: Automatic Peacemaker, Golden Friend, Secret Forces Rifle, Prototype
-- Requires following abilities: Energy Shield, Firework, Jukebox, Mine
-- Total cost of above: $26,850

local pgtd = loadstring(game:HttpGet("https://raw.githubusercontent.com/usamiername/pgtd-replayer/main/minified.lua"))()
pgtd.set("Abandoned Outskirts", 2, {"Impossible", "Speedrun", "Hellspeed",})
pgtd.placeTower("Berserker", "nil", Vector3.new(-201.88265991210938, 21.599227905273438, -56.500389099121094), Vector3.new(-0.405853271484375, 1.8636322021484375, -10.385581970214844), game.Workspace.Map.Placement:GetChildren()[24], 0)
pgtd.useAbility("Jukebox", Vector3.new(-197.5226287841797, 21.599227905273438, -51.319026947021484), Vector3.new(3.9541778564453125, 1.8636322021484375, -5.204219818115234), game.Workspace.Map.Placement:GetChildren()[24], 0)
pgtd.upgradeTower(2, "Wave Cash",  0)
pgtd.useAbility("Energy Shield", Vector3.new(-248.01681518554688, 22.242040634155273, -24.606979370117188), Vector3.new(0.270416259765625, 0.3215007781982422, -12.833328247070312), game.Workspace.Map.Road:GetChildren()[6], 27.38)
pgtd.upgradeTower(2, "Wave Cash", 41.69)
pgtd.useAbility("Firework", Vector3.new(-247.4580841064453, 22.242040634155273, -31.360126495361328), Vector3.new(-0.2883148193359375, 0.3215007781982422, -6.080181121826172), game.Workspace.Map.Road:GetChildren()[6], 74.66)
pgtd.placeTower("Kill Stealer", "Automatic Peacemaker", Vector3.new(-226.69125366210938, 21.599227905273438, -56.605560302734375), Vector3.new(-25.214447021484375, 1.8636322021484375, -10.490753173828125), game.Workspace.Map.Placement:GetChildren()[24], 85.57)
pgtd.placeTower("Kill Stealer", "Automatic Peacemaker", Vector3.new(-227.083251953125, 21.599227905273438, -61.740081787109375), Vector3.new(-25.6064453125, 1.8636322021484375, -15.625274658203125), game.Workspace.Map.Placement:GetChildren()[24], 116.43)
pgtd.placeTower("Kill Stealer", "Automatic Peacemaker", Vector3.new(-226.7326202392578, 21.599227905273438, -50.72557830810547), Vector3.new(-25.255813598632812, 1.8636322021484375, -4.610771179199219), game.Workspace.Map.Placement:GetChildren()[24], 135.72)
pgtd.useAbility("Firework", Vector3.new(-184.7288055419922, 22.24202537536621, -145.37164306640625), Vector3.new(-2.6102294921875, 0.3215007781982422, -11.92108154296875), game.Workspace.Map.Road:GetChildren()[2], 188.91)
pgtd.placeTower("Exploiter", "Golden Friend", Vector3.new(-232.5120849609375, 21.599227905273438, -52.6876220703125), Vector3.new(-31.0352783203125, 1.8636322021484375, -6.57281494140625), game.Workspace.Map.Placement:GetChildren()[24], 208.81)
pgtd.upgradeTower(6, "Damage", 236.64)
pgtd.placeTower("Exploiter", "Golden Friend", Vector3.new(-237.6002960205078, 21.599227905273438, -51.23493957519531), Vector3.new(-36.12348937988281, 1.8636322021484375, -5.1201324462890625), game.Workspace.Map.Placement:GetChildren()[24], 289.13)
pgtd.upgradeTower(7, "Damage", 313.46)
pgtd.placeTower("Exploiter", "Secret Forces Rifle", Vector3.new(-227.82110595703125, 21.599227905273438, -45.44434356689453), Vector3.new(-26.34429931640625, 1.8636322021484375, 0.6704635620117188), game.Workspace.Map.Placement:GetChildren()[24], 364.25)
pgtd.upgradeTower(8, "Damage", 372.72)
pgtd.changeTarget(5, "Low HP", 407.59)
pgtd.changeTarget(3, "Low HP", 410.7)
pgtd.changeTarget(4, "Low HP", 413.33)
pgtd.placeTower("Exploiter", "Secret Forces Rifle", Vector3.new(-232.93276977539062, 21.599227905273438, -45.964637756347656), Vector3.new(-31.455963134765625, 1.8636322021484375, 0.15016937255859375), game.Workspace.Map.Placement:GetChildren()[24], 431.37)
pgtd.upgradeTower(9, "Damage", 434.14)
pgtd.placeTower("Exploiter", "Secret Forces Rifle", Vector3.new(-228.64013671875, 21.599227905273438, -40.58882141113281), Vector3.new(-27.163330078125, 1.8636322021484375, 5.5259857177734375), game.Workspace.Map.Placement:GetChildren()[24], 470.82)
pgtd.upgradeTower(10, "Damage", 485.03)
pgtd.placeTower("Exploiter", "Secret Forces Rifle", Vector3.new(-233.51702880859375, 21.599227905273438, -41.19816589355469), Vector3.new(-32.04022216796875, 1.8636322021484375, 4.9166412353515625), game.Workspace.Map.Placement:GetChildren()[24], 517.75)
pgtd.upgradeTower(11, "Damage", 519.91)
pgtd.placeTower("Hitman", "Prototype", Vector3.new(-205.38018798828125, 28.797653198242188, -93.64897918701172), Vector3.new(-3.12139892578125, 0.3213157653808594, -2.7079544067382812), game.Workspace.Map.Placement.Cliffs:GetChildren()[1], 563.75)
pgtd.upgradeTower(12, "Damage", 573.57)
pgtd.changeTarget(12, "High HP", 578.84)
pgtd.upgradeTower(12, "Damage", 599.78)
pgtd.upgradeTower(12, "Damage", 599.96)
pgtd.upgradeTower(12, "Range", 640.01)
pgtd.upgradeTower(12, "Range", 640.56)

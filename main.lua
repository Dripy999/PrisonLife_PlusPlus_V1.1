if game.PlaceId == 155615604 then

    local A_1 = "PrisonLife++ V1.1 - by not_dripynlmb, for any questions read the README.md in the github repo"
    local A_2 = "All"
    local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
    Event:FireServer(A_1, A_2)


    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("PrisonLife++ V1.1  - by not_dripynlmb", "Ocean")
    local Movement = Window:NewTab("Movement")
    local Misc = Window:NewTab("Misc")
    local Combat = Window:NewTab("Combat")
    local Section1 = Movement:NewSection("Movement")
    local Section2 = Combat:NewSection("Combat")
    local Section3 = Misc:NewSection("Misc")

    Section1:NewSlider("Speed Increase", "Increase your walk speed", 470, 16, function(v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end)
    Section1:NewSlider("Jump Increase", "Increase your Jump Power", 290, 22, function(v)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end)
    Section2:NewButton("M9", "Gun", function (v)
        local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver["M9"].ITEMPICKUP
        local Event = game:GetService("Workspace").Remote.ItemHandler
        Event:InvokeServer(A_1)
    end)
    Section2:NewButton("AK-47", "Gun", function (v)
        local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver["AK-47"].ITEMPICKUP
        local Event = game:GetService("Workspace").Remote.ItemHandler
        Event:InvokeServer(A_1)
    end)
    Section2:NewButton("Remington 870", "Gun", function (v)
        local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver["Remington 870"].ITEMPICKUP
        local Event = game:GetService("Workspace").Remote.ItemHandler
        Event:InvokeServer(A_1)
    end)

    Section2:NewDropdown("Gun Mod", "Mod your gun", {"M9","AK-47","Remington 870"}, function(v) 
        local module = nil;
        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v) then
            module = require(game:GetService("Players").LocalPlayer.Backpack[v].GunStates)
        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(v) then
            module = (game:GetService("Players").LocalPlayer.Character[v].GunStates);
        end
        if module ~= nil then
            module["MaxAmmo"] = math.huge
            module["CurrentAmmo"] = math.huge
            module["StoredAmmo"] = math.huge
            module["FireRate"] = 0.01
            module["Spread"] = 0;
            module["Range"] = math.huge
            module["Bullets"] = 4
            module["ReloadTime"] = 0.0001
            module["AutoFire"] = true;
        end
    end)
    
    Section1:NewTextBox("TP (Check desc): ","locations: Nexus, Yard, Base, Tower",function(Regions)
        if Regions == "Nexus" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(921.35553, 99.9899597, 2482.1875, 0.99952811, 3.65125032e-08, 0.0307180621, -3.55856322e-08, 1, -3.07202086e-08, -0.0307180621, 2.96125915e-08, 0.99952811)

        end
        if Regions == "Yard" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(757.734741, 98.0005493, 2506.72217, -0.454443127, -0.00948918425, -0.890725195, 0.00394635694, 0.999912024, -0.0126657961, 0.890766978, -0.00927100331, -0.4543657)
        end
        if Regions == "Base" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-950.582153, 94.1287613, 2068.34814, 0.152704895, -1.17663328e-08, -0.988271832, 1.11602134e-07, 1, 5.33846878e-09, 0.988271832, -1.11108456e-07, 0.152704895)
        end
        if Regions == "Tower" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(627.564453, 125.039917, 2587.854, 0.0131559679, -1.14642411e-08, -0.999913454, 1.06198863e-08, 1, -1.13255068e-08, 0.999913454, -1.04699698e-08, 0.0131559679)
        end

    end)
    Section3:NewToggle("NoClip", "Enable No Clip", function(enabled)

        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()

        while enabled do
            player = game.Players.LocalPlayer
            character = player.Character
                for _, v in pairs(character:GetDescendants()) do
                    pcall(function()
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                        
                    end)
                end
            end
            game:GetService("RunService").Stepped:wait()
			
    end)

    Section3:NewLabel("Teams")
    Section3:NewButton("Prisoner", "Prisoner team", function()
        local A_1 = "Bright orange"
        local Event = game:GetService("Workspace").Remote.TeamEvent
        Event:FireServer(A_1)
    end)
    Section3:NewButton("Cops",  "Cops team", function()
        local A_1 = "Bright blue"
        local Event = game:GetService("Workspace").Remote.TeamEvent
        Event:FireServer(A_1)

    end)
    Section3:NewButton("Neutral", "Neutral Team",function() 
    
    local A_1 = "Medium stone grey"
    local Event = game:GetService("Workspace").Remote.TeamEvent
    Event:FireServer(A_1)

    
    end)


    Section1:NewTextBox("(Only players) TP To: ", "Teleport to a player(full name not nickname)",function(v)
        
	    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v].Character.HumanoidRootPart.CFrame
    end)

end

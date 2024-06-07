-- Open Source A Dusty Trip By Maxwellaltaccount2 --
--// My Discord: maxwellaltaccount2

--////////////////////////////////////////////////--

if game.PlaceId == 16389395869 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

    local PhantomForcesWindow = Library:NewWindow("A Dusty Trip - Lobby")

    local KillingCheats = PhantomForcesWindow:NewSection("Main")

    local Settings = {
        Box_Color = Color3.fromRGB(255, 0, 0),
        Box_Thickness = 2,
        Team_Check = false,
        Team_Color = true,
        Autothickness = true
    }

    local Space = game:GetService("Workspace")
    local Player = game:GetService("Players").LocalPlayer
    local Camera = Space.CurrentCamera

    local Noclip = nil
    local Clip = nil

    function noclip()
        Clip = false
        local function Nocl()
            if Clip == false and game.Players.LocalPlayer.Character ~= nil then
                for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
                        v.CanCollide = false
                    end
                end
            end
            wait(0.10)
        end
        Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
    end

    function clip()
        if Noclip then Noclip:Disconnect() end
        Clip = true
    end

    noclip()

    KillingCheats:CreateToggle("Noclip", function(value)
        if value then
            noclip()
        else
            clip()
        end
    end)

    KillingCheats:CreateButton("Anti Afk", function()
        AntiAFK()
    end)

    KillingCheats:CreateButton("Infinite Yield", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end)

    KillingCheats:CreateButton("Fly Script", function()
        loadstring(game:HttpGet('https://pastebin.com/raw/YSL3xKYU'))()
    end)

    local CreditSection = PhantomForcesWindow:NewSection("Credit")

    CreditSection:CreateButton("Yt | Maxwellaltaccount2", function()
        setclipboard("https://www.youtube.com/@Maxwellaltaccount2")
    end)

    CreditSection:CreateButton("Source Script", function()
        setclipboard("https://scriptblox.com/script/a-dusty-trip-ROCKET-INF-STMIN-12835")
    end)
else
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

    local PhantomForcesWindow = Library:NewWindow("A Dusty Trip - In Game")

    local KillingCheats = PhantomForcesWindow:NewSection("Main")

    KillingCheats:CreateButton("Inf stamina", function()
        local Players = game:GetService("Players")
        local UserInputService = game:GetService("UserInputService")

        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")

        humanoid:SetAttribute("Stamina", 1)
        local normalWalkSpeed = 10
        local runningWalkSpeed = 19.2

        local function maintainFullStamina()
            while true do
                humanoid:SetAttribute("Stamina", 1)
                wait(0.1)
            end
        end

        local function toggleRun(isRunning)
            if isRunning then
                humanoid.WalkSpeed = runningWalkSpeed
            else
                humanoid.WalkSpeed = normalWalkSpeed
            end
        end

        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            if input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.ButtonL3 then
                toggleRun(true)
            end
        end)

        UserInputService.InputEnded:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            if input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.ButtonL3 then
                toggleRun(false)
            end
        end)

        task.spawn(maintainFullStamina)
    end)

    local PlayersSection = PhantomForcesWindow:NewSection("Players")

    PlayersSection:CreateTextbox("Enter Speed", function(speed)
        local success, modifiedWalkspeed = pcall(function()
            return tonumber(speed)
        end)

        if success and modifiedWalkspeed then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = modifiedWalkspeed
        end
    end)

    PlayersSection:CreateTextbox("Enter JumpPower", function(value)
        if value then
            local modifiedJumpPower = tonumber(value)
            if modifiedJumpPower then
                local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.JumpPower = modifiedJumpPower
                end
            end
        end
    end)

    PlayersSection:CreateButton("Full Bright", function()
        local Lighting = game:GetService("Lighting")
        Lighting.Brightness = 1
        Lighting.FogEnd = 999999
        Lighting.GlobalShadows = false
    end)

    PlayersSection:CreateButton("Auto Load Road", function()
        local function teleportToPart(part)
            local player = game.Players.LocalPlayer
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                player.Character.HumanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 3, 0)
            end
        end

        local roadsModel = game.Workspace.models.roads

        local function findAndTeleport()
            if roadsModel then
                local highestNumber = 0
                local targetPart = nil

                for _, part in pairs(roadsModel:GetChildren()) do
                    local partNumber = tonumber(part.Name)
                    if partNumber and part:IsA("Part") then
                        if partNumber > highestNumber then
                            highestNumber = partNumber
                            targetPart = part
                        end
                    end
                end

                if targetPart then
                    teleportToPart(targetPart)
                else
                    print("No numeric parts found in the roads model.")
                end
            else
                print("Roads model not found in Workspace.")
            end
        end

        game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
            if input.KeyCode == Enum.KeyCode.P and not gameProcessedEvent then
                findAndTeleport()
            end
        end)
    end)

    PlayersSection:CreateButton("Infinite Yield", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end)

    local CreditSection = PhantomForcesWindow:NewSection("Credit")

    CreditSection:CreateButton("Yt | Maxwellaltaccount2", function()
        setclipboard("https://www.youtube.com/@Maxwellaltaccount2")
    end)

    CreditSection:CreateButton("Source Script", function()
        setclipboard("https://scriptblox.com/script/a-dusty-trip-ROCKET-INF-STMIN-12835")
    end)
end

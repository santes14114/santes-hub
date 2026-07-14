--[[
    SANTES HUB v3.2 - Premium Edition (EQR Hub Modülleri Entegreli)
    Geliştirici: Roblox Lua Uzmanı
    Versiyon: 3.2.6
    Tarih: 2026
    
    Modüller: Fly, Noclip, FullBright, FOV, No Fail Lockpick, 
    Safe/Register ESP, Open/Unlock Doors, Auto Pickup Money,
    Melee Aura, Ragebot, Aimbot, Infinite Stamina, No Recoil,
    Invisibility (Shadow Mode), Staff Detector, Autofarm
]]

-- ==================== LOADER ====================
local function ShowLoader()
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    
    local LocalPlayer = Players.LocalPlayer
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    
    local old = PlayerGui:FindFirstChild("SantesHub_Loader")
    if old then old:Destroy() end
    
    local loaderGui = Instance.new("ScreenGui")
    loaderGui.Name = "SantesHub_Loader"
    loaderGui.ResetOnSpawn = false
    loaderGui.IgnoreGuiInset = true
    loaderGui.DisplayOrder = 999
    loaderGui.Parent = PlayerGui
    
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(6, 6, 6)
    bg.BorderSizePixel = 0
    bg.Parent = loaderGui
    
    local container = Instance.new("Frame")
    container.Size = UDim2.new(1, 0, 0, 140)
    container.Position = UDim2.new(0.5, 0, 0.5, 0)
    container.AnchorPoint = Vector2.new(0.5, 0.5)
    container.BackgroundTransparency = 1
    container.Parent = bg
    
    local layout = Instance.new("UIListLayout")
    layout.FillDirection = Enum.FillDirection.Vertical
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.VerticalAlignment = Enum.VerticalAlignment.Center
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 4)
    layout.Parent = container
    
    local lineTop = Instance.new("TextLabel")
    lineTop.Name = "LineTop"
    lineTop.Size = UDim2.new(1, 0, 0, 60)
    lineTop.BackgroundTransparency = 1
    lineTop.Text = ""
    lineTop.Font = Enum.Font.GothamBold
    lineTop.TextSize = 46
    lineTop.TextColor3 = Color3.fromRGB(242, 242, 242)
    lineTop.TextTransparency = 1
    lineTop.LayoutOrder = 1
    lineTop.Parent = container
    
    local lineBottom = Instance.new("TextLabel")
    lineBottom.Name = "LineBottom"
    lineBottom.Size = UDim2.new(1, 0, 0, 60)
    lineBottom.BackgroundTransparency = 1
    lineBottom.Text = ""
    lineBottom.Font = Enum.Font.GothamBold
    lineBottom.TextSize = 46
    lineBottom.TextColor3 = Color3.fromRGB(247, 247, 247)
    lineBottom.TextTransparency = 1
    lineBottom.LayoutOrder = 2
    lineBottom.Parent = container
    
    local function fadeIn(label, text, color, duration)
        duration = duration or 0.35
        label.Text = text
        label.TextColor3 = color
        label.TextTransparency = 1
        label.TextSize = 40
        local tween = TweenService:Create(label, TweenInfo.new(duration, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            TextTransparency = 0,
            TextSize = 46,
        })
        tween:Play()
        return tween
    end
    
    local function fadeOut(label, duration)
        duration = duration or 0.3
        local tween = TweenService:Create(label, TweenInfo.new(duration, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
            TextTransparency = 1,
            TextSize = 40,
        })
        tween:Play()
        return tween
    end
    
    local function dimColor(label, color, duration)
        duration = duration or 0.3
        local tween = TweenService:Create(label, TweenInfo.new(duration, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
            TextColor3 = color,
        })
        tween:Play()
        return tween
    end
    
    task.spawn(function()
        fadeIn(lineTop, "WELCOME", Color3.fromRGB(242, 242, 242))
        task.wait(1)
        dimColor(lineTop, Color3.fromRGB(90, 90, 90), 0.4)
        fadeIn(lineBottom, "TO", Color3.fromRGB(242, 242, 242))
        task.wait(1)
        fadeOut(lineTop, 0.3)
        fadeOut(lineBottom, 0.3)
        task.wait(0.35)
        fadeIn(lineTop, "SANTES", Color3.fromRGB(229, 57, 53))
        fadeIn(lineBottom, "HUB", Color3.fromRGB(247, 247, 247))
        task.wait(1)
        local bgFade = TweenService:Create(bg, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {BackgroundTransparency = 1})
        local topFade = TweenService:Create(lineTop, TweenInfo.new(0.4), {TextTransparency = 1})
        local bottomFade = TweenService:Create(lineBottom, TweenInfo.new(0.4), {TextTransparency = 1})
        topFade:Play()
        bottomFade:Play()
        task.wait(0.1)
        bgFade:Play()
        bgFade.Completed:Wait()
        loaderGui:Destroy()
        CreateMainGUI()
    end)
end

-- ==================== SERVİSLER ====================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local VirtualUser = game:GetService("VirtualUser")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui", 10)

if not PlayerGui then return end

local function safeCall(func, ...)
    local success, result = pcall(func, ...)
    return success, result
end

for _, name in pairs({"SantesHubScreenGui", "SantesHub_Main", "SantesHub_Loader", "SantesHub", "SantesHubGui"}) do
    safeCall(function()
        local gui = PlayerGui:FindFirstChild(name)
        if gui then gui:Destroy() end
    end)
    safeCall(function()
        local gui = CoreGui:FindFirstChild(name)
        if gui then gui:Destroy() end
    end)
end

-- ==================== TEMA RENKLERİ ====================
local C = {
    bg = Color3.fromRGB(10, 5, 5),
    panel = Color3.fromRGB(18, 4, 4),
    card = Color3.fromRGB(18, 5, 5),
    surface = Color3.fromRGB(22, 6, 6),
    surfaceUp = Color3.fromRGB(28, 8, 8),
    accent = Color3.fromRGB(200, 20, 20),
    accentDark = Color3.fromRGB(150, 15, 15),
    accentBright = Color3.fromRGB(230, 30, 30),
    accentGlow = Color3.fromRGB(255, 40, 40),
    accentDim = Color3.fromRGB(120, 15, 15),
    text = Color3.fromRGB(235, 235, 245),
    text2 = Color3.fromRGB(180, 180, 180),
    text3 = Color3.fromRGB(120, 120, 120),
    textMuted = Color3.fromRGB(80, 80, 80),
    on = Color3.fromRGB(200, 20, 20),
    off = Color3.fromRGB(45, 45, 55),
    success = Color3.fromRGB(40, 180, 80),
    warning = Color3.fromRGB(220, 180, 40),
    border = Color3.fromRGB(60, 0, 0),
    borderLight = Color3.fromRGB(80, 0, 0),
    shadow = Color3.fromRGB(0, 0, 0),
    green = Color3.fromRGB(0, 200, 80),
}

-- ==================== UTILITY ====================
local function getCharacter()
    return LocalPlayer.Character
end

local function getHumanoid()
    local char = getCharacter()
    return char and char:FindFirstChildOfClass("Humanoid")
end

local function getHumanoidRootPart()
    local char = getCharacter()
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function getRoot(char)
    if char and char:FindFirstChildOfClass("Humanoid") then
        return char:FindFirstChildOfClass("Humanoid").RootPart
    end
    return nil
end

-- ==================== ANTI-IDLE ====================
safeCall(function()
    LocalPlayer.Idled:Connect(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end)

-- ==================== TÜM MODÜLLER ====================

--======================= FLY =========================--
local Fly_Enabled = false
local Fly_Connection = nil
local Fly_Speed = 50

function Fly_Enable()
    if Fly_Enabled then return end
    Fly_Enabled = true
    Fly_Connection = RunService.RenderStepped:Connect(function(dt)
        if not Fly_Enabled then return end
        local char = getCharacter()
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if hrp then
            local cam = Workspace.CurrentCamera
            local moveDir = Vector3.new()
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then moveDir = moveDir - Vector3.new(0, 1, 0) end
            if moveDir.Magnitude > 0 then
                hrp.CFrame = hrp.CFrame + (moveDir.Unit * Fly_Speed * dt)
            end
        end
    end)
end

function Fly_Disable()
    if not Fly_Enabled then return end
    Fly_Enabled = false
    if Fly_Connection then Fly_Connection:Disconnect(); Fly_Connection = nil end
end

function Fly_Toggle()
    if Fly_Enabled then Fly_Disable() else Fly_Enable() end
    return Fly_Enabled
end

--======================= NOCLIP =========================--
local Noclip_Enabled = false
local Noclip_Connection = nil
local originalCollisions = {}

function Noclip_Enable()
    if Noclip_Enabled then return end
    Noclip_Enabled = true
    local char = getCharacter()
    if char then
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                originalCollisions[part] = true
                part.CanCollide = false
            end
        end
    end
    if not Noclip_Connection then
        Noclip_Connection = RunService.RenderStepped:Connect(function()
            if not Noclip_Enabled then return end
            local char = getCharacter()
            if char then
                for _, part in pairs(char:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    end
end

function Noclip_Disable()
    if not Noclip_Enabled then return end
    Noclip_Enabled = false
    if Noclip_Connection then Noclip_Connection:Disconnect(); Noclip_Connection = nil end
    local char = getCharacter()
    if char then
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") and originalCollisions[part] then
                part.CanCollide = true
            end
        end
    end
    originalCollisions = {}
end

function Noclip_Toggle()
    if Noclip_Enabled then Noclip_Disable() else Noclip_Enable() end
    return Noclip_Enabled
end

--======================= FULLBRIGHT =========================--
local FullBright_Enabled = false
local FullBright_Connection = nil
local OriginalLightValues = {
    ClockTime = Lighting.ClockTime,
    Brightness = Lighting.Brightness,
    Ambient = Lighting.Ambient,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    FogStart = Lighting.FogStart,
    FogEnd = Lighting.FogEnd,
}

function FullBright_Enable()
    if FullBright_Enabled then return end
    FullBright_Enabled = true
    Lighting.Brightness = 5
    Lighting.ClockTime = 14
    Lighting.Ambient = Color3.new(1, 1, 1)
    Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
    Lighting.FogStart = 100000
    Lighting.FogEnd = 100000
    FullBright_Connection = RunService.RenderStepped:Connect(function()
        if not FullBright_Enabled then FullBright_Connection:Disconnect(); return end
        if Lighting.Brightness ~= 5 then Lighting.Brightness = 5 end
        if Lighting.ClockTime ~= 14 then Lighting.ClockTime = 14 end
        if Lighting.Ambient ~= Color3.new(1, 1, 1) then Lighting.Ambient = Color3.new(1, 1, 1) end
        if Lighting.OutdoorAmbient ~= Color3.new(1, 1, 1) then Lighting.OutdoorAmbient = Color3.new(1, 1, 1) end
        if Lighting.FogStart ~= 100000 then Lighting.FogStart = 100000 end
        if Lighting.FogEnd ~= 100000 then Lighting.FogEnd = 100000 end
    end)
end

function FullBright_Disable()
    if not FullBright_Enabled then return end
    FullBright_Enabled = false
    if FullBright_Connection then FullBright_Connection:Disconnect(); FullBright_Connection = nil end
    Lighting.Brightness = OriginalLightValues.Brightness
    Lighting.ClockTime = OriginalLightValues.ClockTime
    Lighting.Ambient = OriginalLightValues.Ambient
    Lighting.OutdoorAmbient = OriginalLightValues.OutdoorAmbient
    Lighting.FogStart = OriginalLightValues.FogStart
    Lighting.FogEnd = OriginalLightValues.FogEnd
end

function FullBright_Toggle()
    if FullBright_Enabled then FullBright_Disable() else FullBright_Enable() end
    return FullBright_Enabled
end

--======================= FOV =========================--
local Fov_Enabled = false
local Fov_Value = 80
local Fov_Original = nil

function FOV_Enable()
    Fov_Enabled = true
    if not Fov_Original then Fov_Original = Workspace.CurrentCamera.FieldOfView end
end

function FOV_Disable()
    Fov_Enabled = false
    if Fov_Original then Workspace.CurrentCamera.FieldOfView = Fov_Original end
end

function FOV_Toggle()
    if Fov_Enabled then FOV_Disable() else FOV_Enable() end
    return Fov_Enabled
end

RunService.RenderStepped:Connect(function()
    if Fov_Enabled then Workspace.CurrentCamera.FieldOfView = Fov_Value end
end)

--======================= NO FAIL LOCKPICK =========================--
local NoFailLockpick_Enabled = false
local lockpickAddedConnection = nil

function NoFailLockpick_Enable()
    if NoFailLockpick_Enabled then return end
    NoFailLockpick_Enabled = true
    local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")
    if not PlayerGui then return end
    lockpickAddedConnection = PlayerGui.ChildAdded:Connect(function(Item)
        if Item.Name == "LockpickGUI" then
            task.wait(0.1)
            safeCall(function()
                local frames = Item.MF.LP_Frame.Frames
                if frames.B1 and frames.B1.Bar and frames.B1.Bar:FindFirstChild("UIScale") then frames.B1.Bar.UIScale.Scale = 10 end
                if frames.B2 and frames.B2.Bar and frames.B2.Bar:FindFirstChild("UIScale") then frames.B2.Bar.UIScale.Scale = 10 end
                if frames.B3 and frames.B3.Bar and frames.B3.Bar:FindFirstChild("UIScale") then frames.B3.Bar.UIScale.Scale = 10 end
            end)
        end
    end)
end

function NoFailLockpick_Disable()
    if not NoFailLockpick_Enabled then return end
    NoFailLockpick_Enabled = false
    if lockpickAddedConnection then lockpickAddedConnection:Disconnect(); lockpickAddedConnection = nil end
    local lockpickGui = LocalPlayer.PlayerGui:FindFirstChild("LockpickGUI")
    if lockpickGui then
        safeCall(function()
            local frames = lockpickGui.MF.LP_Frame.Frames
            if frames.B1 and frames.B1.Bar and frames.B1.Bar:FindFirstChild("UIScale") then frames.B1.Bar.UIScale.Scale = 1 end
            if frames.B2 and frames.B2.Bar and frames.B2.Bar:FindFirstChild("UIScale") then frames.B2.Bar.UIScale.Scale = 1 end
            if frames.B3 and frames.B3.Bar and frames.B3.Bar:FindFirstChild("UIScale") then frames.B3.Bar.UIScale.Scale = 1 end
        end)
    end
end

function NoFailLockpick_Toggle()
    if NoFailLockpick_Enabled then NoFailLockpick_Disable() else NoFailLockpick_Enable() end
    return NoFailLockpick_Enabled
end

--======================= SAFE/REGISTER ESP =========================--
local BredMakurz_Enabled = false
local bredMakurzConnection = nil

local function formatName(name)
    name = string.gsub(name, "([a-z])([A-Z])", "%1 %2")
    local underscoreIndex = string.find(name, "_")
    if underscoreIndex then name = string.sub(name, 1, underscoreIndex - 1) end
    return name
end

local function ApplyBredMakurzModification()
    local bredMakurzFolder = Workspace.Map:FindFirstChild("BredMakurz")
    if not bredMakurzFolder then return end
    local char = getCharacter()
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local playerPosition = char.HumanoidRootPart.Position
    for _, v in pairs(bredMakurzFolder:GetChildren()) do
        local objectPosition
        if v.PrimaryPart and v.PrimaryPart:IsA("BasePart") then objectPosition = v.PrimaryPart.Position
        else
            local part = v:FindFirstChildOfClass("BasePart")
            if part then objectPosition = part.Position else continue end
        end
        local distance = (objectPosition - playerPosition).magnitude
        local existingGui = v:FindFirstChild("Ahh")
        if distance <= 200 then
            if not existingGui then
                local x = Instance.new('BillboardGui', v)
                x.Name = "Ahh"
                x.AlwaysOnTop = true
                x.Size = UDim2.new(8, 0, 4, 0)
                x.MaxDistance = 200
                local textLabel = Instance.new('TextLabel', x)
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.BackgroundTransparency = 1
                textLabel.Font = Enum.Font.SourceSansBold
                textLabel.TextSize = 15
                textLabel.Text = formatName(v.Name)
                x.Adornee = v
                local values = v:FindFirstChild("Values")
                local brokenValue = values and values:FindFirstChild("Broken")
                if brokenValue then
                    if brokenValue.Value ~= false then textLabel.TextColor3 = Color3.new(255, 0, 0)
                    else textLabel.TextColor3 = Color3.new(0, 255, 0) end
                    brokenValue:GetPropertyChangedSignal("Value"):Connect(function()
                        if brokenValue.Value ~= false then textLabel.TextColor3 = Color3.new(255, 0, 0)
                        else textLabel.TextColor3 = Color3.new(0, 255, 0) end
                    end)
                else textLabel.TextColor3 = Color3.new(0, 255, 0) end
            end
        elseif existingGui then existingGui:Destroy() end
    end
end

function SafeESP_Enable()
    if BredMakurz_Enabled then return end
    BredMakurz_Enabled = true
    bredMakurzConnection = RunService.Heartbeat:Connect(ApplyBredMakurzModification)
end

function SafeESP_Disable()
    if not BredMakurz_Enabled then return end
    BredMakurz_Enabled = false
    if bredMakurzConnection then bredMakurzConnection:Disconnect(); bredMakurzConnection = nil end
    local bredMakurzFolder = Workspace.Map:FindFirstChild("BredMakurz")
    if bredMakurzFolder then
        for _, v in pairs(bredMakurzFolder:GetChildren()) do
            safeCall(function()
                if v:FindFirstChild("Ahh") then v.Ahh:Destroy() end
            end)
        end
    end
end

function SafeESP_Toggle()
    if BredMakurz_Enabled then SafeESP_Disable() else SafeESP_Enable() end
    return BredMakurz_Enabled
end

--======================= OPEN/UNLOCK DOORS =========================--
local OpenNearbyDoors_Enabled = false
local UnlockNearbyDoors_Enabled = false
local NearbyDoorInteraction_Coroutine = nil

local function NearbyDoorInteraction_Loop()
    while (OpenNearbyDoors_Enabled or UnlockNearbyDoors_Enabled) do
        local waitTime = 0.25
        local char = getCharacter()
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum or hum.Health <= 0 then task.wait(waitTime * 2); continue end
        local doorsFolder = Workspace.Map:FindFirstChild("Doors")
        if not doorsFolder then
            if OpenNearbyDoors_Enabled then OpenNearbyDoors_Disable() end
            if UnlockNearbyDoors_Enabled then UnlockNearbyDoors_Disable() end
            break
        end
        local playerPos = hrp.Position
        local checkRadius = 6
        for _, doorInstance in pairs(doorsFolder:GetChildren()) do
            local doorBase = doorInstance:FindFirstChild("DoorBase")
            local valuesFolder = doorInstance:FindFirstChild("Values")
            local eventsFolder = doorInstance:FindFirstChild("Events")
            if doorBase and valuesFolder and eventsFolder then
                if (playerPos - doorBase.Position).Magnitude <= checkRadius then
                    local toggleEvent = eventsFolder:FindFirstChild("Toggle")
                    if not toggleEvent then continue end
                    if UnlockNearbyDoors_Enabled then
                        local lockedValue = valuesFolder:FindFirstChild("Locked")
                        local lockArgument = doorInstance:FindFirstChild("Lock")
                        if lockedValue and lockArgument and typeof(lockedValue.Value) == "boolean" and lockedValue.Value == true then
                            safeCall(function() toggleEvent:FireServer("Unlock", lockArgument) end)
                        end
                    end
                    if OpenNearbyDoors_Enabled then
                        local openValue = valuesFolder:FindFirstChild("Open")
                        local knobArgument = doorInstance:FindFirstChild("Knob2") or doorInstance:FindFirstChild("Knob")
                        if openValue and knobArgument and typeof(openValue.Value) == "boolean" and openValue.Value == false then
                            local isLocked = valuesFolder:FindFirstChild("Locked")
                            if not isLocked or isLocked.Value == false or not UnlockNearbyDoors_Enabled then
                                safeCall(function() toggleEvent:FireServer("Open", knobArgument) end)
                            end
                        end
                    end
                end
            end
        end
        task.wait(waitTime)
    end
    NearbyDoorInteraction_Coroutine = nil
end

local function StartStopDoorInteractionLoop()
    local shouldRun = OpenNearbyDoors_Enabled or UnlockNearbyDoors_Enabled
    if shouldRun and not NearbyDoorInteraction_Coroutine then
        NearbyDoorInteraction_Coroutine = task.spawn(NearbyDoorInteraction_Loop)
    elseif not shouldRun and NearbyDoorInteraction_Coroutine then end
end

function OpenNearbyDoors_Enable()
    if OpenNearbyDoors_Enabled then return end
    OpenNearbyDoors_Enabled = true
    StartStopDoorInteractionLoop()
end

function OpenNearbyDoors_Disable()
    if not OpenNearbyDoors_Enabled then return end
    OpenNearbyDoors_Enabled = false
    StartStopDoorInteractionLoop()
end

function OpenNearbyDoors_Toggle()
    if OpenNearbyDoors_Enabled then OpenNearbyDoors_Disable() else OpenNearbyDoors_Enable() end
    return OpenNearbyDoors_Enabled
end

function UnlockNearbyDoors_Enable()
    if UnlockNearbyDoors_Enabled then return end
    UnlockNearbyDoors_Enabled = true
    StartStopDoorInteractionLoop()
end

function UnlockNearbyDoors_Disable()
    if not UnlockNearbyDoors_Enabled then return end
    UnlockNearbyDoors_Enabled = false
    StartStopDoorInteractionLoop()
end

function UnlockNearbyDoors_Toggle()
    if UnlockNearbyDoors_Enabled then UnlockNearbyDoors_Disable() else UnlockNearbyDoors_Enable() end
    return UnlockNearbyDoors_Enabled
end

--======================= AUTO PICKUP MONEY =========================--
local AutoPickupMoney_Enabled = false
local AutoPickupMoney_Connection = nil
local AutoPickupMoney_Cooldown = false

function AutoPickupMoney_Enable()
    if AutoPickupMoney_Enabled then return end
    AutoPickupMoney_Enabled = true
    AutoPickupMoney_Connection = RunService.RenderStepped:Connect(function()
        if not AutoPickupMoney_Enabled then return end
        local char = getCharacter()
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local cashFolder = Workspace.Filter:FindFirstChild("SpawnedBread")
        local remoteEvent = ReplicatedStorage.Events:FindFirstChild("CZDPZUS")
        if not cashFolder or not remoteEvent then return end
        if AutoPickupMoney_Cooldown then return end
        local rootPosition = hrp.Position
        for _, v in pairs(cashFolder:GetChildren()) do
            if (rootPosition - v.Position).Magnitude < 5 then
                if not AutoPickupMoney_Cooldown then
                    AutoPickupMoney_Cooldown = true
                    safeCall(function() remoteEvent:FireServer(v) end)
                    task.wait(1)
                    AutoPickupMoney_Cooldown = false
                    break
                end
            end
        end
    end)
end

function AutoPickupMoney_Disable()
    if not AutoPickupMoney_Enabled then return end
    AutoPickupMoney_Enabled = false
    if AutoPickupMoney_Connection then AutoPickupMoney_Connection:Disconnect(); AutoPickupMoney_Connection = nil end
    AutoPickupMoney_Cooldown = false
end

function AutoPickupMoney_Toggle()
    if AutoPickupMoney_Enabled then AutoPickupMoney_Disable() else AutoPickupMoney_Enable() end
    return AutoPickupMoney_Enabled
end

--======================= MELEE AURA =========================--
local MeleeAura_Enabled = false
local MeleeAura_Connection = nil

local function MeleeAura_Loop()
    local eventsFolder = ReplicatedStorage:FindFirstChild("Events")
    if not eventsFolder then return end
    local remote1 = eventsFolder:FindFirstChild("XMHH.2")
    local remote2 = eventsFolder:FindFirstChild("XMHH2.2")
    if not remote1 or not remote2 then return end
    local maxdist = 5
    MeleeAura_Connection = RunService.RenderStepped:Connect(function()
        if not MeleeAura_Enabled then return end
        local char = getCharacter()
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        for _, plr in pairs(Players:GetPlayers()) do
            if plr == LocalPlayer then continue end
            local c = plr.Character
            local hrp2 = c and c:FindFirstChild("HumanoidRootPart")
            local hum = c and c:FindFirstChildOfClass("Humanoid")
            if hrp2 and hum and hum.Health > 15 and not c:FindFirstChildOfClass("ForceField") then
                local dist = (hrp.Position - hrp2.Position).Magnitude
                if dist < maxdist then
                    local tool = char:FindFirstChildOfClass("Tool")
                    local target = c
                    local targetHead = target:FindFirstChild("Head")
                    if not targetHead then continue end
                    if not remote1 or not remote1:IsA("RemoteFunction") then continue end
                    if not remote2 or not remote2:IsA("RemoteEvent") then continue end
                    local success1, result = safeCall(function()
                        return remote1:InvokeServer("🍞", tick(), tool, "43TRFWX", "Normal", tick(), true)
                    end)
                    if not success1 then continue end
                    task.wait(0.1)
                    local Handle = tool and (tool:FindFirstChild("WeaponHandle") or tool:FindFirstChild("Handle")) or char:FindFirstChild("Right Arm")
                    if Handle and targetHead and hrp then
                        safeCall(function()
                            remote2:FireServer("🍞", tick(), tool, "2389ZFX34", result, false, Handle, targetHead, target, hrp.Position, targetHead.Position)
                        end)
                    end
                end
            end
        end
    end)
end

function MeleeAura_Enable()
    if MeleeAura_Enabled then return end
    MeleeAura_Enabled = true
    if MeleeAura_Connection then MeleeAura_Connection:Disconnect(); MeleeAura_Connection = nil end
    MeleeAura_Loop()
end

function MeleeAura_Disable()
    if not MeleeAura_Enabled then return end
    MeleeAura_Enabled = false
    if MeleeAura_Connection then MeleeAura_Connection:Disconnect(); MeleeAura_Connection = nil end
end

function MeleeAura_Toggle()
    if MeleeAura_Enabled then MeleeAura_Disable() else MeleeAura_Enable() end
    return MeleeAura_Enabled
end

--======================= AIMBOT =========================--
local AimBotSettings = {
    Enabled = false, TeamCheck = false, WallCheck = true, StickyAim = false,
    UseMouse = true, MouseBind = "MouseButton2", Keybind = nil,
    ShowFov = false, Fov = 100, Smoothing = 0.02, AimPart = "HumanoidRootPart",
    IsAimKeyDown = false, Target = nil, CameraTween = nil
}

local function IsAlive_aim(Player)
    return Player and Player.Character and Player.Character:FindFirstChildOfClass("Humanoid") and Player.Character.Humanoid.Health > 0
end

local function isVisible_aim(targetPosition, character)
    if not AimBotSettings.WallCheck then return true end
    local ignoreList = {Workspace.CurrentCamera}
    if LocalPlayer.Character then table.insert(ignoreList, LocalPlayer.Character) end
    if character and character:FindFirstChild("Head") and character.Head.Parent then
        table.insert(ignoreList, character.Head.Parent)
    end
    local success, obscured = safeCall(function()
        return Workspace.CurrentCamera:GetPartsObscuringTarget({targetPosition}, ignoreList)
    end)
    if not success or obscured == nil then return false end
    return #obscured == 0
end

local function CameraGetClosestToMouse_aim()
    local AimFov = AimBotSettings.Fov
    local targetPlayer = nil
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer then
            if IsAlive_aim(v) then
                local char = v.Character
                local aimPartInstance = char and char:FindFirstChild(AimBotSettings.AimPart)
                if aimPartInstance then
                    local aimPartPosition = aimPartInstance.Position
                    local successWTV, screen_pos, on_screen = safeCall(function()
                        return Workspace.CurrentCamera:WorldToViewportPoint(aimPartPosition)
                    end)
                    if successWTV and on_screen then
                        local screen_pos_2D = Vector2.new(screen_pos.X, screen_pos.Y)
                        local mousePos = UserInputService:GetMouseLocation()
                        local new_magnitude = (screen_pos_2D - mousePos).Magnitude
                        if new_magnitude < AimFov and isVisible_aim(aimPartPosition, char) then
                            AimFov = new_magnitude
                            targetPlayer = v
                        end
                    end
                end
            end
        end
    end
    return targetPlayer
end

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if not AimBotSettings or gameProcessedEvent or not AimBotSettings.Enabled then return end
    if not AimBotSettings.UseMouse and AimBotSettings.Keybind and input.KeyCode == AimBotSettings.Keybind then
        AimBotSettings.Target = CameraGetClosestToMouse_aim()
        AimBotSettings.IsAimKeyDown = true
    elseif AimBotSettings.UseMouse then
        local bind = ""
        if input.UserInputType == Enum.UserInputType.MouseButton1 then bind = "MouseButton1"
        elseif input.UserInputType == Enum.UserInputType.MouseButton2 then bind = "MouseButton2" end
        if bind == AimBotSettings.MouseBind then
            AimBotSettings.Target = CameraGetClosestToMouse_aim()
            AimBotSettings.IsAimKeyDown = true
        end
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessedEvent)
    if not AimBotSettings or gameProcessedEvent or not AimBotSettings.Enabled then return end
    if not AimBotSettings.UseMouse and AimBotSettings.Keybind and input.KeyCode == AimBotSettings.Keybind then
        AimBotSettings.IsAimKeyDown = false
        AimBotSettings.Target = nil
        if AimBotSettings.CameraTween then AimBotSettings.CameraTween:Cancel(); AimBotSettings.CameraTween = nil end
    elseif AimBotSettings.UseMouse then
        local bind = ""
        if input.UserInputType == Enum.UserInputType.MouseButton1 then bind = "MouseButton1"
        elseif input.UserInputType == Enum.UserInputType.MouseButton2 then bind = "MouseButton2" end
        if bind == AimBotSettings.MouseBind then
            AimBotSettings.IsAimKeyDown = false
            AimBotSettings.Target = nil
            if AimBotSettings.CameraTween then AimBotSettings.CameraTween:Cancel(); AimBotSettings.CameraTween = nil end
        end
    end
end)

RunService.Heartbeat:Connect(function(deltaTime)
    if AimBotSettings and AimBotSettings.Enabled and AimBotSettings.IsAimKeyDown then
        local currentTarget = AimBotSettings.Target
        if AimBotSettings.StickyAim then
            if currentTarget ~= nil and IsAlive_aim(currentTarget) then
                local targetChar = currentTarget.Character
                local aimPart = targetChar and targetChar:FindFirstChild(AimBotSettings.AimPart)
                if aimPart then
                    if AimBotSettings.CameraTween then AimBotSettings.CameraTween:Cancel(); AimBotSettings.CameraTween = nil end
                    local networkPing = safeCall(function() return LocalPlayer:GetNetworkPing() end) or 0
                    local predictionOffset = aimPart.Velocity and aimPart.Velocity * (networkPing * 0.1) or Vector3.new()
                    local targetCFrame = CFrame.new(Workspace.CurrentCamera.CFrame.Position, aimPart.Position + predictionOffset)
                    safeCall(function()
                        AimBotSettings.CameraTween = TweenService:Create(Workspace.CurrentCamera, TweenInfo.new(AimBotSettings.Smoothing, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = targetCFrame})
                        AimBotSettings.CameraTween:Play()
                    end)
                else
                    AimBotSettings.Target = nil
                    if AimBotSettings.CameraTween then AimBotSettings.CameraTween:Cancel(); AimBotSettings.CameraTween = nil end
                end
            else
                local newTarget = CameraGetClosestToMouse_aim()
                AimBotSettings.Target = newTarget
                currentTarget = newTarget
                if currentTarget and IsAlive_aim(currentTarget) then
                    local targetChar = currentTarget.Character
                    local aimPart = targetChar and targetChar:FindFirstChild(AimBotSettings.AimPart)
                    if aimPart then
                        if AimBotSettings.CameraTween then AimBotSettings.CameraTween:Cancel(); AimBotSettings.CameraTween = nil end
                        local networkPing = safeCall(function() return LocalPlayer:GetNetworkPing() end) or 0
                        local predictionOffset = aimPart.Velocity and aimPart.Velocity * (networkPing * 0.1) or Vector3.new()
                        local targetCFrame = CFrame.new(Workspace.CurrentCamera.CFrame.Position, aimPart.Position + predictionOffset)
                        safeCall(function()
                            AimBotSettings.CameraTween = TweenService:Create(Workspace.CurrentCamera, TweenInfo.new(AimBotSettings.Smoothing, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = targetCFrame})
                            AimBotSettings.CameraTween:Play()
                        end)
                    end
                elseif AimBotSettings.CameraTween then
                    AimBotSettings.CameraTween:Cancel(); AimBotSettings.CameraTween = nil
                end
            end
        else
            local target = CameraGetClosestToMouse_aim()
            if target ~= nil and IsAlive_aim(target) then
                local targetChar = target.Character
                local aimPart = targetChar and targetChar:FindFirstChild(AimBotSettings.AimPart)
                if aimPart then
                    if AimBotSettings.CameraTween then AimBotSettings.CameraTween:Cancel(); AimBotSettings.CameraTween = nil end
                    local networkPing = safeCall(function() return LocalPlayer:GetNetworkPing() end) or 0
                    local predictionOffset = aimPart.Velocity and aimPart.Velocity * (networkPing * 0.1) or Vector3.new()
                    local targetCFrame = CFrame.new(Workspace.CurrentCamera.CFrame.Position, aimPart.Position + predictionOffset)
                    safeCall(function()
                        AimBotSettings.CameraTween = TweenService:Create(Workspace.CurrentCamera, TweenInfo.new(AimBotSettings.Smoothing, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = targetCFrame})
                        AimBotSettings.CameraTween:Play()
                    end)
                else
                    if AimBotSettings.CameraTween then AimBotSettings.CameraTween:Cancel(); AimBotSettings.CameraTween = nil end
                end
            elseif AimBotSettings.CameraTween ~= nil then
                AimBotSettings.CameraTween:Cancel(); AimBotSettings.CameraTween = nil
            end
        end
    end
end)

function Aimbot_Enable()
    if AimBotSettings then AimBotSettings.Enabled = true end
end

function Aimbot_Disable()
    if AimBotSettings then
        AimBotSettings.Enabled = false
        AimBotSettings.IsAimKeyDown = false
        AimBotSettings.Target = nil
        if AimBotSettings.CameraTween then AimBotSettings.CameraTween:Cancel(); AimBotSettings.CameraTween = nil end
    end
end

function Aimbot_Toggle()
    if AimBotSettings and AimBotSettings.Enabled then Aimbot_Disable() else Aimbot_Enable() end
    return AimBotSettings and AimBotSettings.Enabled or false
end

--======================= INFINITE STAMINA =========================--
local isInfiniteStaminaEnabled = false
local oldStaminaFunction = nil
local targetFunction = nil

do
    local success_hook, result_hook = safeCall(function()
        local env = getrenv and getrenv() or getfenv and getfenv()
        if env and env._G and env._G.S_Take then
            local success_upval, upval = safeCall(getupvalue, env._G.S_Take, 2)
            if success_upval and type(upval) == 'function' then targetFunction = upval end
        end
        if targetFunction then
            local hookSuccess, hookResult = safeCall(function()
                oldStaminaFunction = hookfunction(targetFunction, function(v1, ...)
                    local args = {...}
                    if isInfiniteStaminaEnabled then
                        return oldStaminaFunction(0, unpack(args))
                    else
                        return oldStaminaFunction(v1, unpack(args))
                    end
                end)
            end)
            if not hookSuccess then oldStaminaFunction = nil end
        end
    end)
    if not success_hook then warn("Infinite Stamina hook failed") end
end

function InfiniteStamina_Enable()
    if not oldStaminaFunction then warn("Infinite Stamina: Not hooked") return end
    isInfiniteStaminaEnabled = true
end

function InfiniteStamina_Disable()
    isInfiniteStaminaEnabled = false
end

function InfiniteStamina_Toggle()
    if isInfiniteStaminaEnabled then InfiniteStamina_Disable() else InfiniteStamina_Enable() end
    return isInfiniteStaminaEnabled
end

--======================= INVISIBILITY (SHADOW MODE) =========================--
local Shadow_Active = false
local Shadow_Usable = true
local Shadow_AnimTrack = nil
local Shadow_Anim = Instance.new("Animation")
Shadow_Anim.AnimationId = "rbxassetid://215384594"

local Shadow_WarnGUI = Instance.new("ScreenGui")
Shadow_WarnGUI.Name = "ShadowWarningHUD"
Shadow_WarnGUI.Parent = CoreGui
Shadow_WarnGUI.ResetOnSpawn = false

local Shadow_WarnText = Instance.new("TextLabel", Shadow_WarnGUI)
Shadow_WarnText.Text = "⚠️ You are visible ⚠️"
Shadow_WarnText.Visible = false
Shadow_WarnText.Size = UDim2.new(0, 200, 0, 30)
Shadow_WarnText.Position = UDim2.new(0.5, -100, 0.85, 0)
Shadow_WarnText.BackgroundTransparency = 1
Shadow_WarnText.Font = Enum.Font.GothamSemibold
Shadow_WarnText.TextSize = 24
Shadow_WarnText.TextColor3 = Color3.fromRGB(255, 255, 0)
Shadow_WarnText.TextStrokeTransparency = 0.5
Shadow_WarnText.ZIndex = 10

local function UpdateShadowRefs()
    Shadow_Char = LocalPlayer.Character
    Shadow_Hum = Shadow_Char and Shadow_Char:FindFirstChildOfClass("Humanoid")
    Shadow_HRP = Shadow_Char and Shadow_Char:FindFirstChild("HumanoidRootPart")
end

local function Shadow_LoadTrack()
    if Shadow_AnimTrack then safeCall(function() Shadow_AnimTrack:Stop() end); Shadow_AnimTrack = nil end
    if Shadow_Hum then
        local s, r = safeCall(function() return Shadow_Hum:LoadAnimation(Shadow_Anim) end)
        if s then Shadow_AnimTrack = r; Shadow_AnimTrack.Priority = Enum.AnimationPriority.Action4 end
    end
end

local function Shadow_CheckGrounded()
    return Shadow_Hum and Shadow_Hum:IsDescendantOf(Workspace) and Shadow_Hum.FloorMaterial ~= Enum.Material.Air
end

local function Shadow_Deactivate()
    if not Shadow_Active then return end
    Shadow_Active = false
    if Shadow_AnimTrack then safeCall(function() Shadow_AnimTrack:Stop() end) end
    if Shadow_Hum then Workspace.CurrentCamera.CameraSubject = Shadow_Hum end
    if Shadow_Char then
        for _, v in pairs(Shadow_Char:GetDescendants()) do
            if v:IsA("BasePart") and v.Transparency == 0.5 then v.Transparency = 0 end
        end
    end
    Shadow_WarnText.Visible = false
end

local function Shadow_Activate()
    if Shadow_Active or not Shadow_Usable then return end
    UpdateShadowRefs()
    if not Shadow_Char or not Shadow_Hum or not Shadow_HRP then return end
    if not Shadow_Char:FindFirstChild("Torso") then
        safeCall(function() StarterGui:SetCore("SendNotification", {Title = "Shadow Mode FAILED", Text = "R6 Avatar required.", Duration = 5}) end)
        Shadow_Usable = false
        return
    end
    Shadow_Active = true
    Workspace.CurrentCamera.CameraSubject = Shadow_HRP
    Shadow_LoadTrack()
end

RunService.Heartbeat:Connect(function(deltaTime)
    if not Shadow_Active or not Shadow_Usable then
        if not Shadow_Active and Shadow_Char then
            for _, v in pairs(Shadow_Char:GetDescendants()) do
                if v:IsA("BasePart") and v.Transparency == 0.5 then v.Transparency = 0 end
            end
        end
        Shadow_WarnText.Visible = false
        return
    end
    if not Shadow_Char or not Shadow_Hum or not Shadow_HRP or not Shadow_Hum:IsDescendantOf(Workspace) or Shadow_Hum.Health <= 0 then
        Shadow_WarnText.Visible = false
        return
    end
    Shadow_WarnText.Visible = not Shadow_CheckGrounded()
    local walk_speed = 12
    if Shadow_Hum.MoveDirection.Magnitude > 0 then
        Shadow_HRP.CFrame = Shadow_HRP.CFrame + (Shadow_Hum.MoveDirection * walk_speed * deltaTime)
    end
    local InitialCFrame = Shadow_HRP.CFrame
    local InitialCamOffset = Shadow_Hum.CameraOffset
    local _, yaw_angle = Workspace.CurrentCamera.CFrame:ToOrientation()
    Shadow_HRP.CFrame = CFrame.new(Shadow_HRP.Position) * CFrame.fromOrientation(0, yaw_angle, 0)
    Shadow_HRP.CFrame = Shadow_HRP.CFrame * CFrame.Angles(math.rad(90), 0, 0)
    Shadow_Hum.CameraOffset = Vector3.new(0, 1.44, 0)
    if Shadow_AnimTrack then
        safeCall(function()
            if not Shadow_AnimTrack.IsPlaying then Shadow_AnimTrack:Play() end
            Shadow_AnimTrack:AdjustSpeed(0)
            Shadow_AnimTrack.TimePosition = 0.3
        end)
    elseif Shadow_Hum and Shadow_Hum.Health > 0 then Shadow_LoadTrack() end
    RunService.RenderStepped:Wait()
    if Shadow_Hum and Shadow_Hum:IsDescendantOf(Workspace) then Shadow_Hum.CameraOffset = InitialCamOffset end
    if Shadow_HRP and Shadow_HRP:IsDescendantOf(Workspace) then Shadow_HRP.CFrame = InitialCFrame end
    if Shadow_AnimTrack then safeCall(function() Shadow_AnimTrack:Stop() end) end
    if Shadow_HRP and Shadow_HRP:IsDescendantOf(Workspace) then
        local LookVec = Workspace.CurrentCamera.CFrame.LookVector
        local FlatLook = Vector3.new(LookVec.X, 0, LookVec.Z).Unit
        if FlatLook.Magnitude > 0.1 then
            Shadow_HRP.CFrame = CFrame.new(Shadow_HRP.Position, Shadow_HRP.Position + FlatLook)
        end
    end
    if Shadow_Char then
        for _, v in pairs(Shadow_Char:GetDescendants()) do
            if v:IsA("BasePart") and v.Transparency ~= 1 then v.Transparency = 0.5 end
        end
    end
end)

LocalPlayer.CharacterAdded:Connect(function(NewCharacter)
    if Shadow_Active then Shadow_Deactivate() end
    if Shadow_AnimTrack then safeCall(function() Shadow_AnimTrack:Stop() end); Shadow_AnimTrack = nil end
    task.wait()
    UpdateShadowRefs()
    if not Shadow_Hum then task.wait(0.5); UpdateShadowRefs(); if not Shadow_Hum then Shadow_Usable = false; return end end
    if Shadow_Hum.RigType ~= Enum.HumanoidRigType.R6 then
        Shadow_Usable = false
        if Shadow_Active then Shadow_Deactivate() end
        return
    else Shadow_Usable = true end
    if Shadow_Active and Shadow_Usable then Shadow_Activate() end
end)

function Invis_Enable()
    Shadow_Activate()
end

function Invis_Disable()
    Shadow_Deactivate()
end

function Invis_Toggle()
    if Shadow_Active then Shadow_Deactivate() else Shadow_Activate() end
    return Shadow_Active
end

--======================= NO RECOIL =========================--
local NoRecoil_Enabled = false
local NoRecoil_Connections = {}
local NoRecoil_GlobalOriginalValues = {}
local NoRecoil_WeaponCache = {}
local NoRecoil_Settings = {GunMods = {NoRecoil = true, Spread = true, SpreadAmount = 0}}

local function NoRecoil_CacheWeapons()
    NoRecoil_WeaponCache = {}
    for _, v in pairs(getgc(true)) do
        if type(v) == 'table' and rawget(v, 'EquipTime') then
            table.insert(NoRecoil_WeaponCache, v)
            if not NoRecoil_GlobalOriginalValues[v] then
                NoRecoil_GlobalOriginalValues[v] = {
                    Recoil = v.Recoil,
                    CameraRecoilingEnabled = v.CameraRecoilingEnabled,
                    AngleX_Min = v.AngleX_Min,
                    AngleX_Max = v.AngleX_Max,
                    AngleY_Min = v.AngleY_Min,
                    AngleY_Max = v.AngleY_Max,
                    AngleZ_Min = v.AngleZ_Min,
                    AngleZ_Max = v.AngleZ_Max,
                    Spread = v.Spread
                }
            end
        end
    end
end

local function NoRecoil_ApplyGunMods()
    for _, weapon in ipairs(NoRecoil_WeaponCache) do
        if NoRecoil_Settings.GunMods.NoRecoil then
            weapon.Recoil = 0
            weapon.CameraRecoilingEnabled = false
            weapon.AngleX_Min = 0
            weapon.AngleX_Max = 0
            weapon.AngleY_Min = 0
            weapon.AngleY_Max = 0
            weapon.AngleZ_Min = 0
            weapon.AngleZ_Max = 0
        end
        if NoRecoil_Settings.GunMods.Spread then
            weapon.Spread = NoRecoil_Settings.GunMods.SpreadAmount
        end
    end
end

local function NoRecoil_ResetGunMods()
    for weapon, values in pairs(NoRecoil_GlobalOriginalValues) do
        weapon.Recoil = values.Recoil
        weapon.CameraRecoilingEnabled = values.CameraRecoilingEnabled
        weapon.AngleX_Min = values.AngleX_Min
        weapon.AngleX_Max = values.AngleX_Max
        weapon.AngleY_Min = values.AngleY_Min
        weapon.AngleY_Max = values.AngleY_Max
        weapon.AngleZ_Min = values.AngleZ_Min
        weapon.AngleZ_Max = values.AngleZ_Max
        weapon.Spread = values.Spread
    end
end

local function NoRecoil_HandleWeapon(weapon)
    if NoRecoil_Enabled then
        task.wait(0.1)
        NoRecoil_CacheWeapons()
        NoRecoil_ApplyGunMods()
    end
end

local function NoRecoil_OnCharacterAdded(character)
    for _, child in pairs(character:GetChildren()) do
        if child:IsA("Tool") then NoRecoil_HandleWeapon(child) end
    end
    table.insert(NoRecoil_Connections, character.ChildAdded:Connect(function(child)
        if child:IsA("Tool") then NoRecoil_HandleWeapon(child) end
    end))
    local humanoid = character:WaitForChild("Humanoid", 2)
    if humanoid then
        table.insert(NoRecoil_Connections, humanoid.Died:Connect(function()
            if NoRecoil_Enabled then task.wait(1.5); NoRecoil_CacheWeapons(); NoRecoil_ApplyGunMods() end
        end))
    end
end

function NoRecoil_Enable()
    if NoRecoil_Enabled then return end
    NoRecoil_Enabled = true
    NoRecoil_CacheWeapons()
    NoRecoil_ApplyGunMods()
    table.insert(NoRecoil_Connections, LocalPlayer.CharacterAdded:Connect(NoRecoil_OnCharacterAdded))
    if LocalPlayer.Character then NoRecoil_OnCharacterAdded(LocalPlayer.Character) end
end

function NoRecoil_Disable()
    if not NoRecoil_Enabled then return end
    NoRecoil_Enabled = false
    NoRecoil_ResetGunMods()
    for _, conn in ipairs(NoRecoil_Connections) do conn:Disconnect() end
    NoRecoil_Connections = {}
end

function NoRecoil_Toggle()
    if NoRecoil_Enabled then NoRecoil_Disable() else NoRecoil_Enable() end
    return NoRecoil_Enabled
end

--======================= STAFF DETECTOR =========================--
local AdminCheck_Enabled = false
local AdminCheck_Connection = nil
local staffPlayers = {
    groups = {
        [4165692] = {["Tester"] = true, ["Contributor"] = true, ["Tester+"] = true, ["Developer"] = true,
            ["Developer+"] = true, ["Community Manager"] = true, ["Manager"] = true, ["Owner"] = true},
        [32406137] = {["Junior"] = true, ["Moderator"] = true, ["Senior"] = true, ["Administrator"] = true,
            ["Manager"] = true, ["Holder"] = true},
    },
    users = {
        3294804378, 93676120, 54087314, 81275825, 140837601, 1229486091, 46567801, 418086275,
        29706395, 3717066084, 1424338327, 5046662686, 63238912, 111250044, 63315426, 730176906,
        141193516, 194512073, 193945439, 412741116, 195538733, 102045519, 955294, 957835150,
        25689921, 366613818, 281593651, 455275714, 208929505, 96783330, 156152502, 93281166,
        959606619, 142821118, 632886139, 175931803, 122209625, 278097946, 142989311, 1517131734,
        446849296, 87189764, 67180844, 9212846, 47352513, 48058122, 155413858, 10497435,
        513615792, 55893752, 55476024, 151691292, 136584758, 16983447, 3111449, 94693025,
        271400893, 5005262660, 295331237, 64489098, 244844600, 114332275, 25048901, 69262878,
        50801509, 92504899, 42066711, 50585425, 31365111, 166406495, 2457253857, 29761878,
        21831137, 948293345, 439942262, 38578487, 1163048, 7713309208, 3659305297, 15598614,
        34616594, 626833004, 198610386, 153835477, 3923114296, 3937697838, 102146039, 119861460,
        371665775, 1206543842, 93428604, 1863173316, 90814576, 374665997, 423005063, 140172831,
        42662179, 9066859, 438805620, 14855669, 727189337, 1871290386, 608073286
    }
}

local function isStaff(player)
    if not player or not player:IsA("Player") then return false end
    if staffPlayers.groups then
        for groupID, roles in pairs(staffPlayers.groups) do
            local successRank, rank = safeCall(function() return player:GetRankInGroup(groupID) end)
            if successRank and rank and rank > 0 then
                local successRole, roleName = safeCall(function() return player:GetRoleInGroup(groupID) end)
                if successRole and roleName and roles[roleName] then return true, roleName, groupID end
            end
        end
    end
    if staffPlayers.users then
        for _, uid in pairs(staffPlayers.users) do
            if player.UserId == uid then return true, "UserID", player.UserId end
        end
    end
    return false
end

local function AdminCheck_Kick(staffInfo)
    local msg = "Staff detected!\n"
    for _, staff in pairs(staffInfo) do
        msg = msg .. "- " .. staff.Name .. " (" .. (staff.Role or "Unknown") .. ")\n"
    end
    LocalPlayer:Kick(msg)
end

local function AdminCheck_CheckCurrent()
    local staffFound = {}
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local isPlayerStaff, role = isStaff(player)
            if isPlayerStaff then
                table.insert(staffFound, {Name = player.Name, Role = role})
            end
        end
    end
    if #staffFound > 0 then AdminCheck_Kick(staffFound); return true end
    return false
end

local function AdminCheck_OnPlayerJoining(player)
    if not AdminCheck_Enabled then return end
    local isPlayerStaff, role = isStaff(player)
    if isPlayerStaff then AdminCheck_Kick({{Name = player.Name, Role = role}}) end
end

function AdminCheck_Enable()
    if AdminCheck_Enabled then return end
    AdminCheck_Enabled = true
    if AdminCheck_Connection then AdminCheck_Connection:Disconnect() end
    AdminCheck_Connection = Players.PlayerAdded:Connect(AdminCheck_OnPlayerJoining)
    task.spawn(function()
        local foundStaff = AdminCheck_CheckCurrent()
        if foundStaff then
            AdminCheck_Enabled = false
            if AdminCheck_Connection then AdminCheck_Connection:Disconnect(); AdminCheck_Connection = nil end
        end
    end)
end

function AdminCheck_Disable()
    if not AdminCheck_Enabled then return end
    AdminCheck_Enabled = false
    if AdminCheck_Connection then AdminCheck_Connection:Disconnect(); AdminCheck_Connection = nil end
end

function AdminCheck_Toggle()
    if AdminCheck_Enabled then AdminCheck_Disable() else AdminCheck_Enable() end
    return AdminCheck_Enabled
end

--======================= RAGEBOT =========================--
local Ragebot_Enabled = false
local Ragebot_Coroutine = nil

local function Ragebot_GetClosestEnemy()
    local closestEnemy = nil
    local shortestDistance = 200
    local myChar = getCharacter()
    local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local enemyChar = player.Character
            local enemyHRP = enemyChar and enemyChar:FindFirstChild("HumanoidRootPart")
            local enemyHum = enemyChar and enemyChar:FindFirstChildOfClass("Humanoid")
            if enemyHRP and enemyHum and enemyHum.Health > 15 and not enemyChar:FindFirstChildOfClass("ForceField") then
                local distance = (myHRP.Position - enemyHRP.Position).Magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    closestEnemy = player
                end
            end
        end
    end
    return closestEnemy
end

local function Ragebot_Shoot(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return end
    local targetPart = targetPlayer.Character:FindFirstChild("Head") or targetPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not targetPart then return end
    local myChar = getCharacter()
    local tool = myChar and myChar:FindFirstChildOfClass("Tool")
    if not tool then return end
    local eventsFolder = ReplicatedStorage:FindFirstChild("Events")
    if not eventsFolder then return end
    local remote1 = eventsFolder:FindFirstChild("GNX_S")
    local remote2 = eventsFolder:FindFirstChild("ZFKLF__H")
    if not remote1 or not remote2 then return end
    local currentCam = Workspace.CurrentCamera
    local hitPosition = targetPart.Position
    local hitDirection = (hitPosition - currentCam.CFrame.Position).Unit
    safeCall(function()
        remote1:FireServer(tick(), "RageKey", tool, "FDS9I83", currentCam.CFrame.Position, {hitDirection}, false)
    end)
    safeCall(function()
        remote2:FireServer("🧈", tool, "RageKey", 1, targetPart, hitPosition, hitDirection, nil, nil)
    end)
end

local function Ragebot_Loop()
    while Ragebot_Enabled do
        local target = Ragebot_GetClosestEnemy()
        if target then
            Ragebot_Shoot(target)
            task.wait(0.05)
        else
            task.wait(0.1)
        end
    end
    Ragebot_Coroutine = nil
end

function Ragebot_Enable()
    if Ragebot_Enabled then return end
    Ragebot_Enabled = true
    if not Ragebot_Coroutine then
        Ragebot_Coroutine = task.spawn(Ragebot_Loop)
    end
end

function Ragebot_Disable()
    if not Ragebot_Enabled then return end
    Ragebot_Enabled = false
end

function Ragebot_Toggle()
    if Ragebot_Enabled then Ragebot_Disable() else Ragebot_Enable() end
    return Ragebot_Enabled
end

--======================= AUTOFARM =========================--
local autofarmEnabled = false
local autofarmCooldown = false
local ignoredSafes = {}
local isPingHigh = false
local pingThreshold = 100
local Autofarm_Settings = {IsDead = false}

task.spawn(function()
    while task.wait(5) do
        local ping = safeCall(function() return LocalPlayer:GetNetworkPing() * 1000 end) or 0
        isPingHigh = ping > pingThreshold
    end
end)

local function Autofarm_HasTool(toolName)
    local backpackTool = LocalPlayer.Backpack:FindFirstChild(toolName)
    local characterTool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(toolName)
    return backpackTool or characterTool
end

local function Autofarm_FindNearestDealer()
    local shopz = Workspace.Map:FindFirstChild("Shopz")
    local char = getCharacter()
    if not shopz or not char then return nil end
    local nearestDealer = nil
    local shortestDistance = math.huge
    local playerPosition = char:FindFirstChild("HumanoidRootPart").Position
    for _, dealer in pairs(shopz:GetChildren()) do
        local crowbarStock = dealer:FindFirstChild("CurrentStocks") and dealer.CurrentStocks:FindFirstChild("Crowbar")
        if crowbarStock and crowbarStock.Value > 0 and dealer:FindFirstChild("MainPart") then
            local distance = (dealer.MainPart.Position - playerPosition).Magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                nearestDealer = dealer
            end
        end
    end
    return nearestDealer
end

local function Autofarm_FindNearestTarget(targetsToIgnore)
    local bredMakurzFolder = Workspace.Map:FindFirstChild("BredMakurz") or Workspace.Filter:FindFirstChild("BredMakurz")
    local char = getCharacter()
    if not bredMakurzFolder or not char then return nil end
    local nearestTarget = nil
    local shortestDistance = math.huge
    local playerPosition = char:FindFirstChild("HumanoidRootPart").Position
    for _, v in pairs(bredMakurzFolder:GetChildren()) do
        if (string.find(v.Name, "Safe") or string.find(v.Name, "Register")) and not table.find(targetsToIgnore, v) then
            local values = v:FindFirstChild("Values")
            if values then
                local broken = values:FindFirstChild("Broken")
                if broken and broken:IsA("BoolValue") and not broken.Value then
                    local targetPart = v.PrimaryPart or v:FindFirstChild("MainPart") or v:FindFirstChild("PosPart")
                    if targetPart then
                        local distance = (targetPart.Position - playerPosition).Magnitude
                        if distance < shortestDistance then
                            shortestDistance = distance
                            nearestTarget = v
                        end
                    end
                end
            end
        end
    end
    return nearestTarget
end

local function Autofarm_TeleportTo(targetPart)
    local char = getCharacter()
    if not char then return false end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp or not targetPart or not targetPart:IsA("BasePart") then return false end
    local success = false
    local attempts = 0
    while not success and attempts < 4 do
        local targetCframe = targetPart.CFrame
        local targetPos = (targetCframe + targetCframe.LookVector * 2).Position
        hrp.CFrame = CFrame.new(targetPos) * CFrame.Angles(0, math.pi / 2, 0)
        task.wait(0.5)
        local isStable = true
        for i = 1, 10 do
            task.wait(0.2)
            if not hrp or not hrp.Parent then isStable = false; break end
            if (hrp.Position - targetPos).Magnitude > 5 then isStable = false; break end
        end
        if isStable then success = true
        else attempts = attempts + 1; task.wait(1) end
    end
    return success
end

local function Autofarm_OpenSafe(safeModel)
    local equippedCrowbar = Autofarm_HasTool("Crowbar")
    if not equippedCrowbar then return end
    local eventsFolder = ReplicatedStorage:FindFirstChild("Events")
    if not eventsFolder then return end
    local remoteXMHH = eventsFolder:FindFirstChild("XMHH.2")
    local remoteXMHH2 = eventsFolder:FindFirstChild("XMHH2.2")
    local safeMainPart = safeModel:FindFirstChild("MainPart")
    if not remoteXMHH or not remoteXMHH2 or not safeMainPart then return end
    local startTime = tick()
    while safeModel and safeModel.Parent and safeModel.Values and safeModel.Values.Broken and not safeModel.Values.Broken.Value and (tick() - startTime < 15) do
        local char = getCharacter()
        if not char then break end
        local safeOpenValue = remoteXMHH:InvokeServer("🍞", tick(), equippedCrowbar, "DZDRRRKI", safeModel, "Register")
        if safeOpenValue == nil then task.wait(1); continue end
        remoteXMHH2:FireServer("🍞", tick(), equippedCrowbar, "2389ZFX34", safeOpenValue, false,
            char["Right Arm"], safeMainPart, safeModel, safeMainPart.Position, safeMainPart.Position)
        task.wait(0.2)
    end
    task.wait(8)
end

local function Autofarm_BuyCrowbar(dealer)
    if not dealer then return false end
    local main = dealer:FindFirstChild("MainPart")
    if not main then return false end
    if not Autofarm_TeleportTo(main) then return false end
    task.wait(1)
    local eventsFolder = ReplicatedStorage:FindFirstChild("Events")
    if not eventsFolder then return false end
    local buyEvent = eventsFolder:FindFirstChild("BYZERSPROTEC")
    local sellEvent = eventsFolder:FindFirstChild("SSHPRMTE1")
    if not buyEvent or not sellEvent then return false end
    buyEvent:FireServer(true, "shop", main, "IllegalStore")
    task.wait(1)
    sellEvent:InvokeServer("IllegalStore", "Melees", "Crowbar", main, nil, true)
    task.wait(2)
    buyEvent:FireServer(false)
    return Autofarm_HasTool("Crowbar")
end

local noTargetCounter = 0

task.spawn(function()
    while true do
        task.wait(1)
        local char = getCharacter()
        local humanoid = char and char:FindFirstChildOfClass("Humanoid")
        if humanoid then Autofarm_Settings.IsDead = humanoid.Health <= 0 end
        if not autofarmEnabled or autofarmCooldown or not char or not humanoid or humanoid.Health <= 0 or isPingHigh then
            continue
        end
        local crowbar = Autofarm_HasTool("Crowbar")
        if not crowbar then
            local dealer = Autofarm_FindNearestDealer()
            if dealer then
                if Autofarm_TeleportTo(dealer:FindFirstChild("MainPart")) then
                    task.wait(1)
                    Autofarm_BuyCrowbar(dealer)
                else task.wait(5) end
            else task.wait(10) end
        else
            local target = Autofarm_FindNearestTarget(ignoredSafes)
            if target then
                noTargetCounter = 0
                if Autofarm_TeleportTo(target:FindFirstChild("MainPart")) then
                    if LocalPlayer.Character:FindFirstChild("Crowbar") == nil then
                        safeCall(function() LocalPlayer.Character.Humanoid:EquipTool(crowbar) end)
                    end
                    task.wait(1)
                    Autofarm_OpenSafe(target)
                else
                    table.insert(ignoredSafes, target)
                    task.wait(0.5)
                end
            else
                noTargetCounter = noTargetCounter + 1
                if noTargetCounter >= 4 then
                    ignoredSafes = {}
                    noTargetCounter = 0
                    task.wait(15)
                else task.wait(5) end
            end
        end
    end
end)

local function Autofarm_Enable()
    if autofarmEnabled then return end
    autofarmEnabled = true
    if not Shadow_Active and Shadow_Usable then Shadow_Activate() end
    if not AutoPickupMoney_Enabled then AutoPickupMoney_Enable() end
end

local function Autofarm_Disable()
    if not autofarmEnabled then return end
    autofarmEnabled = false
    if Shadow_Active then Shadow_Deactivate() end
    AutoPickupMoney_Disable()
end

function Autofarm_Toggle()
    if autofarmEnabled then Autofarm_Disable() else Autofarm_Enable() end
    return autofarmEnabled
end

-- ==================== ANA GUI (SantesHub Premium) ====================

function CreateMainGUI()
    -- GUI oluşturma kodu burada devam ediyor...
    -- (Önceki mesajdaki GUI kodu buraya gelecek)
end

ShowLoader()

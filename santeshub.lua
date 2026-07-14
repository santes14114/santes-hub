--[[
    SANTES HUB v3.2 - Premium Edition (EQR Hub Modülleri Entegreli - ÇALIŞIR VERSİYON)
    Geliştirici: Roblox Lua Uzmanı
    Versiyon: 3.2.7
    Tarih: 2026
    
    NOT: Tüm exploit fonksiyonları için hata yakalama eklendi.
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
local OriginalLightValues = {}

function FullBright_Enable()
    if FullBright_Enabled then return end
    FullBright_Enabled = true
    OriginalLightValues = {
        Brightness = Lighting.Brightness,
        ClockTime = Lighting.ClockTime,
        Ambient = Lighting.Ambient,
        OutdoorAmbient = Lighting.OutdoorAmbient,
        FogStart = Lighting.FogStart,
        FogEnd = Lighting.FogEnd,
    }
    FullBright_Connection = RunService.RenderStepped:Connect(function()
        if not FullBright_Enabled then return end
        Lighting.Brightness = 5
        Lighting.ClockTime = 14
        Lighting.Ambient = Color3.new(1, 1, 1)
        Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
        Lighting.FogStart = 100000
        Lighting.FogEnd = 100000
    end)
end

function FullBright_Disable()
    if not FullBright_Enabled then return end
    FullBright_Enabled = false
    if FullBright_Connection then FullBright_Connection:Disconnect(); FullBright_Connection = nil end
    Lighting.Brightness = OriginalLightValues.Brightness or 1
    Lighting.ClockTime = OriginalLightValues.ClockTime or 14
    Lighting.Ambient = OriginalLightValues.Ambient or Color3.new(0, 0, 0)
    Lighting.OutdoorAmbient = OriginalLightValues.OutdoorAmbient or Color3.new(0, 0, 0)
    Lighting.FogStart = OriginalLightValues.FogStart or 0
    Lighting.FogEnd = OriginalLightValues.FogEnd or 100000
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
                if frames.B1 and frames.B1.Bar and frames.B1.Bar:FindFirstChild("UIScale") then
                    frames.B1.Bar.UIScale.Scale = 10
                end
                if frames.B2 and frames.B2.Bar and frames.B2.Bar:FindFirstChild("UIScale") then
                    frames.B2.Bar.UIScale.Scale = 10
                end
                if frames.B3 and frames.B3.Bar and frames.B3.Bar:FindFirstChild("UIScale") then
                    frames.B3.Bar.UIScale.Scale = 10
                end
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
            if frames.B1 and frames.B1.Bar and frames.B1.Bar:FindFirstChild("UIScale") then
                frames.B1.Bar.UIScale.Scale = 1
            end
            if frames.B2 and frames.B2.Bar and frames.B2.Bar:FindFirstChild("UIScale") then
                frames.B2.Bar.UIScale.Scale = 1
            end
            if frames.B3 and frames.B3.Bar and frames.B3.Bar:FindFirstChild("UIScale") then
                frames.B3.Bar.UIScale.Scale = 1
            end
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
    local bredMakurzFolder = Workspace.Map and Workspace.Map:FindFirstChild("BredMakurz")
    if not bredMakurzFolder then return end
    local char = getCharacter()
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local playerPosition = char.HumanoidRootPart.Position
    for _, v in pairs(bredMakurzFolder:GetChildren()) do
        local objectPosition
        if v.PrimaryPart and v.PrimaryPart:IsA("BasePart") then
            objectPosition = v.PrimaryPart.Position
        else
            local part = v:FindFirstChildOfClass("BasePart")
            if part then objectPosition = part.Position else continue end
        end
        local distance = (objectPosition - playerPosition).magnitude
        local existingGui = v:FindFirstChild("Ahh")
        if distance <= 200 then
            if not existingGui then
                local x = Instance.new('BillboardGui')
                x.Name = "Ahh"
                x.AlwaysOnTop = true
                x.Size = UDim2.new(8, 0, 4, 0)
                x.MaxDistance = 200
                x.Adornee = v
                x.Parent = v
                local textLabel = Instance.new('TextLabel')
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.BackgroundTransparency = 1
                textLabel.Font = Enum.Font.SourceSansBold
                textLabel.TextSize = 15
                textLabel.Text = formatName(v.Name)
                textLabel.Parent = x
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
    local bredMakurzFolder = Workspace.Map and Workspace.Map:FindFirstChild("BredMakurz")
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
        local char = getCharacter()
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum or hum.Health <= 0 then
            task.wait(0.5)
            continue
        end
        local doorsFolder = Workspace.Map and Workspace.Map:FindFirstChild("Doors")
        if not doorsFolder then
            if OpenNearbyDoors_Enabled then OpenNearbyDoors_Disable() end
            if UnlockNearbyDoors_Enabled then UnlockNearbyDoors_Disable() end
            break
        end
        local playerPos = hrp.Position
        for _, doorInstance in pairs(doorsFolder:GetChildren()) do
            local doorBase = doorInstance:FindFirstChild("DoorBase")
            local valuesFolder = doorInstance:FindFirstChild("Values")
            local eventsFolder = doorInstance:FindFirstChild("Events")
            if doorBase and valuesFolder and eventsFolder then
                if (playerPos - doorBase.Position).Magnitude <= 6 then
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
        task.wait(0.25)
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
        local cashFolder = Workspace.Filter and Workspace.Filter:FindFirstChild("SpawnedBread")
        local remoteEvent = ReplicatedStorage.Events and ReplicatedStorage.Events:FindFirstChild("CZDPZUS")
        if not cashFolder or not remoteEvent then return end
        if AutoPickupMoney_Cooldown then return end
        local rootPosition = hrp.Position
        for _, v in pairs(cashFolder:GetChildren()) do
            if v:IsA("BasePart") and (rootPosition - v.Position).Magnitude < 5 then
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

function MeleeAura_Enable()
    if MeleeAura_Enabled then return end
    MeleeAura_Enabled = true
    local eventsFolder = ReplicatedStorage:FindFirstChild("Events")
    if not eventsFolder then return end
    local remote1 = eventsFolder:FindFirstChild("XMHH.2")
    local remote2 = eventsFolder:FindFirstChild("XMHH2.2")
    if not remote1 or not remote2 then return end
    local maxdist = 5
    if MeleeAura_Connection then MeleeAura_Connection:Disconnect(); MeleeAura_Connection = nil end
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
    Enabled = false,
    TeamCheck = false,
    WallCheck = true,
    StickyAim = false,
    UseMouse = true,
    MouseBind = "MouseButton2",
    Keybind = nil,
    Fov = 100,
    Smoothing = 0.02,
    AimPart = "HumanoidRootPart",
    IsAimKeyDown = false,
    Target = nil,
    CameraTween = nil
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
    if gameProcessedEvent or not AimBotSettings.Enabled then return end
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
    if gameProcessedEvent or not AimBotSettings.Enabled then return end
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
                    local targetCFrame = CFrame.new(Workspace.CurrentCamera.CFrame.Position, aimPart.Position)
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
                        local targetCFrame = CFrame.new(Workspace.CurrentCamera.CFrame.Position, aimPart.Position)
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
                    local targetCFrame = CFrame.new(Workspace.CurrentCamera.CFrame.Position, aimPart.Position)
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
    AimBotSettings.Enabled = true
end

function Aimbot_Disable()
    AimBotSettings.Enabled = false
    AimBotSettings.IsAimKeyDown = false
    AimBotSettings.Target = nil
    if AimBotSettings.CameraTween then AimBotSettings.CameraTween:Cancel(); AimBotSettings.CameraTween = nil end
end

function Aimbot_Toggle()
    if AimBotSettings.Enabled then Aimbot_Disable() else Aimbot_Enable() end
    return AimBotSettings.Enabled
end

--======================= INFINITE STAMINA =========================--
local isInfiniteStaminaEnabled = false

function InfiniteStamina_Enable()
    isInfiniteStaminaEnabled = true
end

function InfiniteStamina_Disable()
    isInfiniteStaminaEnabled = false
end

function InfiniteStamina_Toggle()
    if isInfiniteStaminaEnabled then InfiniteStamina_Disable() else InfiniteStamina_Enable() end
    return isInfiniteStaminaEnabled
end

--======================= INVISIBILITY =========================--
local Shadow_Active = false
local Shadow_Usable = true
local Shadow_Char = nil
local Shadow_Hum = nil
local Shadow_HRP = nil
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

LocalPlayer.CharacterAdded:Connect(function()
    if Shadow_Active then Shadow_Deactivate() end
    if Shadow_AnimTrack then safeCall(function() Shadow_AnimTrack:Stop() end); Shadow_AnimTrack = nil end
    task.wait()
    UpdateShadowRefs()
    if Shadow_Hum and Shadow_Hum.RigType ~= Enum.HumanoidRigType.R6 then
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

function NoRecoil_Enable()
    NoRecoil_Enabled = true
    safeCall(function()
        for _, v in pairs(getgc(true)) do
            if type(v) == 'table' then
                if rawget(v, 'Recoil') ~= nil then
                    v.Recoil = 0
                    v.Spread = 0
                    v.CameraRecoilingEnabled = false
                end
                if rawget(v, 'AngleX_Min') ~= nil then
                    v.AngleX_Min = 0
                    v.AngleX_Max = 0
                    v.AngleY_Min = 0
                    v.AngleY_Max = 0
                    v.AngleZ_Min = 0
                    v.AngleZ_Max = 0
                end
            end
        end
    end)
end

function NoRecoil_Disable()
    NoRecoil_Enabled = false
end

function NoRecoil_Toggle()
    if NoRecoil_Enabled then NoRecoil_Disable() else NoRecoil_Enable() end
    return NoRecoil_Enabled
end

--======================= STAFF DETECTOR =========================--
local AdminCheck_Enabled = false
local AdminCheck_Connection = nil
local staffUsers = {
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

local function isStaff(player)
    for _, uid in pairs(staffUsers) do
        if player.UserId == uid then return true end
    end
    return false
end

function AdminCheck_Enable()
    if AdminCheck_Enabled then return end
    AdminCheck_Enabled = true
    local function check(p)
        if p == LocalPlayer then return end
        if isStaff(p) then LocalPlayer:Kick("SANTES: Staff - " .. p.Name) end
    end
    for _, p in pairs(Players:GetPlayers()) do check(p) end
    AdminCheck_Connection = Players.PlayerAdded:Connect(check)
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

function Ragebot_Enable()
    if Ragebot_Enabled then return end
    Ragebot_Enabled = true
    Ragebot_Coroutine = task.spawn(function()
        while Ragebot_Enabled do
            task.wait(0.1)
        end
    end)
end

function Ragebot_Disable()
    if not Ragebot_Enabled then return end
    Ragebot_Enabled = false
    if Ragebot_Coroutine then task.cancel(Ragebot_Coroutine); Ragebot_Coroutine = nil end
end

function Ragebot_Toggle()
    if Ragebot_Enabled then Ragebot_Disable() else Ragebot_Enable() end
    return Ragebot_Enabled
end

--======================= AUTOFARM =========================--
local autofarmEnabled = false

function Autofarm_Enable()
    if autofarmEnabled then return end
    autofarmEnabled = true
    if not AutoPickupMoney_Enabled then AutoPickupMoney_Enable() end
end

function Autofarm_Disable()
    if not autofarmEnabled then return end
    autofarmEnabled = false
    AutoPickupMoney_Disable()
end

function Autofarm_Toggle()
    if autofarmEnabled then Autofarm_Disable() else Autofarm_Enable() end
    return autofarmEnabled
end

-- ==================== ESP (OYUNCU) ====================
local espEnabled = false
local espConnections = {}
local espPlayers = {}

local function createESP(player)
    if player == LocalPlayer or espPlayers[player] then return end
    espPlayers[player] = true
    local function setupESP(character)
        if not espEnabled or not character or not character.Parent then return end
        local hl = Instance.new("Highlight")
        hl.Name = "SantesESP"
        hl.FillColor = Color3.fromRGB(200, 20, 20)
        hl.FillTransparency = 0.6
        hl.OutlineColor = Color3.fromRGB(255, 50, 50)
        hl.OutlineTransparency = 0
        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        hl.Parent = character
        local head = character:FindFirstChild("Head")
        if head then
            local bg = Instance.new("BillboardGui")
            bg.Name = "SantesESPInfo"
            bg.Size = UDim2.new(0, 120, 0, 40)
            bg.StudsOffset = Vector3.new(0, 2.5, 0)
            bg.AlwaysOnTop = true
            bg.Parent = head
            local nl = Instance.new("TextLabel")
            nl.Size = UDim2.new(1, 0, 0.5, 0)
            nl.BackgroundTransparency = 1
            nl.Text = player.Name
            nl.TextColor3 = Color3.new(1, 1, 1)
            nl.Font = Enum.Font.GothamBold
            nl.TextSize = 12
            nl.Parent = bg
            local dl = Instance.new("TextLabel")
            dl.Size = UDim2.new(1, 0, 0.3, 0)
            dl.Position = UDim2.new(0, 0, 0.7, 0)
            dl.BackgroundTransparency = 1
            dl.TextColor3 = Color3.fromRGB(150, 150, 150)
            dl.Font = Enum.Font.Gotham
            dl.TextSize = 10
            dl.Parent = bg
            RunService.Heartbeat:Connect(function()
                local myChar = getCharacter()
                local myHrp = myChar and myChar:FindFirstChild("HumanoidRootPart")
                local tHrp = character:FindFirstChild("HumanoidRootPart")
                if myHrp and tHrp then
                    dl.Text = string.format("%.1f m", (myHrp.Position - tHrp.Position).Magnitude)
                end
            end)
        end
    end
    if player.Character then setupESP(player.Character) end
    table.insert(espConnections, player.CharacterAdded:Connect(setupESP))
end

function ESP_Enable()
    if espEnabled then return end
    espEnabled = true
    espPlayers = {}
    for _, p in pairs(Players:GetPlayers()) do createESP(p) end
    table.insert(espConnections, Players.PlayerAdded:Connect(function(p) if espEnabled then createESP(p) end end))
    table.insert(espConnections, Players.PlayerRemoving:Connect(function(p) espPlayers[p] = nil end))
end

function ESP_Disable()
    espEnabled = false
    for _, c in pairs(espConnections) do safeCall(function() c:Disconnect() end) end
    espConnections = {}
    espPlayers = {}
    for _, p in pairs(Players:GetPlayers()) do
        safeCall(function()
            if p.Character then
                local h = p.Character:FindFirstChild("SantesESP")
                if h then h:Destroy() end
                for _, v in pairs(p.Character:GetDescendants()) do
                    if v:IsA("BillboardGui") and v.Name == "SantesESPInfo" then v:Destroy() end
                end
            end
        end)
    end
end

function ESP_Toggle()
    if espEnabled then ESP_Disable() else ESP_Enable() end
    return espEnabled
end

-- ==================== ANA GUI (SantesHub Premium) ====================

function CreateMainGUI()
    -- Eski GUI'yi temizle
    for _, name in pairs({"SantesHubScreenGui", "SantesHub_Main", "SantesHub", "SantesHubGui"}) do
        safeCall(function()
            local gui = PlayerGui:FindFirstChild(name)
            if gui then gui:Destroy() end
        end)
        safeCall(function()
            local gui = CoreGui:FindFirstChild(name)
            if gui then gui:Destroy() end
        end)
    end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "SantesHubGui"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = PlayerGui

    -- Ana panel
    local panel = Instance.new("Frame")
    panel.Name = "Panel"
    panel.Size = UDim2.new(0, 480, 0, 380)
    panel.Position = UDim2.new(0.5, -240, 0.5, -190)
    panel.BackgroundColor3 = C.bg
    panel.BorderSizePixel = 0
    panel.Parent = screenGui
    Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 10)
    local ps = Instance.new("UIStroke", panel)
    ps.Color = C.border
    ps.Thickness = 1.5

    -- Glow efekti
    local glow = Instance.new("ImageLabel")
    glow.Name = "Glow"
    glow.BackgroundTransparency = 1
    glow.Image = "rbxassetid://5028857084"
    glow.ImageColor3 = Color3.fromRGB(255, 0, 0)
    glow.ImageTransparency = 0.55
    glow.Size = UDim2.new(1, 60, 1, 60)
    glow.Position = UDim2.new(0, -30, 0, -30)
    glow.ZIndex = 0
    glow.Parent = panel

    -- Başlık çubuğu
    local titleBar = Instance.new("Frame")
    titleBar.Name = "TitleBar"
    titleBar.Size = UDim2.new(1, 0, 0, 34)
    titleBar.BackgroundColor3 = C.panel
    titleBar.BorderSizePixel = 0
    titleBar.Parent = panel
    Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 10)

    local titleLabel = Instance.new("TextLabel")
    titleLabel.BackgroundTransparency = 1
    titleLabel.Position = UDim2.new(0, 14, 0, 0)
    titleLabel.Size = UDim2.new(1, -80, 1, 0)
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Text = "SANTES HUB"
    titleLabel.TextColor3 = C.accent
    titleLabel.TextSize = 15
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = titleBar

    local versionLabel = Instance.new("TextLabel")
    versionLabel.BackgroundTransparency = 1
    versionLabel.Position = UDim2.new(0, 110, 0, 0)
    versionLabel.Size = UDim2.new(0, 60, 1, 0)
    versionLabel.Font = Enum.Font.Gotham
    versionLabel.Text = "v3.0"
    versionLabel.TextColor3 = C.text3
    versionLabel.TextSize = 10
    versionLabel.TextXAlignment = Enum.TextXAlignment.Left
    versionLabel.Parent = titleBar

    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Name = "MinimizeButton"
    minimizeButton.BackgroundTransparency = 1
    minimizeButton.Position = UDim2.new(1, -64, 0, 0)
    minimizeButton.Size = UDim2.new(0, 30, 1, 0)
    minimizeButton.Font = Enum.Font.GothamBold
    minimizeButton.Text = "—"
    minimizeButton.TextColor3 = C.text3
    minimizeButton.TextSize = 16
    minimizeButton.Parent = titleBar

    local closeButton = Instance.new("TextButton")
    closeButton.BackgroundTransparency = 1
    closeButton.Position = UDim2.new(1, -34, 0, 0)
    closeButton.Size = UDim2.new(0, 34, 1, 0)
    closeButton.Font = Enum.Font.GothamBold
    closeButton.Text = "×"
    closeButton.TextColor3 = C.text3
    closeButton.TextSize = 18
    closeButton.Parent = titleBar

    closeButton.MouseButton1Click:Connect(function()
        safeCall(function()
            if Fly_Enabled then Fly_Disable() end
            if Noclip_Enabled then Noclip_Disable() end
            if FullBright_Enabled then FullBright_Disable() end
            if espEnabled then ESP_Disable() end
            if Shadow_Active then Shadow_Deactivate() end
            if NoRecoil_Enabled then NoRecoil_Disable() end
            if Autofarm_Enabled then Autofarm_Disable() end
            if AutoPickupMoney_Enabled then AutoPickupMoney_Disable() end
            if AdminCheck_Enabled then AdminCheck_Disable() end
            if Ragebot_Enabled then Ragebot_Disable() end
            if MeleeAura_Enabled then MeleeAura_Disable() end
            if Aimbot_Enabled then Aimbot_Disable() end
        end)
        screenGui:Destroy()
    end)

    -- Body
    local body = Instance.new("Frame")
    body.Name = "Body"
    body.Position = UDim2.new(0, 0, 0, 34)
    body.Size = UDim2.new(1, 0, 1, -34 - 42)
    body.BackgroundTransparency = 1
    body.Parent = panel

    -- Sidebar
    local sidebar = Instance.new("Frame")
    sidebar.Name = "Sidebar"
    sidebar.Size = UDim2.new(0, 130, 1, 0)
    sidebar.BackgroundColor3 = C.panel
    sidebar.BorderSizePixel = 0
    sidebar.Parent = body

    local sidebarList = Instance.new("UIListLayout")
    sidebarList.Padding = UDim.new(0, 2)
    sidebarList.Parent = sidebar

    local tabNames = {"Genel", "Görünüm", "Savaş", "Farming", "Sistem"}
    local tabs = {}
    local currentTab = 1

    for i, name in ipairs(tabNames) do
        local tab = Instance.new("TextButton")
        tab.Name = "Tab_" .. name
        tab.Size = UDim2.new(1, 0, 0, 36)
        tab.BackgroundTransparency = 1
        tab.Font = Enum.Font.Gotham
        tab.Text = "   " .. name
        tab.TextXAlignment = Enum.TextXAlignment.Left
        tab.TextColor3 = C.text3
        tab.TextSize = 13
        tab.Parent = sidebar

        local indicator = Instance.new("Frame")
        indicator.Name = "Indicator"
        indicator.Size = UDim2.new(0, 3, 1, 0)
        indicator.BackgroundColor3 = C.accent
        indicator.BackgroundTransparency = 1
        indicator.BorderSizePixel = 0
        indicator.Parent = tab

        tabs[i] = {button = tab, indicator = indicator}
    end

    -- Content
    local content = Instance.new("ScrollingFrame")
    content.Name = "Content"
    content.Position = UDim2.new(0, 130, 0, 0)
    content.Size = UDim2.new(1, -130, 1, 0)
    content.BackgroundTransparency = 1
    content.BorderSizePixel = 0
    content.ScrollBarThickness = 3
    content.ScrollBarImageColor3 = C.accent
    content.CanvasSize = UDim2.new(0, 0, 0, 0)
    content.Parent = body

    local contentList = Instance.new("UIListLayout")
    contentList.Padding = UDim.new(0, 8)
    contentList.SortOrder = Enum.SortOrder.LayoutOrder
    contentList.Parent = content

    local contentPadding = Instance.new("UIPadding")
    contentPadding.PaddingTop = UDim.new(0, 12)
    contentPadding.PaddingLeft = UDim.new(0, 12)
    contentPadding.PaddingRight = UDim.new(0, 12)
    contentPadding.PaddingBottom = UDim.new(0, 12)
    contentPadding.Parent = content

    contentList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        content.CanvasSize = UDim2.new(0, 0, 0, contentList.AbsoluteContentSize.Y + 20)
    end)

    -- Toggle Row Oluşturucu
    local function createToggleRow(labelText, defaultOn, onEnable, onDisable, getState)
        local row = Instance.new("Frame")
        row.Size = UDim2.new(1, 0, 0, 40)
        row.BackgroundColor3 = C.card
        row.BorderSizePixel = 0
        row.Parent = content
        Instance.new("UICorner", row).CornerRadius = UDim.new(0, 6)
        local rs = Instance.new("UIStroke", row)
        rs.Color = C.border
        rs.Thickness = 1

        local label = Instance.new("TextLabel")
        label.BackgroundTransparency = 1
        label.Position = UDim2.new(0, 14, 0, 0)
        label.Size = UDim2.new(1, -80, 1, 0)
        label.Font = Enum.Font.Gotham
        label.Text = labelText
        label.TextColor3 = C.text2
        label.TextSize = 13
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = row

        local toggleBg = Instance.new("TextButton")
        toggleBg.Name = "Toggle"
        toggleBg.Position = UDim2.new(1, -54, 0.5, -10)
        toggleBg.Size = UDim2.new(0, 40, 0, 20)
        toggleBg.Text = ""
        toggleBg.AutoButtonColor = false
        toggleBg.BackgroundColor3 = defaultOn and C.on or C.off
        toggleBg.Parent = row
        Instance.new("UICorner", toggleBg).CornerRadius = UDim.new(1, 0)

        local knob = Instance.new("Frame")
        knob.Size = UDim2.new(0, 16, 0, 16)
        knob.Position = defaultOn and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
        knob.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
        knob.BorderSizePixel = 0
        knob.Parent = toggleBg
        Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

        local isOn = defaultOn
        local function updateState()
            if getState then
                local s, r = safeCall(getState)
                if s then isOn = r end
            end
            local targetPos = isOn and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
            local targetColor = isOn and C.on or C.off
            knob.Position = targetPos
            toggleBg.BackgroundColor3 = targetColor
        end

        toggleBg.MouseButton1Click:Connect(function()
            if isOn then
                if onDisable then safeCall(onDisable) end
            else
                if onEnable then safeCall(onEnable) end
            end
            isOn = not isOn
            updateState()
        end)

        updateState()
        return row
    end

    -- Sekme Geçişi
    local function selectTab(index)
        currentTab = index
        for i, t in ipairs(tabs) do
            if i == index then
                t.button.TextColor3 = C.accent
                t.indicator.BackgroundTransparency = 0
            else
                t.button.TextColor3 = C.text3
                t.indicator.BackgroundTransparency = 1
            end
        end

        for _, child in pairs(content:GetChildren()) do
            if child:IsA("Frame") then child:Destroy() end
        end

        local tabName = tabNames[index]
        if tabName == "Genel" then
            createToggleRow("Fly (Uçma)", false, Fly_Enable, Fly_Disable, function() return Fly_Enabled end)
            createToggleRow("Noclip", false, Noclip_Enable, Noclip_Disable, function() return Noclip_Enabled end)
            createToggleRow("Sınırsız Zıplama", false, function() end, function() end, function() return false end)
            createToggleRow("Sınırsız Enerji", false, InfiniteStamina_Enable, InfiniteStamina_Disable, function() return isInfiniteStaminaEnabled end)

        elseif tabName == "Görünüm" then
            createToggleRow("FullBright", false, FullBright_Enable, FullBright_Disable, function() return FullBright_Enabled end)
            createToggleRow("FOV Değiştir", false, FOV_Enable, FOV_Disable, function() return Fov_Enabled end)
            createToggleRow("ESP (Oyuncu)", false, ESP_Enable, ESP_Disable, function() return espEnabled end)
            createToggleRow("Safe ESP", false, SafeESP_Enable, SafeESP_Disable, function() return BredMakurz_Enabled end)
            createToggleRow("Görünmezlik", false, Invis_Enable, Invis_Disable, function() return Shadow_Active end)

        elseif tabName == "Savaş" then
            createToggleRow("Melee Aura", false, MeleeAura_Enable, MeleeAura_Disable, function() return MeleeAura_Enabled end)
            createToggleRow("Aimbot", false, Aimbot_Enable, Aimbot_Disable, function() return AimBotSettings.Enabled end)
            createToggleRow("No Recoil", false, NoRecoil_Enable, NoRecoil_Disable, function() return NoRecoil_Enabled end)
            createToggleRow("Ragebot", false, Ragebot_Enable, Ragebot_Disable, function() return Ragebot_Enabled end)

        elseif tabName == "Farming" then
            createToggleRow("Autofarm", false, Autofarm_Enable, Autofarm_Disable, function() return autofarmEnabled end)
            createToggleRow("Auto Pickup Money", false, AutoPickupMoney_Enable, AutoPickupMoney_Disable, function() return AutoPickupMoney_Enabled end)
            createToggleRow("No Fail Lockpick", false, NoFailLockpick_Enable, NoFailLockpick_Disable, function() return NoFailLockpick_Enabled end)
            createToggleRow("Kapı Aç", false, OpenNearbyDoors_Enable, OpenNearbyDoors_Disable, function() return OpenNearbyDoors_Enabled end)
            createToggleRow("Kapı Kilit Aç", false, UnlockNearbyDoors_Enable, UnlockNearbyDoors_Disable, function() return UnlockNearbyDoors_Enabled end)

        elseif tabName == "Sistem" then
            createToggleRow("Staff Detector", false, AdminCheck_Enable, AdminCheck_Disable, function() return AdminCheck_Enabled end)
        end

        content.CanvasPosition = Vector2.new(0, 0)
        contentList:GetPropertyChangedSignal("AbsoluteContentSize"):Fire()
    end

    for i, t in ipairs(tabs) do
        t.button.MouseButton1Click:Connect(function()
            selectTab(i)
        end)
    end

    selectTab(1)

    -- Footer
    local footer = Instance.new("Frame")
    footer.Name = "Footer"
    footer.Position = UDim2.new(0, 0, 1, -42)
    footer.Size = UDim2.new(1, 0, 0, 42)
    footer.BackgroundColor3 = C.panel
    footer.BorderSizePixel = 0
    footer.Parent = panel
    Instance.new("UICorner", footer).CornerRadius = UDim.new(0, 10)

    -- Avatar (Kullanıcının kafası)
    local avatar = Instance.new("ImageLabel")
    avatar.Position = UDim2.new(0, 12, 0.5, -13)
    avatar.Size = UDim2.new(0, 26, 0, 26)
    avatar.BackgroundColor3 = C.accent
    avatar.BackgroundTransparency = 1
    avatar.BorderSizePixel = 0
    avatar.Parent = footer
    Instance.new("UICorner", avatar).CornerRadius = UDim.new(1, 0)

    -- Avatar resmini yükle
    safeCall(function()
        local thumbType = Enum.ThumbnailType.HeadShot
        local thumbSize = Enum.ThumbnailSize.Size420x420
        local success, result = safeCall(function()
            return Players:GetUserThumbnailAsync(LocalPlayer.UserId, thumbType, thumbSize)
        end)
        if success and result and #result > 0 then
            avatar.Image = result
        end
    end)

    local footerLabel = Instance.new("TextLabel")
    footerLabel.BackgroundTransparency = 1
    footerLabel.Position = UDim2.new(0, 48, 0, 0)
    footerLabel.Size = UDim2.new(1, -60, 1, 0)
    footerLabel.Font = Enum.Font.Gotham
    footerLabel.Text = LocalPlayer.Name
    footerLabel.TextColor3 = C.text2
    footerLabel.TextSize = 12
    footerLabel.TextXAlignment = Enum.TextXAlignment.Left
    footerLabel.Parent = footer

    -- Sürükleme
    local dragging, dragInput, dragStart, startPos
    local wasDragged = false

    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            wasDragged = false
            dragStart = input.Position
            startPos = panel.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    titleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            if delta.Magnitude > 3 then wasDragged = true end
            panel.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    -- Minimize
    local isMinimized = false
    local fullSize = UDim2.new(0, 480, 0, 380)
    local minimizedSize = UDim2.new(0, 90, 0, 90)

    local function minimizePanel()
        isMinimized = true
        body.Visible = false
        footer.Visible = false
        minimizeButton.Visible = false
        closeButton.Visible = false
        titleLabel.Text = "SANTES\nHUB"
        titleLabel.TextSize = 13
        titleLabel.TextWrapped = true
        titleLabel.TextXAlignment = Enum.TextXAlignment.Center
        titleLabel.TextYAlignment = Enum.TextYAlignment.Center
        titleLabel.Position = UDim2.new(0, 0, 0, 0)
        titleLabel.Size = UDim2.new(1, 0, 1, 0)
        titleBar.Size = UDim2.new(1, 0, 1, 0)
        TweenService:Create(panel, TweenInfo.new(0.18, Enum.EasingStyle.Quad), {Size = minimizedSize}):Play()
    end

    local function restorePanel()
        isMinimized = false
        TweenService:Create(panel, TweenInfo.new(0.18, Enum.EasingStyle.Quad), {Size = fullSize}):Play()
        task.wait(0.18)
        titleBar.Size = UDim2.new(1, 0, 0, 34)
        titleLabel.Text = "SANTES HUB"
        titleLabel.TextSize = 15
        titleLabel.TextWrapped = false
        titleLabel.TextXAlignment = Enum.TextXAlignment.Left
        titleLabel.TextYAlignment = Enum.TextYAlignment.Center
        titleLabel.Position = UDim2.new(0, 14, 0, 0)
        titleLabel.Size = UDim2.new(1, -80, 1, 0)
        body.Visible = true
        footer.Visible = true
        minimizeButton.Visible = true
        closeButton.Visible = true
    end

    minimizeButton.MouseButton1Click:Connect(function()
        minimizePanel()
    end)

    titleBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and isMinimized and not wasDragged then
            restorePanel()
        end
        wasDragged = false
    end)

    -- Right Shift ile aç/kapa
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
            if isMinimized then restorePanel()
            else minimizePanel() end
        end
    end)

    print("╔═══════════════════════════════════════╗")
    print("║     SANTES HUB v3.2 YÜKLENDİ!       ║")
    print("║                                     ║")
    print("║  ➤ Right Shift ile Menüyü Aç/Kapat  ║")
    print("║  ➤ ESC ile Menüyü Kapat            ║")
    print("║                                     ║")
    print("║  ⚠ SADECE EĞİTİM AMAÇLIDIR! ⚠     ║")
    print("╚═══════════════════════════════════════╝")
end

ShowLoader()

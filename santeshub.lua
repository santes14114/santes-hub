--[[
    SANTES HUB v3.2 - Premium Edition
    Geliştirici: Roblox Lua Uzmanı
    Versiyon: 3.2.2
    Tarih: 2026
    
    UYARI: Bu script sadece eğitim amaçlıdır!
    Etik olmayan kullanımlardan kaçınılmalıdır.
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
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local VirtualUser = game:GetService("VirtualUser")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local TextChatService = game:GetService("TextChatService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui", 10)

if not PlayerGui then return end

local function safeCall(func, ...)
    local success, result = pcall(func, ...)
    return success, result
end

for _, name in pairs({"SantesHubScreenGui", "SantesHub_Main", "SantesHub_Loader", "SantesHub"}) do
    safeCall(function()
        local gui = PlayerGui:FindFirstChild(name)
        if gui then gui:Destroy() end
    end)
    safeCall(function()
        local gui = CoreGui:FindFirstChild(name)
        if gui then gui:Destroy() end
    end)
end

local C = {
    bg = Color3.fromRGB(8, 8, 12),
    panel = Color3.fromRGB(14, 14, 20),
    card = Color3.fromRGB(18, 18, 26),
    surface = Color3.fromRGB(22, 22, 34),
    surfaceUp = Color3.fromRGB(28, 28, 42),
    accent = Color3.fromRGB(200, 20, 20),
    accentDark = Color3.fromRGB(150, 15, 15),
    accentBright = Color3.fromRGB(230, 30, 30),
    accentGlow = Color3.fromRGB(255, 40, 40),
    accentDim = Color3.fromRGB(120, 15, 15),
    text = Color3.fromRGB(235, 235, 245),
    text2 = Color3.fromRGB(150, 150, 170),
    text3 = Color3.fromRGB(80, 80, 100),
    textMuted = Color3.fromRGB(60, 60, 80),
    on = Color3.fromRGB(200, 20, 20),
    off = Color3.fromRGB(45, 45, 55),
    success = Color3.fromRGB(40, 180, 80),
    warning = Color3.fromRGB(220, 180, 40),
    border = Color3.fromRGB(35, 35, 45),
    borderLight = Color3.fromRGB(50, 40, 45),
    shadow = Color3.fromRGB(0, 0, 0),
    green = Color3.fromRGB(0, 200, 80),
    cyan = Color3.fromRGB(0, 200, 200),
    orange = Color3.fromRGB(255, 160, 40),
}

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

-- ==================== MODAL SİSTEMİ ====================
local mainGui = nil

local function createModalBackdrop()
    local backdrop = Instance.new("Frame")
    backdrop.Size = UDim2.new(1, 0, 1, 0)
    backdrop.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    backdrop.BackgroundTransparency = 0.5
    backdrop.BorderSizePixel = 0
    backdrop.ZIndex = 100
    backdrop.Parent = mainGui
    return backdrop
end

local function createModal(title, message, options)
    local modalBg = createModalBackdrop()
    local modal = Instance.new("Frame")
    modal.Size = UDim2.new(0, 400, 0, 200)
    modal.Position = UDim2.new(0.5, -200, 0.5, -100)
    modal.AnchorPoint = Vector2.new(0.5, 0.5)
    modal.BackgroundColor3 = C.bg
    modal.BorderSizePixel = 0
    modal.ZIndex = 101
    modal.Parent = modalBg
    Instance.new("UICorner", modal).CornerRadius = UDim.new(0, 10)
    local ms = Instance.new("UIStroke", modal)
    ms.Color = C.accent
    ms.Thickness = 1
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -20, 0, 40)
    titleLabel.Position = UDim2.new(0, 10, 0, 10)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 18
    titleLabel.TextColor3 = C.accent
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.ZIndex = 102
    titleLabel.Parent = modal
    
    local msgLabel = Instance.new("TextLabel")
    msgLabel.Size = UDim2.new(1, -20, 0, 60)
    msgLabel.Position = UDim2.new(0, 10, 0, 55)
    msgLabel.BackgroundTransparency = 1
    msgLabel.Text = message
    msgLabel.Font = Enum.Font.Gotham
    msgLabel.TextSize = 14
    msgLabel.TextColor3 = C.text2
    msgLabel.TextXAlignment = Enum.TextXAlignment.Left
    msgLabel.TextWrapped = true
    msgLabel.ZIndex = 102
    msgLabel.Parent = modal
    
    local buttonFrame = Instance.new("Frame")
    buttonFrame.Size = UDim2.new(1, -20, 0, 50)
    buttonFrame.Position = UDim2.new(0, 10, 1, -60)
    buttonFrame.BackgroundTransparency = 1
    buttonFrame.ZIndex = 102
    buttonFrame.Parent = modal
    
    local buttonLayout = Instance.new("UIListLayout")
    buttonLayout.FillDirection = Enum.FillDirection.Horizontal
    buttonLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    buttonLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    buttonLayout.Padding = UDim.new(0, 10)
    buttonLayout.Parent = buttonFrame
    
    for _, option in pairs(options) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, 100, 0, 36)
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 13
        btn.Text = option.text
        btn.TextColor3 = C.text
        btn.BackgroundColor3 = option.isPrimary and C.accent or C.card
        btn.BorderSizePixel = 0
        btn.AutoButtonColor = false
        btn.ZIndex = 102
        btn.Parent = buttonFrame
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
        btn.MouseButton1Click:Connect(function()
            modalBg:Destroy()
            if option.callback then option.callback() end
        end)
    end
    return modalBg
end

local function showConfirm(title, message, onConfirm, onCancel)
    return createModal(title, message, {
        {text = "Hayır", isPrimary = false, callback = onCancel},
        {text = "Evet", isPrimary = true, callback = onConfirm}
    })
end

local function showAlert(title, message, onClose)
    return createModal(title, message, {
        {text = "Tamam", isPrimary = true, callback = onClose}
    })
end

local function showPrompt(title, message, placeholder, onConfirm, onCancel)
    local modalBg = createModalBackdrop()
    local modal = Instance.new("Frame")
    modal.Size = UDim2.new(0, 400, 0, 250)
    modal.Position = UDim2.new(0.5, -200, 0.5, -125)
    modal.AnchorPoint = Vector2.new(0.5, 0.5)
    modal.BackgroundColor3 = C.bg
    modal.BorderSizePixel = 0
    modal.ZIndex = 101
    modal.Parent = modalBg
    Instance.new("UICorner", modal).CornerRadius = UDim.new(0, 10)
    local ms = Instance.new("UIStroke", modal)
    ms.Color = C.accent
    ms.Thickness = 1
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -20, 0, 40)
    titleLabel.Position = UDim2.new(0, 10, 0, 10)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 18
    titleLabel.TextColor3 = C.accent
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.ZIndex = 102
    titleLabel.Parent = modal
    
    local msgLabel = Instance.new("TextLabel")
    msgLabel.Size = UDim2.new(1, -20, 0, 40)
    msgLabel.Position = UDim2.new(0, 10, 0, 55)
    msgLabel.BackgroundTransparency = 1
    msgLabel.Text = message
    msgLabel.Font = Enum.Font.Gotham
    msgLabel.TextSize = 14
    msgLabel.TextColor3 = C.text2
    msgLabel.TextXAlignment = Enum.TextXAlignment.Left
    msgLabel.TextWrapped = true
    msgLabel.ZIndex = 102
    msgLabel.Parent = modal
    
    local inputBox = Instance.new("TextBox")
    inputBox.Size = UDim2.new(1, -20, 0, 40)
    inputBox.Position = UDim2.new(0, 10, 0, 100)
    inputBox.BackgroundColor3 = C.card
    inputBox.BorderSizePixel = 0
    inputBox.Font = Enum.Font.Gotham
    inputBox.TextSize = 14
    inputBox.TextColor3 = C.text
    inputBox.PlaceholderText = placeholder or "Değer girin..."
    inputBox.PlaceholderColor3 = C.text3
    inputBox.Text = ""
    inputBox.ZIndex = 102
    inputBox.Parent = modal
    Instance.new("UICorner", inputBox).CornerRadius = UDim.new(0, 6)
    
    local buttonFrame = Instance.new("Frame")
    buttonFrame.Size = UDim2.new(1, -20, 0, 50)
    buttonFrame.Position = UDim2.new(0, 10, 1, -60)
    buttonFrame.BackgroundTransparency = 1
    buttonFrame.ZIndex = 102
    buttonFrame.Parent = modal
    
    local buttonLayout = Instance.new("UIListLayout")
    buttonLayout.FillDirection = Enum.FillDirection.Horizontal
    buttonLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    buttonLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    buttonLayout.Padding = UDim.new(0, 10)
    buttonLayout.Parent = buttonFrame
    
    local cancelBtn = Instance.new("TextButton")
    cancelBtn.Size = UDim2.new(0, 100, 0, 36)
    cancelBtn.Font = Enum.Font.GothamBold
    cancelBtn.TextSize = 13
    cancelBtn.Text = "İptal"
    cancelBtn.TextColor3 = C.text
    cancelBtn.BackgroundColor3 = C.card
    cancelBtn.BorderSizePixel = 0
    cancelBtn.AutoButtonColor = false
    cancelBtn.ZIndex = 102
    cancelBtn.Parent = buttonFrame
    Instance.new("UICorner", cancelBtn).CornerRadius = UDim.new(0, 6)
    cancelBtn.MouseButton1Click:Connect(function()
        modalBg:Destroy()
        if onCancel then onCancel() end
    end)
    
    local confirmBtn = Instance.new("TextButton")
    confirmBtn.Size = UDim2.new(0, 100, 0, 36)
    confirmBtn.Font = Enum.Font.GothamBold
    confirmBtn.TextSize = 13
    confirmBtn.Text = "Tamam"
    confirmBtn.TextColor3 = C.text
    confirmBtn.BackgroundColor3 = C.accent
    confirmBtn.BorderSizePixel = 0
    confirmBtn.AutoButtonColor = false
    confirmBtn.ZIndex = 102
    confirmBtn.Parent = buttonFrame
    Instance.new("UICorner", confirmBtn).CornerRadius = UDim.new(0, 6)
    confirmBtn.MouseButton1Click:Connect(function()
        local value = inputBox.Text
        modalBg:Destroy()
        if onConfirm then onConfirm(value) end
    end)
    
    inputBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local value = inputBox.Text
            modalBg:Destroy()
            if onConfirm then onConfirm(value) end
        end
    end)
    return modalBg
end

-- ==================== FEATURE FONKSİYONLARI ====================

-- FLY
local flyEnabled = false
local flyConnection = nil

function Fly_Enable()
    if flyEnabled then return end
    flyEnabled = true
    local char = getCharacter()
    if char then
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then hrp.Velocity = Vector3.new(0, 30, 0) end
    end
    flyConnection = RunService.Heartbeat:Connect(function(dt)
        if not flyEnabled then return end
        local c = getCharacter()
        local hrp = c and c:FindFirstChild("HumanoidRootPart")
        local hum = c and c:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum then return end
        hum.PlatformStand = true
        for _, p in pairs(c:GetDescendants()) do
            if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
                p.AssemblyLinearVelocity = Vector3.zero
                p.Velocity = Vector3.zero
            end
        end
        local cam = Workspace.CurrentCamera
        if not cam then return end
        local tv = Vector3.new()
        local fwd = Vector3.new(cam.CFrame.LookVector.X, 0, cam.CFrame.LookVector.Z).Unit
        local rgt = Vector3.new(cam.CFrame.RightVector.X, 0, cam.CFrame.RightVector.Z).Unit
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then tv += fwd * 70 end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then tv -= fwd * 70 end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then tv -= rgt * 70 end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then tv += rgt * 70 end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then tv += Vector3.new(0, 70, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then tv -= Vector3.new(0, 70, 0) end
        if tv.Magnitude < 0.1 then
            hrp.Velocity = Vector3.new(0, 0.3, 0)
            hrp.AssemblyLinearVelocity = Vector3.zero
        else
            hrp.Velocity = tv
            hrp.AssemblyLinearVelocity = tv
        end
    end)
end

function Fly_Disable()
    flyEnabled = false
    if flyConnection then flyConnection:Disconnect(); flyConnection = nil end
    local c = getCharacter()
    if c then
        local h = c:FindFirstChildOfClass("Humanoid")
        if h then h.PlatformStand = false end
    end
end

-- NOCLIP
local noclipEnabled = false
local noclipConnection = nil

function Noclip_Enable()
    if noclipEnabled then return end
    noclipEnabled = true
    noclipConnection = RunService.Stepped:Connect(function()
        if noclipEnabled and getCharacter() then
            for _, p in pairs(getCharacter():GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = false end
            end
        end
    end)
end

function Noclip_Disable()
    noclipEnabled = false
    if noclipConnection then noclipConnection:Disconnect(); noclipConnection = nil end
end

-- INFINITE JUMP
local infiniteJumpEnabled = false
local infiniteJumpConnection = nil

function InfiniteJump_Enable()
    if infiniteJumpEnabled then return end
    infiniteJumpEnabled = true
    infiniteJumpConnection = UserInputService.InputBegan:Connect(function(input)
        if infiniteJumpEnabled and input.KeyCode == Enum.KeyCode.Space then
            local char = getCharacter()
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then hrp.Velocity = Vector3.new(hrp.Velocity.X, 50, hrp.Velocity.Z) end
            end
        end
    end)
end

function InfiniteJump_Disable()
    infiniteJumpEnabled = false
    if infiniteJumpConnection then infiniteJumpConnection:Disconnect(); infiniteJumpConnection = nil end
end

-- HIGH JUMP
local highJumpEnabled = false
local highJumpConnection = nil

function HighJump_Enable()
    if highJumpEnabled then return end
    highJumpEnabled = true
    highJumpConnection = RunService.Stepped:Connect(function()
        if highJumpEnabled then
            local char = getCharacter()
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hrp and hum and hum:GetState() == Enum.HumanoidStateType.Jumping then
                    hrp.Velocity = Vector3.new(hrp.Velocity.X, 80, hrp.Velocity.Z)
                end
            end
        end
    end)
end

function HighJump_Disable()
    highJumpEnabled = false
    if highJumpConnection then highJumpConnection:Disconnect(); highJumpConnection = nil end
end

-- LOW GRAVITY
local lowGravityEnabled = false
local lowGravityConnection = nil

function LowGravity_Enable()
    if lowGravityEnabled then return end
    lowGravityEnabled = true
    lowGravityConnection = RunService.Stepped:Connect(function()
        if lowGravityEnabled then
            local char = getCharacter()
            if char then
                for _, p in pairs(char:GetDescendants()) do
                    if p:IsA("BasePart") then
                        p.AssemblyLinearVelocity = p.AssemblyLinearVelocity * 0.8
                    end
                end
            end
        end
    end)
end

function LowGravity_Disable()
    lowGravityEnabled = false
    if lowGravityConnection then lowGravityConnection:Disconnect(); lowGravityConnection = nil end
end

-- UNDERGROUND
local undergroundEnabled = false
local undergroundConnection = nil

function Underground_Enable()
    if undergroundEnabled then return end
    undergroundEnabled = true
    undergroundConnection = RunService.Stepped:Connect(function()
        if undergroundEnabled then
            local char = getCharacter()
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.CFrame = hrp.CFrame - Vector3.new(0, 0.5, 0)
                    if hrp.Position.Y < -50 then
                        hrp.CFrame = CFrame.new(Vector3.new(hrp.Position.X, -10, hrp.Position.Z))
                    end
                end
            end
        end
    end)
end

function Underground_Disable()
    undergroundEnabled = false
    if undergroundConnection then undergroundConnection:Disconnect(); undergroundConnection = nil end
end

-- INFINITE STAMINA
local infStaminaEnabled = false
local infStaminaConnection = nil

function InfiniteStamina_Enable()
    if infStaminaEnabled then return end
    infStaminaEnabled = true
    infStaminaConnection = RunService.RenderStepped:Connect(function()
        if infStaminaEnabled then
            local char = getCharacter()
            if char then
                for _, h in pairs(char:GetDescendants()) do
                    if h:IsA("Humanoid") and h.MaxStamina and h.Stamina then
                        h.Stamina = h.MaxStamina
                    end
                end
            end
        end
    end)
end

function InfiniteStamina_Disable()
    infStaminaEnabled = false
    if infStaminaConnection then infStaminaConnection:Disconnect(); infStaminaConnection = nil end
end

-- PLAYER ESP
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
            local hb = Instance.new("Frame")
            hb.Size = UDim2.new(0.8, 0, 0.3, 0)
            hb.Position = UDim2.new(0.1, 0, 0.6, 0)
            hb.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            hb.BorderSizePixel = 0
            hb.Parent = bg
            local hf = Instance.new("Frame")
            hf.Size = UDim2.new(1, 0, 1, 0)
            hf.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
            hf.BorderSizePixel = 0
            hf.Parent = hb
            local hum = character:FindFirstChildOfClass("Humanoid")
            if hum then
                hum:GetPropertyChangedSignal("Health"):Connect(function()
                    local pct = hum.Health / hum.MaxHealth
                    hf.Size = UDim2.new(pct, 0, 1, 0)
                    hf.BackgroundColor3 = pct > 0.5 and Color3.fromRGB(0, 200, 0) or 
                                          (pct > 0.25 and Color3.fromRGB(200, 200, 0) or Color3.fromRGB(200, 0, 0))
                end)
            end
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

-- SAFE ESP
local safeESPEnabled = false
local safeESPConnection = nil

local function updateSafeESP()
    local folder = Workspace.Map and Workspace.Map:FindFirstChild("BredMakurz") or Workspace:FindFirstChild("BredMakurz")
    if not folder then return end
    local char = getCharacter()
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    for _, obj in pairs(folder:GetChildren()) do
        local part = obj.PrimaryPart or obj:FindFirstChildOfClass("BasePart")
        if part then
            local dist = (part.Position - hrp.Position).Magnitude
            local exist = obj:FindFirstChild("SantesSE")
            if dist <= 200 then
                if not exist then
                    local bg = Instance.new("BillboardGui")
                    bg.Name = "SantesSE"
                    bg.AlwaysOnTop = true
                    bg.Size = UDim2.new(8, 0, 4, 0)
                    bg.MaxDistance = 200
                    bg.Adornee = obj
                    bg.Parent = obj
                    local lb = Instance.new("TextLabel")
                    lb.Size = UDim2.new(1, 0, 1, 0)
                    lb.BackgroundTransparency = 1
                    lb.Font = Enum.Font.SourceSansBold
                    lb.TextSize = 15
                    lb.Text = obj.Name:gsub("([a-z])([A-Z])", "%1 %2"):gsub("_.*", "")
                    lb.Parent = bg
                    local vals = obj:FindFirstChild("Values")
                    local broken = vals and vals:FindFirstChild("Broken")
                    if broken and broken:IsA("BoolValue") then
                        lb.TextColor3 = broken.Value and Color3.new(1, 0, 0) or Color3.new(0, 1, 0)
                        broken:GetPropertyChangedSignal("Value"):Connect(function()
                            if lb and lb.Parent then
                                lb.TextColor3 = broken.Value and Color3.new(1, 0, 0) or Color3.new(0, 1, 0)
                            end
                        end)
                    else lb.TextColor3 = Color3.new(0, 1, 0) end
                end
            elseif exist then exist:Destroy() end
        end
    end
end

function SafeESP_Enable()
    if safeESPEnabled then return end
    safeESPEnabled = true
    safeESPConnection = RunService.Heartbeat:Connect(updateSafeESP)
end

function SafeESP_Disable()
    safeESPEnabled = false
    if safeESPConnection then safeESPConnection:Disconnect(); safeESPConnection = nil end
    local folder = Workspace.Map and Workspace.Map:FindFirstChild("BredMakurz") or Workspace:FindFirstChild("BredMakurz")
    if folder then for _, obj in pairs(folder:GetChildren()) do
        local esp = obj:FindFirstChild("SantesSE")
        if esp then esp:Destroy() end
    end end
end

-- INVISIBILITY
local invisEnabled = false
local invisUsable = truelocal invisTrack = nil
local invisChar = nil
local invisHum = nil
local invisHRP = nil
local invisWarn = nil

local function updateInvisChar()
    invisChar = LocalPlayer.Character
    invisHum = invisChar and invisChar:FindFirstChildOfClass("Humanoid")
    invisHRP = invisChar and invisChar:FindFirstChild("HumanoidRootPart")
end

local function loadInvisAnim()
    if invisTrack then safeCall(function() invisTrack:Stop() end); invisTrack = nil end
    if invisHum then
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://215384594"
        local s, r = safeCall(function() return invisHum:LoadAnimation(anim) end)
        if s then invisTrack = r; invisTrack.Priority = Enum.AnimationPriority.Action4 end
    end
end

RunService.Heartbeat:Connect(function(dt)
    if not invisEnabled or not invisUsable then
        if not invisEnabled and invisChar then
            for _, v in pairs(invisChar:GetDescendants()) do
                if v:IsA("BasePart") and v.Transparency == 0.5 then v.Transparency = 0 end
            end
        end
        if invisWarn then invisWarn.Visible = false end
        return
    end
    if not invisChar or not invisHum or not invisHRP or invisHum.Health <= 0 then
        if invisWarn then invisWarn.Visible = false end
        return
    end
    if invisWarn then invisWarn.Visible = true end
    if invisHum.MoveDirection.Magnitude > 0 then
        invisHRP.CFrame += invisHum.MoveDirection * 12 * dt
    end
    local oldCF = invisHRP.CFrame
    local oldOff = invisHum.CameraOffset
    local _, y = Workspace.CurrentCamera.CFrame:ToOrientation()
    invisHRP.CFrame = CFrame.new(invisHRP.Position) * CFrame.fromOrientation(0, y, 0) * CFrame.Angles(math.rad(90), 0, 0)
    invisHum.CameraOffset = Vector3.new(0, 1.44, 0)
    if invisTrack then
        safeCall(function()
            if not invisTrack.IsPlaying then invisTrack:Play() end
            invisTrack:AdjustSpeed(0)
            invisTrack.TimePosition = 0.3
        end)
    elseif invisHum.Health > 0 then loadInvisAnim() end
    RunService.RenderStepped:Wait()
    if invisHum:IsDescendantOf(Workspace) then invisHum.CameraOffset = oldOff end
    if invisHRP:IsDescendantOf(Workspace) then invisHRP.CFrame = oldCF end
    if invisTrack then safeCall(function() invisTrack:Stop() end) end
    if invisHRP:IsDescendantOf(Workspace) then
        local lv = Workspace.CurrentCamera.CFrame.LookVector
        local fl = Vector3.new(lv.X, 0, lv.Z).Unit
        if fl.Magnitude > 0.1 then invisHRP.CFrame = CFrame.new(invisHRP.Position, invisHRP.Position + fl) end
    end
    for _, v in pairs(invisChar:GetDescendants()) do
        if v:IsA("BasePart") and v.Transparency ~= 1 then v.Transparency = 0.5 end
    end
end)

LocalPlayer.CharacterAdded:Connect(function()
    if invisTrack then safeCall(function() invisTrack:Stop() end); invisTrack = nil end
    task.wait()
    updateInvisChar()
    if invisHum and invisHum.RigType ~= Enum.HumanoidRigType.R6 then
        invisUsable = false
        if invisEnabled then Invis_Disable() end
    else
        invisUsable = true
        if invisEnabled then Workspace.CurrentCamera.CameraSubject = invisHRP; loadInvisAnim() end
    end
end)

updateInvisChar()
if invisHum and invisHum.RigType ~= Enum.HumanoidRigType.R6 then invisUsable = false end

local invisGUI = Instance.new("ScreenGui")
invisGUI.Name = "InvisWarning"
invisGUI.Parent = CoreGui
invisGUI.ResetOnSpawn = false
invisWarn = Instance.new("TextLabel", invisGUI)
invisWarn.Text = "⚠ VISIBLE! ⚠"
invisWarn.Visible = false
invisWarn.Size = UDim2.new(0, 200, 0, 30)
invisWarn.Position = UDim2.new(0.5, -100, 0.85, 0)
invisWarn.BackgroundTransparency = 1
invisWarn.Font = Enum.Font.GothamBold
invisWarn.TextSize = 24
invisWarn.TextColor3 = Color3.fromRGB(255, 255, 0)
invisWarn.TextStrokeTransparency = 0.5

function Invis_Enable()
    if invisEnabled or not invisUsable then return end
    invisEnabled = true
    updateInvisChar()
    if invisHRP then Workspace.CurrentCamera.CameraSubject = invisHRP end
    loadInvisAnim()
end

function Invis_Disable()
    if not invisEnabled then return end
    invisEnabled = false
    if invisTrack then safeCall(function() invisTrack:Stop() end); invisTrack = nil end
    if invisHum then Workspace.CurrentCamera.CameraSubject = invisHum end
    if invisChar then
        for _, v in pairs(invisChar:GetDescendants()) do
            if v:IsA("BasePart") and v.Transparency == 0.5 then v.Transparency = 0 end
        end
    end
    if invisWarn then invisWarn.Visible = false end
end

-- GOD MODE
local godModeEnabled = false
local godModeConnection = nil

function GodMode_Enable()
    if godModeEnabled then return end
    godModeEnabled = true
    godModeConnection = RunService.Heartbeat:Connect(function()
        if godModeEnabled then
            local char = getCharacter()
            if char then
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum and hum.Health < hum.MaxHealth then hum.Health = hum.MaxHealth end
            end
        end
    end)
end

function GodMode_Disable()
    godModeEnabled = false
    if godModeConnection then godModeConnection:Disconnect(); godModeConnection = nil end
end

-- NO RAGDOLL
local noRagdollEnabled = false
local noRagdollConnection = nil

function NoRagdoll_Enable()
    if noRagdollEnabled then return end
    noRagdollEnabled = true
    noRagdollConnection = RunService.Heartbeat:Connect(function()
        if noRagdollEnabled then
            local char = getCharacter()
            if char then
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum and hum:GetState() == Enum.HumanoidStateType.Ragdoll then
                    hum:ChangeState(Enum.HumanoidStateType.GettingUp)
                end
            end
        end
    end)
end

function NoRagdoll_Disable()
    noRagdollEnabled = false
    if noRagdollConnection then noRagdollConnection:Disconnect(); noRagdollConnection = nil end
end

-- SILENT AIM
local silentAimEnabled = false
local silentAimConnection = nil
local silentAimFOV = 150

function SilentAim_Enable()
    if silentAimEnabled then return end
    silentAimEnabled = true
    silentAimConnection = RunService.RenderStepped:Connect(function()
        if not silentAimEnabled then return end
        local cam = Workspace.CurrentCamera
        if not cam then return end
        local char = getCharacter()
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local sc = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)
        local cp = nil
        local cd = silentAimFOV
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local hum = p.Character:FindFirstChildOfClass("Humanoid")
                local tp = p.Character:FindFirstChild("Head") or p.Character:FindFirstChild("HumanoidRootPart")
                if hum and hum.Health > 0 and tp then
                    local sp, on = cam:WorldToViewportPoint(tp.Position)
                    if on then
                        local d = (Vector2.new(sp.X, sp.Y) - sc).Magnitude
                        if d < cd then cd = d; cp = p end
                    end
                end
            end
        end
        if cp and cp.Character then
            local tp = cp.Character:FindFirstChild("Head") or cp.Character:FindFirstChild("HumanoidRootPart")
            if tp then
                local hb = tp:FindFirstChild("SantesHitbox")
                if not hb then
                    hb = Instance.new("Part")
                    hb.Name = "SantesHitbox"
                    hb.Size = Vector3.new(5, 5, 5)
                    hb.Transparency = 1
                    hb.CanCollide = false
                    hb.Anchored = false
                    hb.Massless = true
                    hb.Parent = tp
                    local w = Instance.new("WeldConstraint")
                    w.Part0 = hb
                    w.Part1 = tp
                    w.Parent = hb
                end
            end
        end
    end)
end

function SilentAim_Disable()
    silentAimEnabled = false
    if silentAimConnection then silentAimConnection:Disconnect(); silentAimConnection = nil end
    for _, p in pairs(Players:GetPlayers()) do
        safeCall(function()
            if p.Character then
                for _, v in pairs(p.Character:GetDescendants()) do
                    if v:IsA("BasePart") and v.Name == "SantesHitbox" then v:Destroy() end
                end
            end
        end)
    end
end

function SilentAim_SetFOV(v) silentAimFOV = math.clamp(v, 50, 500) end

-- MELEE AURA
local meleeAuraEnabled = false
local meleeAuraConnection = nil

function MeleeAura_Enable()
    if meleeAuraEnabled then return end
    meleeAuraEnabled = true
    local evs = ReplicatedStorage:FindFirstChild("Events")
    if not evs then return end
    local r1 = evs:FindFirstChild("XMHH.2")
    local r2 = evs:FindFirstChild("XMHH2.2")
    if not r1 or not r2 then return end
    meleeAuraConnection = RunService.Heartbeat:Connect(function()
        if not meleeAuraEnabled then return end
        local char = getCharacter()
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local target = nil
        local cd = 6
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local th = p.Character:FindFirstChild("HumanoidRootPart")
                local tu = p.Character:FindFirstChildOfClass("Humanoid")
                if th and tu and tu.Health > 15 then
                    local d = (hrp.Position - th.Position).Magnitude
                    if d < cd then cd = d; target = p end
                end
            end
        end
        if not target then return end
        local tc = target.Character
        local tp = tc:FindFirstChild("Head") or tc:FindFirstChild("HumanoidRootPart")
        if not tp then return end
        local tool = char:FindFirstChildOfClass("Tool")
        local ft = tool or char:FindFirstChild("Right Arm") or hrp
        local result = r1:InvokeServer("\240\159\141\158", tick(), ft, "43TRFWX", "Normal", tick(), true)
        if result then
            local h = (tool and (tool:FindFirstChild("WeaponHandle") or tool:FindFirstChild("Handle"))) or char:FindFirstChild("Right Arm")
            if h then r2:FireServer("\240\159\141\158", tick(), ft, "2389ZFX34", result, false, h, tp, tc, hrp.Position, tp.Position) end
        end
        task.wait(0.08)
    end)
end

function MeleeAura_Disable()
    meleeAuraEnabled = false
    if meleeAuraConnection then meleeAuraConnection:Disconnect(); meleeAuraConnection = nil end
end

-- NO RECOIL
local noRecoilEnabled = false
local noRecoilTask = nil

function NoRecoil_Enable()
    if noRecoilEnabled then return end
    noRecoilEnabled = true
    noRecoilTask = task.spawn(function()
        while noRecoilEnabled do
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
            task.wait(1)
        end
    end)
end

function NoRecoil_Disable()
    noRecoilEnabled = false
    if noRecoilTask then task.cancel(noRecoilTask); noRecoilTask = nil end
end

-- FOV
local fovEnabled = false
local fovValue = 80
local fovOrig = 70

function FOV_Enable()
    fovEnabled = true
    if Workspace.CurrentCamera then fovOrig = Workspace.CurrentCamera.FieldOfView end
end

function FOV_Disable()
    fovEnabled = false
    if Workspace.CurrentCamera then Workspace.CurrentCamera.FieldOfView = fovOrig end
end

RunService.RenderStepped:Connect(function()
    if fovEnabled and Workspace.CurrentCamera then
        Workspace.CurrentCamera.FieldOfView = fovValue
    end
end)

-- FULLBRIGHT
local fullbrightEnabled = false
local fullbrightConnection = nil
local origLight = {}

function FullBright_Enable()
    if fullbrightEnabled then return end
    fullbrightEnabled = true
    origLight = {
        Brightness = Lighting.Brightness,
        ClockTime = Lighting.ClockTime,
        Ambient = Lighting.Ambient,
        OutdoorAmbient = Lighting.OutdoorAmbient,
        FogStart = Lighting.FogStart,
        FogEnd = Lighting.FogEnd,
        GlobalShadows = Lighting.GlobalShadows
    }
    fullbrightConnection = RunService.RenderStepped:Connect(function()
        Lighting.Brightness = 5
        Lighting.ClockTime = 14
        Lighting.Ambient = Color3.new(1, 1, 1)
        Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
        Lighting.FogStart = 100000
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
    end)
end

function FullBright_Disable()
    fullbrightEnabled = false
    if fullbrightConnection then fullbrightConnection:Disconnect(); fullbrightConnection = nil end
    Lighting.Brightness = origLight.Brightness or 1
    Lighting.ClockTime = origLight.ClockTime or 14
    Lighting.Ambient = origLight.Ambient or Color3.new(0, 0, 0)
    Lighting.OutdoorAmbient = origLight.OutdoorAmbient or Color3.new(0, 0, 0)
    Lighting.FogStart = origLight.FogStart or 0
    Lighting.FogEnd = origLight.FogEnd or 100000
    Lighting.GlobalShadows = origLight.GlobalShadows or true
end

-- NO FOG
local noFogEnabled = false
local noFogConnection = nil

function NoFog_Enable()
    if noFogEnabled then return end
    noFogEnabled = true
    noFogConnection = RunService.RenderStepped:Connect(function()
        if noFogEnabled then
            Lighting.FogStart = 100000
            Lighting.FogEnd = 100000
        end
    end)
end

function NoFog_Disable()
    noFogEnabled = false
    if noFogConnection then noFogConnection:Disconnect(); noFogConnection = nil end
end

-- TELEPORT WAYPOINT
local teleportWaypointEnabled = false
local teleportWaypointConnection = nil

function TeleportWaypoint_Enable()
    if teleportWaypointEnabled then return end
    teleportWaypointEnabled = true
    teleportWaypointConnection = RunService.Heartbeat:Connect(function()
        if teleportWaypointEnabled then
            local char = getCharacter()
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local wp = Workspace:FindFirstChild("Waypoint")
                    if wp then
                        local pos = wp:FindFirstChild("Position") or wp:FindFirstChild("CFrame")
                        if pos then
                            local p = pos:IsA("CFrameValue") and pos.Value.Position or pos.Value
                            hrp.CFrame = CFrame.new(p + Vector3.new(0, 3, 0))
                        end
                    end
                end
            end
        end
    end)
end

function TeleportWaypoint_Disable()
    teleportWaypointEnabled = false
    if teleportWaypointConnection then teleportWaypointConnection:Disconnect(); teleportWaypointConnection = nil end
end

-- RANDOM TP
local randomTPEnabled = false
local randomTPConnection = nil

function RandomTP_Enable()
    if randomTPEnabled then return end
    randomTPEnabled = true
    randomTPConnection = RunService.Heartbeat:Connect(function()
        if randomTPEnabled then
            local char = getCharacter()
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.CFrame = CFrame.new(Vector3.new(math.random(-500, 500), 100, math.random(-500, 500)))
                end
            end
        end
    end)
end

function RandomTP_Disable()
    randomTPEnabled = false
    if randomTPConnection then randomTPConnection:Disconnect(); randomTPConnection = nil end
end

-- TELEPORT ATM
local teleportATMEnabled = false
local teleportATMConnection = nil

function TeleportATM_Enable()
    if teleportATMEnabled then return end
    teleportATMEnabled = true
    teleportATMConnection = RunService.Heartbeat:Connect(function()
        if teleportATMEnabled then
            local char = getCharacter()
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    for _, v in pairs(Workspace:GetDescendants()) do
                        if v:IsA("BasePart") and (string.find(v.Name, "ATM") or string.find(v.Name, "Atm")) then
                            hrp.CFrame = v.CFrame + Vector3.new(0, 3, 0)
                            break
                        end
                    end
                end
            end
        end
    end)
end

function TeleportATM_Disable()
    teleportATMEnabled = false
    if teleportATMConnection then teleportATMConnection:Disconnect(); teleportATMConnection = nil end
end

-- BRING PLAYER
local bringEnabled = false
local bringConnection = nil

function Bring_Enable()
    if bringEnabled then return end
    bringEnabled = true
    bringConnection = RunService.Heartbeat:Connect(function()
        if bringEnabled then
            local char = getCharacter()
            if char then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    for _, p in pairs(Players:GetPlayers()) do
                        if p ~= LocalPlayer and p.Character then
                            local th = p.Character:FindFirstChild("HumanoidRootPart")
                            if th then th.CFrame = hrp.CFrame + Vector3.new(0, 0, 3) end
                        end
                    end
                end
            end
        end
    end)
end

function Bring_Disable()
    bringEnabled = false
    if bringConnection then bringConnection:Disconnect(); bringConnection = nil end
end

-- SPECTATE
local spectateEnabled = false
local spectateTarget = nil

function Spectate_Enable()
    if spectateEnabled then return end
    spectateEnabled = true
    local cam = Workspace.CurrentCamera
    if cam then
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local head = p.Character:FindFirstChild("Head")
                if head then
                    spectateTarget = p
                    cam.CameraSubject = head
                    break
                end
            end
        end
    end
end

function Spectate_Disable()
    spectateEnabled = false
    local cam = Workspace.CurrentCamera
    if cam then
        local char = getCharacter()
        if char then
            local head = char:FindFirstChild("Head")
            if head then cam.CameraSubject = head end
        end
    end
    spectateTarget = nil
end

-- ANTI-AFK
local antiAFKEnabled = false
local antiAFKConnection = nil

function AntiAFK_Enable()
    if antiAFKEnabled then return end
    antiAFKEnabled = true
    antiAFKConnection = RunService.Heartbeat:Connect(function()
        if antiAFKEnabled then
            safeCall(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        end
    end)
end

function AntiAFK_Disable()
    antiAFKEnabled = false
    if antiAFKConnection then antiAFKConnection:Disconnect(); antiAFKConnection = nil end
end

-- CHAT SPAM
local chatSpamEnabled = false
local chatSpamTask = nil

function ChatSpam_Enable()
    if chatSpamEnabled then return end
    chatSpamEnabled = true
    chatSpamTask = task.spawn(function()
        local msgs = {"SANTES HUB v3.2!", "Santes Hub - En iyi hile!", "Santes Hub ile kazan!"}
        local idx = 1
        while chatSpamEnabled do
            safeCall(function()
                local ch = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")
                ch:SendAsync(msgs[idx])
                idx = idx % #msgs + 1
            end)
            task.wait(3)
        end
    end)
end

function ChatSpam_Disable()
    chatSpamEnabled = false
    if chatSpamTask then task.cancel(chatSpamTask); chatSpamTask = nil end
end

-- ADMIN CHECK
local adminCheckEnabled = false
local adminCheckConnection = nil
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

local function isStaff(p)
    for _, uid in pairs(staffUsers) do
        if p.UserId == uid then return true end
    end
    return false
end

function AdminCheck_Enable()
    if adminCheckEnabled then return end
    adminCheckEnabled = true
    local function check(p)
        if p == LocalPlayer then return end
        if isStaff(p) then LocalPlayer:Kick("SANTES: Admin - " .. p.Name) end
    end
    for _, p in pairs(Players:GetPlayers()) do check(p) end
    adminCheckConnection = Players.PlayerAdded:Connect(check)
end

function AdminCheck_Disable()
    adminCheckEnabled = false
    if adminCheckConnection then adminCheckConnection:Disconnect(); adminCheckConnection = nil end
end

-- NO FAIL LOCKPICK
local noFailLPEnabled = false
local noFailLPConnection = nil

function NoFailLP_Enable()
    if noFailLPEnabled then return end
    noFailLPEnabled = true
    noFailLPConnection = PlayerGui.ChildAdded:Connect(function(item)
        if item.Name == "LockpickGUI" then
            task.wait(0.1)
            safeCall(function()
                local frames = item.MF.LP_Frame.Frames
                for _, n in pairs({"B1", "B2", "B3"}) do
                    local bar = frames:FindFirstChild(n)
                    if bar and bar:FindFirstChild("Bar") then
                        local sc = bar.Bar:FindFirstChild("UIScale")
                        if sc then sc.Scale = 10 end
                    end
                end
            end)
        end
    end)
end

function NoFailLP_Disable()
    noFailLPEnabled = false
    if noFailLPConnection then noFailLPConnection:Disconnect(); noFailLPConnection = nil end
end

-- AUTO LOCKPICK
local autoLockpickEnabled = false
local autoLockpickConnection = nil
local lockpickCD = false
local lastSafe = nil

function AutoLockpick_Enable()
    if autoLockpickEnabled then return end
    autoLockpickEnabled = true
    autoLockpickConnection = RunService.Heartbeat:Connect(function()
        if not autoLockpickEnabled or lockpickCD then return end
        local char = getCharacter()
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local tool = char:FindFirstChild("Lockpick")
        if not tool then
            local bp = LocalPlayer:FindFirstChild("Backpack")
            if bp then
                for _, item in pairs(bp:GetChildren()) do
                    if item.Name == "Lockpick" then tool = item; break end
                end
            end
        end
        if not tool then return end
        if not char:FindFirstChild(tool.Name) then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then safeCall(function() hum:EquipTool(tool) end) end
            return
        end
        local folder = Workspace.Map and Workspace.Map:FindFirstChild("BredMakurz") or Workspace:FindFirstChild("BredMakurz")
        if not folder then return end
        local nearest = nil
        local nd = 3
        local np = nil
        for _, obj in pairs(folder:GetChildren()) do
            if obj ~= lastSafe and (string.find(obj.Name, "Safe") or string.find(obj.Name, "Register")) then
                local p = obj:FindFirstChild("MainPart") or obj.PrimaryPart or obj:FindFirstChildOfClass("BasePart")
                if p then
                    local d = (hrp.Position - p.Position).Magnitude
                    if d < nd then
                        local vals = obj:FindFirstChild("Values")
                        if vals then
                            local broken = vals:FindFirstChild("Broken")
                            if broken and broken:IsA("BoolValue") and not broken.Value then
                                nd = d; nearest = obj; np = p
                            end
                        end
                    end
                end
            end
        end
        if not nearest then return end
        lockpickCD = true
        lastSafe = nearest
        local evs = ReplicatedStorage:FindFirstChild("Events")
        if evs and np then
            local r1 = evs:FindFirstChild("XMHH.2")
            local r2 = evs:FindFirstChild("XMHH2.2")
            if r1 and r2 then
                local ft = char:FindFirstChildOfClass("Tool")
                if ft then
                    local res = r1:InvokeServer("\240\159\141\158", tick(), ft, "DZDRRRKI", nearest, "Register")
                    if res then
                        r2:FireServer("\240\159\141\158", tick(), ft, "2389ZFX34", res, false,
                            char:FindFirstChild("Right Arm") or hrp, np, nearest, np.Position, np.Position)
                    end
                end
            end
            local lpEv = evs:FindFirstChild("LockpickStart") or evs:FindFirstChild("StartLockpick")
            if lpEv then safeCall(function() lpEv:FireServer(nearest, np) end) end
        end
        task.wait(0.05)
        local lpGUI = PlayerGui:FindFirstChild("LockpickGUI")
        if lpGUI then
            for _ = 1, 30 do
                safeCall(function()
                    local frames = lpGUI.MF.LP_Frame.Frames
                    for _, n in pairs({"B1", "B2", "B3"}) do
                        local bar = frames:FindFirstChild(n)
                        if bar and bar:FindFirstChild("Bar") then
                            local sc = bar.Bar:FindFirstChild("UIScale")
                            if sc then sc.Scale = 20 end
                        end
                    end
                end)
                if not lpGUI.Parent then break end
                task.wait(0.02)
            end
        end
        task.wait(0.3)
        lockpickCD = false
    end)
end

function AutoLockpick_Disable()
    autoLockpickEnabled = false
    lockpickCD = false
    lastSafe = nil
    if autoLockpickConnection then autoLockpickConnection:Disconnect(); autoLockpickConnection = nil end
end

-- AUTO PICKUP
local autoPickupEnabled = false
local autoPickupConnection = nil
local pickupCD = false

function AutoPickup_Enable()
    if autoPickupEnabled then return end
    autoPickupEnabled = true
    autoPickupConnection = RunService.RenderStepped:Connect(function()
        if not autoPickupEnabled or pickupCD then return end
        local char = getCharacter()
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local folder = Workspace.Filter and Workspace.Filter:FindFirstChild("SpawnedBread") or Workspace:FindFirstChild("SpawnedBread")
        if not folder then return end
        local remote = ReplicatedStorage.Events and ReplicatedStorage.Events:FindFirstChild("CZDPZUS")
        if not remote then return end
        for _, bread in pairs(folder:GetChildren()) do
            if bread:IsA("BasePart") and (hrp.Position - bread.Position).Magnitude < 5 then
                pickupCD = true
                safeCall(function() remote:FireServer(bread) end)
                task.wait(1)
                pickupCD = false
                break
            end
        end
    end)
end

function AutoPickup_Disable()
    autoPickupEnabled = false
    pickupCD = false
    if autoPickupConnection then autoPickupConnection:Disconnect(); autoPickupConnection = nil end
end

-- UNLOCK DOORS
local unlockDoorsEnabled = false
local unlockDoorsConnection = nil

function UnlockDoors_Enable()
    if unlockDoorsEnabled then return end
    unlockDoorsEnabled = true
    unlockDoorsConnection = RunService.Heartbeat:Connect(function()
        if not unlockDoorsEnabled then return end
        local char = getCharacter()
        if not char then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local doors = Workspace.Map and Workspace.Map:FindFirstChild("Doors")
        if not doors then return end
        for _, door in pairs(doors:GetChildren()) do
            local db = door:FindFirstChild("DoorBase")
            if db and (hrp.Position - db.Position).Magnitude <= 6 then
                local vals = door:FindFirstChild("Values")
                local evs = door:FindFirstChild("Events")
                if vals and evs then
                    local tog = evs:FindFirstChild("Toggle")
                    if tog then
                        local open = vals:FindFirstChild("Open")
                        local knob = door:FindFirstChild("Knob2") or door:FindFirstChild("Knob")
                        if open and knob and not open.Value then safeCall(function() tog:FireServer("Open", knob) end) end
                        local locked = vals:FindFirstChild("Locked")
                        local lock = door:FindFirstChild("Lock")
                        if locked and lock and locked.Value then safeCall(function() tog:FireServer("Unlock", lock) end) end
                    end
                end
            end
        end
    end)
end

function UnlockDoors_Disable()
    unlockDoorsEnabled = false
    if unlockDoorsConnection then unlockDoorsConnection:Disconnect(); unlockDoorsConnection = nil end
end

-- AUTO FARM
local autoFarmEnabled = false
local autoFarmCoroutine = nil
local farmIgnored = {}

local function farmTP(pos)
    local char = getCharacter()
    if not char then return false end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    for i = 1, 4 do
        hrp.CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))
        task.wait(0.5)
        if hrp and hrp.Parent and (hrp.Position - pos).Magnitude < 5 then return true end
        task.wait(0.5)
    end
    return false
end

local function findDealer()
    local shops = Workspace.Map and Workspace.Map:FindFirstChild("Shopz")
    if not shops then return nil end
    local char = getCharacter()
    if not char then return nil end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    local nearest, best = nil, math.huge
    for _, shop in pairs(shops:GetChildren()) do
        local main = shop:FindFirstChild("MainPart")
        local stocks = shop:FindFirstChild("CurrentStocks")
        if main and stocks then
            local cs = stocks:FindFirstChild("Crowbar")
            if cs and cs.Value > 0 then
                local d = (main.Position - hrp.Position).Magnitude
                if d < best then best = d; nearest = shop end
            end
        end
    end
    return nearest
end

local function findTarget()
    local folder = Workspace.Map and Workspace.Map:FindFirstChild("BredMakurz") or Workspace:FindFirstChild("BredMakurz")
    if not folder then return nil end
    local char = getCharacter()
    if not char then return nil end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    local nearest, best = nil, math.huge
    for _, obj in pairs(folder:GetChildren()) do
        if (string.find(obj.Name, "Safe") or string.find(obj.Name, "Register")) and not table.find(farmIgnored, obj) then
            local vals = obj:FindFirstChild("Values")
            if vals then
                local broken = vals:FindFirstChild("Broken")
                if broken and broken:IsA("BoolValue") and not broken.Value then
                    local p = obj.PrimaryPart or obj:FindFirstChild("MainPart") or obj:FindFirstChildOfClass("BasePart")
                    if p then
                        local d = (p.Position - hrp.Position).Magnitude
                        if d < best then best = d; nearest = obj end
                    end
                end
            end
        end
    end
    return nearest
end

local function hasTool(n)
    local char = getCharacter()
    if char and char:FindFirstChild(n) then return true end
    local bp = LocalPlayer:FindFirstChild("Backpack")
    return bp and bp:FindFirstChild(n) ~= nil
end

local function equipTool(n)
    local char = getCharacter()
    if not char then return false end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return false end
    local t = char:FindFirstChild(n) or LocalPlayer.Backpack:FindFirstChild(n)
    if t then safeCall(function() hum:EquipTool(t) end); task.wait(0.5); return true end
    return false
end

local function openSafe(safe)
    if not hasTool("Crowbar") then return end
    if not equipTool("Crowbar") then return end
    local evs = ReplicatedStorage:FindFirstChild("Events")
    if not evs then return end
    local r1 = evs:FindFirstChild("XMHH.2")
    local r2 = evs:FindFirstChild("XMHH2.2")
    local sp = safe:FindFirstChild("MainPart")
    if not r1 or not r2 or not sp then return end
    local eq = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Crowbar")
    if not eq then return end
    local st = tick()
    while safe and safe.Parent and safe.Values and safe.Values:FindFirstChild("Broken") and not safe.Values.Broken.Value and (tick() - st < 20) do
        local char = getCharacter()
        if not char then break end
        local res = r1:InvokeServer("\240\159\141\158", tick(), eq, "DZDRRRKI", safe, "Register")
        if res then r2:FireServer("\240\159\141\158", tick(), eq, "2389ZFX34", res, false, char["Right Arm"], sp, safe, sp.Position, sp.Position) end
        task.wait(0.2)
    end
    task.wait(8)
end

local function buyCrowbar(dealer)
    if not dealer then return false end
    local main = dealer:FindFirstChild("MainPart")
    if not main then return false end
    if not farmTP(main.Position) then return false end
    task.wait(1)
    local evs = ReplicatedStorage:FindFirstChild("Events")
    if not evs then return false end
    local be = evs:FindFirstChild("BYZERSPROTEC")
    local se = evs:FindFirstChild("SSHPRMTE1")
    if not be or not se then return false end
    be:FireServer(true, "shop", main, "IllegalStore")
    task.wait(1)
    se:InvokeServer("IllegalStore", "Melees", "Crowbar", main, nil, true)
    task.wait(2)
    be:FireServer(false)
    return hasTool("Crowbar")
end

local function farmLoop()
    while autoFarmEnabled do
        task.wait(1)
        local char = getCharacter()
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if not char or not hum or hum.Health <= 0 then
            local de = ReplicatedStorage.Events and ReplicatedStorage.Events:FindFirstChild("DeathRespawn")
            if de then safeCall(function() de:InvokeServer("KMG4R904") end) end
            task.wait(3)
            farmIgnored = {}
            continue
        end
        if not hasTool("Crowbar") then
            local d = findDealer()
            if d then buyCrowbar(d) else task.wait(5) end
            continue
        end
        local t = findTarget()
        if t then
            local mp = t:FindFirstChild("MainPart") or t.PrimaryPart
            if mp then
                if farmTP(mp.Position) then task.wait(1); openSafe(t)
                else table.insert(farmIgnored, t); task.wait(0.5) end
            end
        else farmIgnored = {}; task.wait(5) end
    end
end

function AutoFarm_Enable()
    if autoFarmEnabled then return end
    autoFarmEnabled = true
    farmIgnored = {}
    if autoFarmCoroutine then task.cancel(autoFarmCoroutine); autoFarmCoroutine = nil end
    AutoPickup_Enable()
    Noclip_Enable()
    autoFarmCoroutine = task.spawn(farmLoop)
    LocalPlayer.CharacterAdded:Connect(function()
        if autoFarmEnabled then task.wait(2); AutoPickup_Enable(); Noclip_Enable() end
    end)
end

function AutoFarm_Disable()
    autoFarmEnabled = false
    if autoFarmCoroutine then task.cancel(autoFarmCoroutine); autoFarmCoroutine = nil end
    farmIgnored = {}
    AutoPickup_Disable()
end

-- ==================== ANA GUI OLUŞTURUCU ====================
function CreateMainGUI()
    for _, name in pairs({"SantesHubScreenGui", "SantesHub_Main", "SantesHub"}) do
        safeCall(function()
            local gui = PlayerGui:FindFirstChild(name)
            if gui then gui:Destroy() end
        end)
        safeCall(function()
            local gui = CoreGui:FindFirstChild(name)
            if gui then gui:Destroy() end
        end)
    end

    mainGui = Instance.new("ScreenGui")
    mainGui.Name = "SantesHub_Main"
    mainGui.ResetOnSpawn = false
    mainGui.Parent = PlayerGui

    local shadowFrame = Instance.new("Frame")
    shadowFrame.Size = UDim2.new(0, 504, 0, 384)
    shadowFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    shadowFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    shadowFrame.BackgroundColor3 = C.shadow
    shadowFrame.BackgroundTransparency = 0.5
    shadowFrame.BorderSizePixel = 0
    shadowFrame.Parent = mainGui
    Instance.new("UICorner", shadowFrame).CornerRadius = UDim.new(0, 12)

    local win = Instance.new("Frame")
    win.Size = UDim2.new(0, 500, 0, 380)
    win.Position = UDim2.new(0.5, 0, 0.5, 0)
    win.AnchorPoint = Vector2.new(0.5, 0.5)
    win.BackgroundColor3 = C.bg
    win.BorderSizePixel = 0
    win.Active = true
    win.Draggable = true
    win.Parent = mainGui
    Instance.new("UICorner", win).CornerRadius = UDim.new(0, 10)
    local ws = Instance.new("UIStroke", win)
    ws.Color = C.accent
    ws.Thickness = 1
    ws.Transparency = 0.6

    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 45)
    titleBar.BackgroundColor3 = C.panel
    titleBar.BorderSizePixel = 0
    titleBar.Parent = win
    Instance.new("UICorner", titleBar).CornerRadius = UDim.new(0, 10)

    local logoText = Instance.new("TextLabel")
    logoText.Size = UDim2.new(0.5, 0, 1, 0)
    logoText.Position = UDim2.new(0, 14, 0, 0)
    logoText.BackgroundTransparency = 1
    logoText.Text = "SANTES HUB"
    logoText.Font = Enum.Font.GothamBold
    logoText.TextSize = 18
    logoText.TextColor3 = C.accent
    logoText.TextXAlignment = Enum.TextXAlignment.Left
    logoText.Parent = titleBar

    local versionTag = Instance.new("TextLabel")
    versionTag.Size = UDim2.new(0.3, 0, 1, 0)
    versionTag.Position = UDim2.new(0, 160, 0, 0)
    versionTag.BackgroundTransparency = 1
    versionTag.Text = "v3.0 PREMIUM"
    versionTag.Font = Enum.Font.GothamBold
    versionTag.TextSize = 10
    versionTag.TextColor3 = C.text2
    versionTag.TextXAlignment = Enum.TextXAlignment.Left
    versionTag.Parent = titleBar

    local userNameLabel = Instance.new("TextLabel")
    userNameLabel.Size = UDim2.new(0.4, 0, 1, 0)
    userNameLabel.Position = UDim2.new(0.6, 0, 0, 0)
    userNameLabel.BackgroundTransparency = 1
    userNameLabel.Text = LocalPlayer.DisplayName
    userNameLabel.Font = Enum.Font.Gotham
    userNameLabel.TextSize = 12
    userNameLabel.TextColor3 = C.text2
    userNameLabel.TextXAlignment = Enum.TextXAlignment.Right
    userNameLabel.Parent = titleBar

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -36, 0, 7.5)
    closeBtn.Text = "✕"
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 14
    closeBtn.TextColor3 = C.text
    closeBtn.BackgroundColor3 = C.accent
    closeBtn.BorderSizePixel = 0
    closeBtn.AutoButtonColor = false
    closeBtn.Parent = titleBar
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)

    local minBtn = Instance.new("TextButton")
    minBtn.Size = UDim2.new(0, 30, 0, 30)
    minBtn.Position = UDim2.new(1, -70, 0, 7.5)
    minBtn.Text = "−"
    minBtn.Font = Enum.Font.GothamBold
    minBtn.TextSize = 18
    minBtn.TextColor3 = C.text
    minBtn.BackgroundColor3 = C.surfaceUp
    minBtn.BorderSizePixel = 0
    minBtn.AutoButtonColor = false
    minBtn.Parent = titleBar
    Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 6)

    local sidebar = Instance.new("Frame")
    sidebar.Size = UDim2.new(0, 120, 1, -45)
    sidebar.Position = UDim2.new(0, 0, 0, 45)
    sidebar.BackgroundColor3 = C.panel
    sidebar.BorderSizePixel = 0
    sidebar.Parent = win

    local sidebarLayout = Instance.new("UIListLayout")
    sidebarLayout.Padding = UDim.new(0, 3)
    sidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
    sidebarLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    sidebarLayout.Parent = sidebar

    local sidebarPadding = Instance.new("UIPadding")
    sidebarPadding.PaddingTop = UDim.new(0, 8)
    sidebarPadding.PaddingLeft = UDim.new(0, 4)
    sidebarPadding.PaddingRight = UDim.new(0, 4)
    sidebarPadding.Parent = sidebar

    local sideLine = Instance.new("Frame")
    sideLine.Size = UDim2.new(0, 1, 1, -45)
    sideLine.Position = UDim2.new(0, 120, 0, 45)
    sideLine.BackgroundColor3 = C.border
    sideLine.BorderSizePixel = 0
    sideLine.Parent = win

    local content = Instance.new("ScrollingFrame")
    content.Size = UDim2.new(1, -121, 1, -45)
    content.Position = UDim2.new(0, 121, 0, 45)
    content.BackgroundColor3 = C.bg
    content.BorderSizePixel = 0
    content.ScrollBarThickness = 3
    content.ScrollBarImageColor3 = C.accent
    content.CanvasSize = UDim2.new(0, 0, 0, 0)
    content.Parent = win

    local contentPadding = Instance.new("UIPadding")
    contentPadding.PaddingTop = UDim.new(0, 10)
    contentPadding.PaddingLeft = UDim.new(0, 10)
    contentPadding.PaddingRight = UDim.new(0, 10)
    contentPadding.PaddingBottom = UDim.new(0, 10)
    contentPadding.Parent = content

    local contentLayout = Instance.new("UIListLayout")
    contentLayout.Padding = UDim.new(0, 5)
    contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    contentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    contentLayout.Parent = content

    contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        content.CanvasSize = UDim2.new(0, 0, 0, contentLayout.AbsoluteContentSize.Y + 20)
    end)

    local mini = Instance.new("Frame")
    mini.Size = UDim2.new(0, 55, 0, 55)
    mini.Position = UDim2.new(0.02, 0, 0.02, 0)
    mini.BackgroundColor3 = C.bg
    mini.BorderSizePixel = 0
    mini.Visible = false
    mini.Active = true
    mini.Draggable = true
    mini.ZIndex = 999
    mini.Parent = mainGui
    Instance.new("UICorner", mini).CornerRadius = UDim.new(0, 8)
    local ms2 = Instance.new("UIStroke", mini)
    ms2.Color = C.accent
    ms2.Thickness = 2

    local miniLogo = Instance.new("TextLabel")
    miniLogo.Size = UDim2.new(1, 0, 0.5, 0)
    miniLogo.Position = UDim2.new(0, 0, 0.05, 0)
    miniLogo.BackgroundTransparency = 1
    miniLogo.Text = "SANTES"
    miniLogo.Font = Enum.Font.GothamBold
    miniLogo.TextSize = 12
    miniLogo.TextColor3 = C.accent
    miniLogo.TextXAlignment = Enum.TextXAlignment.Center
    miniLogo.Parent = mini

    local miniSub = Instance.new("TextLabel")
    miniSub.Size = UDim2.new(1, 0, 0.4, 0)
    miniSub.Position = UDim2.new(0, 0, 0.55, 0)
    miniSub.BackgroundTransparency = 1
    miniSub.Text = "HUB"
    miniSub.Font = Enum.Font.GothamBold
    miniSub.TextSize = 11
    miniSub.TextColor3 = C.text
    miniSub.TextXAlignment = Enum.TextXAlignment.Center
    miniSub.Parent = mini

    minBtn.MouseButton1Click:Connect(function()
        win.Visible = false
        mini.Visible = true
    end)

    mini.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            mini.Visible = false
            win.Visible = true
        end
    end)

    closeBtn.MouseButton1Click:Connect(function()
        safeCall(function()
            if flyEnabled then Fly_Disable() end
            if noclipEnabled then Noclip_Disable() end
            if fullbrightEnabled then FullBright_Disable() end
            if espEnabled then ESP_Disable() end
            if invisEnabled then Invis_Disable() end
            if silentAimEnabled then SilentAim_Disable() end
            if meleeAuraEnabled then MeleeAura_Disable() end
            if autoFarmEnabled then AutoFarm_Disable() end
            if autoPickupEnabled then AutoPickup_Disable() end
            if noFailLPEnabled then NoFailLP_Disable() end
            if autoLockpickEnabled then AutoLockpick_Disable() end
            if unlockDoorsEnabled then UnlockDoors_Disable() end
            if adminCheckEnabled then AdminCheck_Disable() end
            if safeESPEnabled then SafeESP_Disable() end
            if noRecoilEnabled then NoRecoil_Disable() end
            if infStaminaEnabled then InfiniteStamina_Disable() end
            if fovEnabled then FOV_Disable() end
            if highJumpEnabled then HighJump_Disable() end
            if lowGravityEnabled then LowGravity_Disable() end
            if infiniteJumpEnabled then InfiniteJump_Disable() end
            if undergroundEnabled then Underground_Disable() end
            if godModeEnabled then GodMode_Disable() end
            if noRagdollEnabled then NoRagdoll_Disable() end
            if teleportWaypointEnabled then TeleportWaypoint_Disable() end
            if randomTPEnabled then RandomTP_Disable() end
            if antiAFKEnabled then AntiAFK_Disable() end
            if noFogEnabled then NoFog_Disable() end
            if chatSpamEnabled then ChatSpam_Disable() end
            if bringEnabled then Bring_Disable() end
            if spectateEnabled then Spectate_Disable() end
            if teleportATMEnabled then TeleportATM_Disable() end
        end)
        mainGui:Destroy()
    end)

    UserInputService.InputBegan:Connect(function(input, g)
        if not g and input.KeyCode == Enum.KeyCode.RightShift then
            if mini.Visible then mini.Visible = false; win.Visible = true
            else win.Visible = not win.Visible end
        end
    end)

    UserInputService.InputBegan:Connect(function(input, g)
        if not g and input.KeyCode == Enum.KeyCode.Escape then
            if win.Visible then win.Visible = false end
        end
    end)

    local function makeToggle(name, canToggle, isOn, onEnable, onDisable)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 0, 40)
        frame.BackgroundColor3 = C.card
        frame.BorderSizePixel = 0
        frame.Parent = content
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)
        frame.MouseEnter:Connect(function()
            TweenService:Create(frame, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(22, 22, 32)}):Play()
        end)
        frame.MouseLeave:Connect(function()
            TweenService:Create(frame, TweenInfo.new(0.15), {BackgroundColor3 = C.card}):Play()
        end)
        local layout = Instance.new("UIListLayout")
        layout.FillDirection = Enum.FillDirection.Horizontal
        layout.VerticalAlignment = Enum.VerticalAlignment.Center
        layout.Padding = UDim.new(0, 10)
        layout.Parent = frame
        local padding = Instance.new("UIPadding")
        padding.PaddingLeft = UDim.new(0, 12)
        padding.PaddingRight = UDim.new(0, 12)
        padding.Parent = frame
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0.55, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.Text = name
        label.Font = Enum.Font.GothamSemibold
        label.TextSize = 12
        label.TextColor3 = C.text2
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.Parent = frame
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, 66, 0, 28)
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 11
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.BackgroundColor3 = C.off
        btn.BorderSizePixel = 0
        btn.AutoButtonColor = false
        btn.Parent = frame
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 14)
        local function update()
            local state = false
            if isOn then
                local s, r = safeCall(isOn)
                if s then state = r end
            end
            if not canToggle then
                btn.Text = "RUN"
                btn.BackgroundColor3 = Color3.fromRGB(70, 120, 220)
            elseif state then
                btn.Text = "ON"
                btn.BackgroundColor3 = C.on
            else
                btn.Text = "OFF"
                btn.BackgroundColor3 = C.off
            end
        end
        update()
        btn.MouseButton1Click:Connect(function()
            if not canToggle then
                safeCall(onEnable)
                btn.Text = "OK"
                btn.BackgroundColor3 = C.success
                btn.Active = false
                return
            end
            local state = false
            if isOn then
                local s, r = safeCall(isOn)
                if s then state = r end
            end
            if state then safeCall(onDisable) else safeCall(onEnable) end
            update()
        end)
        return frame
    end

    local function makeHeader(text)
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(1, 0, 0, 28)
        frame.BackgroundTransparency = 1
        frame.Parent = content
        local line = Instance.new("Frame")
        line.Size = UDim2.new(1, -60, 0, 1)
        line.Position = UDim2.new(0, 0, 0.5, 0)
        line.BackgroundColor3 = C.border
        line.BorderSizePixel = 0
        line.Parent = frame
        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(0.8, 0, 1, 0)
        label.Position = UDim2.new(0.1, 0, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = text
        label.Font = Enum.Font.GothamBold
        label.TextSize = 11
        label.TextColor3 = C.accent
        label.TextXAlignment = Enum.TextXAlignment.Center
        label.Parent = frame
        return frame
    end

    local activeTab = nil
    local tabButtons = {}

    local function createTabButton(name, icon)
        local btn = Instance.new("TextButton")
        btn.Name = name
        btn.Size = UDim2.new(1, -8, 0, 34)
        btn.BackgroundTransparency = 1
        btn.BorderSizePixel = 0
        btn.Text = ""
        btn.AutoButtonColor = false
        btn.Parent = sidebar
        local bg = Instance.new("Frame")
        bg.Size = UDim2.new(1, 0, 1, 0)
        bg.BackgroundColor3 = C.card
        bg.BackgroundTransparency = 1
        bg.BorderSizePixel = 0
        bg.Parent = btn
        Instance.new("UICorner", bg).CornerRadius = UDim.new(0, 6)
        btn.MouseEnter:Connect(function()
            if activeTab ~= name then
                TweenService:Create(bg, TweenInfo.new(0.15), {BackgroundTransparency = 0.5}):Play()
            end
        end)
        btn.MouseLeave:Connect(function()
            if activeTab ~= name then
                TweenService:Create(bg, TweenInfo.new(0.15), {BackgroundTransparency = 1}):Play()
            end
        end)
        local iconLabel = Instance.new("TextLabel")
        iconLabel.Size = UDim2.new(0, 24, 1, 0)
        iconLabel.Position = UDim2.new(0, 6, 0, 0)
        iconLabel.BackgroundTransparency = 1
        iconLabel.Text = icon
        iconLabel.Font = Enum.Font.GothamBold
        iconLabel.TextSize = 14
        iconLabel.TextColor3 = C.text2
        iconLabel.Parent = btn
        local nameLabel = Instance.new("TextLabel")
        nameLabel.Size = UDim2.new(1, -36, 1, 0)
        nameLabel.Position = UDim2.new(0, 32, 0, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = name
        nameLabel.Font = Enum.Font.GothamSemibold
        nameLabel.TextSize = 10
        nameLabel.TextColor3 = C.text2
        nameLabel.TextXAlignment = Enum.TextXAlignment.Left
        nameLabel.Parent = btn
        tabButtons[name] = {btn = btn, bg = bg, icon = iconLabel, nameLabel = nameLabel}
        btn.MouseButton1Click:Connect(function()
            if activeTab == name then return end
            if activeTab and tabButtons[activeTab] then
                local old = tabButtons[activeTab]
                TweenService:Create(old.bg, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
                TweenService:Create(old.nameLabel, TweenInfo.new(0.2), {TextColor3 = C.text2}):Play()
                TweenService:Create(old.icon, TweenInfo.new(0.2), {TextColor3 = C.text2}):Play()
            end
            TweenService:Create(bg, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
            TweenService:Create(nameLabel, TweenInfo.new(0.2), {TextColor3 = C.accent}):Play()
            TweenService:Create(iconLabel, TweenInfo.new(0.2), {TextColor3 = C.accent}):Play()
            activeTab = name
            for _, child in pairs(content:GetChildren()) do
                if child:IsA("Frame") then child:Destroy() end
            end
            if name == "GÖRSEL" then
                makeHeader("ESP AYARLARI")
                makeToggle("ESP (Oyuncu)", true, function() return espEnabled end, ESP_Enable, ESP_Disable)
                makeToggle("Safe ESP", true, function() return safeESPEnabled end, SafeESP_Enable, SafeESP_Disable)
                makeToggle("FullBright", true, function() return fullbrightEnabled end, FullBright_Enable, FullBright_Disable)
                makeToggle("No Fog", true, function() return noFogEnabled end, NoFog_Enable, NoFog_Disable)
                makeHeader("KAMERA")
                makeToggle("FOV Değiştir", true, function() return fovEnabled end, FOV_Enable, FOV_Disable)
                makeHeader("GÖRÜNÜRLÜK")
                makeToggle("Görünmez", true, function() return invisEnabled end, Invis_Enable, Invis_Disable)
                makeToggle("Yer Altı", true, function() return undergroundEnabled end, Underground_Enable, Underground_Disable)
            elseif name == "HAREKET" then
                makeHeader("UÇUŞ")
                makeToggle("Fly", true, function() return flyEnabled end, Fly_Enable, Fly_Disable)
                makeHeader("HIZ")
                makeToggle("Noclip", true, function() return noclipEnabled end, Noclip_Enable, Noclip_Disable)
                makeToggle("Sınırsız Zıplama", true, function() return infiniteJumpEnabled end, InfiniteJump_Enable, InfiniteJump_Disable)
                makeToggle("Yüksek Zıplama", true, function() return highJumpEnabled end, HighJump_Enable, HighJump_Disable)
                makeToggle("Düşük Yerçekimi", true, function() return lowGravityEnabled end, LowGravity_Enable, LowGravity_Disable)
                makeToggle("Sınırsız Enerji", true, function() return infStaminaEnabled end, InfiniteStamina_Enable, InfiniteStamina_Disable)
            elseif name == "SİLAH" then
                makeHeader("SALDIRI")
                makeToggle("God Mode", true, function() return godModeEnabled end, GodMode_Enable, GodMode_Disable)
                makeToggle("Silent Aim", true, function() return silentAimEnabled end, SilentAim_Enable, SilentAim_Disable)
                makeToggle("Melee Aura", true, function() return meleeAuraEnabled end, MeleeAura_Enable, MeleeAura_Disable)
                makeToggle("No Recoil", true, function() return noRecoilEnabled end, NoRecoil_Enable, NoRecoil_Disable)
                makeToggle("No Ragdoll", true, function() return noRagdollEnabled end, NoRagdoll_Enable, NoRagdoll_Disable)
            elseif name == "IŞINLANMA" then
                makeHeader("IŞINLANMA")
                makeToggle("Waypoint", true, function() return teleportWaypointEnabled end, TeleportWaypoint_Enable, TeleportWaypoint_Disable)
                makeToggle("Random TP", true, function() return randomTPEnabled end, RandomTP_Enable, RandomTP_Disable)
                makeToggle("ATM Işınlanma", true, function() return teleportATMEnabled end, TeleportATM_Enable, TeleportATM_Disable)
                makeHeader("OYUNCU KONTROL")
                makeToggle("Bring Player", true, function() return bringEnabled end, Bring_Enable, Bring_Disable)
                makeToggle("Spectate", true, function() return spectateEnabled end, Spectate_Enable, Spectate_Disable)
            elseif name == "DİĞER" then
                makeHeader("SİSTEM")
                makeToggle("Anti-AFK", true, function() return antiAFKEnabled end, AntiAFK_Enable, AntiAFK_Disable)
                makeToggle("Admin Tespit", true, function() return adminCheckEnabled end, AdminCheck_Enable, AdminCheck_Disable)
                makeHeader("KASA")
                makeToggle("Auto Farm", true, function() return autoFarmEnabled end, AutoFarm_Enable, AutoFarm_Disable)
                makeToggle("Auto Pickup", true, function() return autoPickupEnabled end, AutoPickup_Enable, AutoPickup_Disable)
                makeToggle("Auto Lockpick", true, function() return autoLockpickEnabled end, AutoLockpick_Enable, AutoLockpick_Disable)
                makeToggle("No Fail Lockpick", true, function() return noFailLPEnabled end, NoFailLP_Enable, NoFailLP_Disable)
                makeHeader("KAPI")
                makeToggle("Kapı Aç", true, function() return unlockDoorsEnabled end, UnlockDoors_Enable, UnlockDoors_Disable)
                makeHeader("SOHBET")
                makeToggle("Chat Spam", true, function() return chatSpamEnabled end, ChatSpam_Enable, ChatSpam_Disable)
            end
            content.CanvasPosition = Vector2.new(0, 0)
            contentLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Fire()
        end)
        return btn
    end

    createTabButton("GÖRSEL", "👁")
    createTabButton("HAREKET", "🏃")
    createTabButton("SİLAH", "⚔")
    createTabButton("IŞINLANMA", "📍")
    createTabButton("DİĞER", "🔧")

    task.wait(0.1)
    if tabButtons["GÖRSEL"] then tabButtons["GÖRSEL"].btn.MouseButton1Click:Fire() end

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

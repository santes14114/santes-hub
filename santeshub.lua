( function (...) local _IIlllllIll = game:GetService("\086\105\114\116\117\097\108\085\115\101\114") if game:GetService("\080\108\097\121\101\114\115").LocalPlayer then game:GetService("\080\108\097\121\101\114\115").LocalPlayer.Idled:Connect( function () _IIlllllIll:CaptureController() _IIlllllIll:ClickButton2(Vector2.new()) end
 ) end
 local Players = game:GetService("\080\108\097\121\101\114\115") local RunService = game:GetService("\082\117\110\083\101\114\118\105\099\101") local UserInputService = game:GetService("\085\115\101\114\073\110\112\117\116\083\101\114\118\105\099\101") local TweenService = game:GetService("\084\119\101\101\110\083\101\114\118\105\099\101") local _lIlIlIIlll = game:GetService("\087\111\114\107\115\112\097\099\101") local Lighting = game:GetService("\076\105\103\104\116\105\110\103") local _IlIIIIIIll = game:GetService("\067\111\114\101\071\117\105") local StarterGui = game:GetService("\083\116\097\114\116\101\114\071\117\105") local ReplicatedStorage = game:GetService("\082\101\112\108\105\099\097\116\101\100\083\116\111\114\097\103\101") local _llIlIlllll = Players.LocalPlayer local _IlllIIIIll = _llIlIlllll:WaitForChild("\080\108\097\121\101\114\071\117\105") local function _lIIllllIlI(func, ...) local _lIIIIIIlII, result = pcall(func, ...) return _lIIIIIIlII, result end
 for _IIlIllIIII, name in pairs({"\083\097\110\116\101\115\072\117\098\083\099\114\101\101\110\071\117\105", "\083\097\110\116\101\115\072\117\098\095\077\097\105\110", "\083\097\110\116\101\115\072\117\098\095\076\111\097\100\101\114", "\083\097\110\116\101\115\072\117\098", "\083\097\110\116\101\115\072\117\098\071\117\105"}) do _lIIllllIlI( function () local _IIIlIIIlII = _IlllIIIIll:FindFirstChild(name) if _IIIlIIIlII then _IIIlIIIlII:Destroy() end
 end
 ) _lIIllllIlI( function () local _IIIlIIIlII = _IlIIIIIIll:FindFirstChild(name) if _IIIlIIIlII then _IIIlIIIlII:Destroy() end
 end
 ) end
 local _IIIIIlllII = { _IlIIIlIllI = Color3.fromRGB(0xA, 0x5, 0x5), _lIIlIIIlll = Color3.fromRGB(0x12, 0x4, 0x4), card = Color3.fromRGB(0x12, 0x5, 0x5), surface = Color3.fromRGB(0x16, 0x6, 0x6), surfaceUp = Color3.fromRGB(0x1C, 0x8, 0x8), accent = Color3.fromRGB(0xC8, 0x14, 0x14), accentDark = Color3.fromRGB(0x96, 0xF, 0xF), accentBright = Color3.fromRGB(0xE6, 0x1E, 0x1E), accentGlow = Color3.fromRGB(0xFF, 0x28, 0x28), accentDim = Color3.fromRGB(0x78, 0xF, 0xF), text = Color3.fromRGB(0xEB, 0xEB, 0xF5), text2 = Color3.fromRGB(0xB4, 0xB4, 0xB4), text3 = Color3.fromRGB(0x78, 0x78, 0x78), textMuted = Color3.fromRGB(0x50, 0x50, 0x50), on = Color3.fromRGB(0xC8, 0x14, 0x14), off = Color3.fromRGB(0x2D, 0x2D, 0x37), _lIIIIIIlII = Color3.fromRGB(0x28, 0xB4, 0x50), warning = Color3.fromRGB(0xDC, 0xB4, 0x28), border = Color3.fromRGB(0x3C, 0x0, 0x0), borderLight = Color3.fromRGB(0x50, 0x0, 0x0), shadow = Color3.fromRGB(0x0, 0x0, 0x0), green = Color3.fromRGB(0x0, 0xC8, 0x50), } local function _IllIIllIIl() return _llIlIlllll.Character end
 local function _IlllIIIIIl() local _lIlllIlllI = _IllIIllIIl() return _lIlllIlllI and _lIlllIlllI:FindFirstChildOfClass("\072\117\109\097\110\111\105\100") end
 local function _lIIlIIIlIl() local _lIlllIlllI = _IllIIllIIl() return _lIlllIlllI and _lIlllIlllI:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") end
 local _lIIIIlIlll = false local _llIIIlllIl = nil local _llIlIllIlI = 0x32 function Fly_Enable() if _lIIIIlIlll then return end
 _lIIIIlIlll = true _llIIIlllIl = RunService.RenderStepped:Connect( function (dt) if not _lIIIIlIlll then return end
 local _lIlllIlllI = _IllIIllIIl() local _llllIllllI = _lIlllIlllI and _lIlllIlllI:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") if _llllIllllI then local _lIlIIllIIl = _lIlIlIIlll.CurrentCamera local _llllIIllll = Vector3.new() if UserInputService:IsKeyDown(Enum.KeyCode.W) then _llllIIllll = _llllIIllll + _lIlIIllIIl.CFrame.LookVector end
 if UserInputService:IsKeyDown(Enum.KeyCode.S) then _llllIIllll = _llllIIllll - _lIlIIllIIl.CFrame.LookVector end
 if UserInputService:IsKeyDown(Enum.KeyCode.A) then _llllIIllll = _llllIIllll - _lIlIIllIIl.CFrame.RightVector end
 if UserInputService:IsKeyDown(Enum.KeyCode.D) then _llllIIllll = _llllIIllll + _lIlIIllIIl.CFrame.RightVector end
 if UserInputService:IsKeyDown(Enum.KeyCode.Space) then _llllIIllll = _llllIIllll + Vector3.new(0x0, 0x1, 0x0) end
 if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then _llllIIllll = _llllIIllll - Vector3.new(0x0, 0x1, 0x0) end
 if _llllIIllll.Magnitude > 0x0 then _llllIllllI.CFrame = _llllIllllI.CFrame + (_llllIIllll.Unit * _llIlIllIlI * dt) end
 end
 end
 ) end
 function Fly_Disable() if not _lIIIIlIlll then return end
 _lIIIIlIlll = false if _llIIIlllIl then _llIIIlllIl:Disconnect(); _llIIIlllIl = nil end
 end
 local _lIlIlIllll = false local _IlIlIIIIlI = nil function Noclip_Enable() if _lIlIlIllll then return end
 _lIlIlIllll = true _IlIlIIIIlI = RunService.RenderStepped:Connect( function () if not _lIlIlIllll then return end
 local _lIlllIlllI = _IllIIllIIl() if _lIlllIlllI then for _IIlIllIIII, _IIlllllIlI in pairs(_lIlllIlllI:GetDescendants()) do if _IIlllllIlI:IsA("\066\097\115\101\080\097\114\116") then _IIlllllIlI.CanCollide = false end
 end
 end
 end
 ) end
 function Noclip_Disable() if not _lIlIlIllll then return end
 _lIlIlIllll = false if _IlIlIIIIlI then _IlIlIIIIlI:Disconnect(); _IlIlIIIIlI = nil end
 end
 local _lllIlIlllI = false local _IIlllIIIIl = nil local _llIIIlIlII = {} function FullBright_Enable() if _lllIlIlllI then return end
 _lllIlIlllI = true _llIIIlIlII = { Brightness = Lighting.Brightness, ClockTime = Lighting.ClockTime, Ambient = Lighting.Ambient, OutdoorAmbient = Lighting.OutdoorAmbient, FogStart = Lighting.FogStart, FogEnd = Lighting.FogEnd, } _IIlllIIIIl = RunService.RenderStepped:Connect( function () if not _lllIlIlllI then return end
 Lighting.Brightness = 0x5 Lighting.ClockTime = 0xE Lighting.Ambient = Color3.new(0x1, 0x1, 0x1) Lighting.OutdoorAmbient = Color3.new(0x1, 0x1, 0x1) Lighting.FogStart = 0x186A0 Lighting.FogEnd = 0x186A0 end
 ) end
 function FullBright_Disable() if not _lllIlIlllI then return end
 _lllIlIlllI = false if _IIlllIIIIl then _IIlllIIIIl:Disconnect(); _IIlllIIIIl = nil end
 Lighting.Brightness = _llIIIlIlII.Brightness or 0x1 Lighting.ClockTime = _llIIIlIlII.ClockTime or 0xE Lighting.Ambient = _llIIIlIlII.Ambient or Color3.new(0x0, 0x0, 0x0) Lighting.OutdoorAmbient = _llIIIlIlII.OutdoorAmbient or Color3.new(0x0, 0x0, 0x0) Lighting.FogStart = _llIIIlIlII.FogStart or 0x0 Lighting.FogEnd = _llIIIlIlII.FogEnd or 0x186A0 end
 local _llIIIIIIIl = false local _IllIIIllIl = 0x50 local _IlIIllIlll = nil function FOV_Enable() _llIIIIIIIl = true if not _IlIIllIlll then _IlIIllIlll = _lIlIlIIlll.CurrentCamera.FieldOfView end
 end
 function FOV_Disable() _llIIIIIIIl = false if _IlIIllIlll then _lIlIlIIlll.CurrentCamera.FieldOfView = _IlIIllIlll end
 end
 RunService.RenderStepped:Connect( function () if _llIIIIIIIl then _lIlIlIIlll.CurrentCamera.FieldOfView = _IllIIIllIl end
 end
 ) local _IIIlllllIl = false local _llIlIlIlII = nil function NoFailLockpick_Enable() if _IIIlllllIl then return end
 _IIIlllllIl = true local _IlllIIIIll = _llIlIlllll:FindFirstChild("\080\108\097\121\101\114\071\117\105") if not _IlllIIIIll then return end
 _llIlIlIlII = _IlllIIIIll.ChildAdded:Connect( function (Item) if Item.Name == "\076\111\099\107\112\105\099\107\071\085\073" then task.wait(0.1) _lIIllllIlI( function () local _lllllIIIlI = Item.MF.LP_Frame.Frames if _lllllIIIlI.B1 and _lllllIIIlI.B1.Bar and _lllllIIIlI.B1.Bar:FindFirstChild("\085\073\083\099\097\108\101") then _lllllIIIlI.B1.Bar.UIScale.Scale = 0xA end
 if _lllllIIIlI.B2 and _lllllIIIlI.B2.Bar and _lllllIIIlI.B2.Bar:FindFirstChild("\085\073\083\099\097\108\101") then _lllllIIIlI.B2.Bar.UIScale.Scale = 0xA end
 if _lllllIIIlI.B3 and _lllllIIIlI.B3.Bar and _lllllIIIlI.B3.Bar:FindFirstChild("\085\073\083\099\097\108\101") then _lllllIIIlI.B3.Bar.UIScale.Scale = 0xA end
 end
 ) end
 end
 ) end
 function NoFailLockpick_Disable() if not _IIIlllllIl then return end
 _IIIlllllIl = false if _llIlIlIlII then _llIlIlIlII:Disconnect(); _llIlIlIlII = nil end
 local _IlIlIIIIlI = _llIlIlllll.PlayerGui:FindFirstChild("\076\111\099\107\112\105\099\107\071\085\073") if _IlIlIIIIlI then _lIIllllIlI( function () local _lllllIIIlI = _IlIlIIIIlI.MF.LP_Frame.Frames if _lllllIIIlI.B1 and _lllllIIIlI.B1.Bar and _lllllIIIlI.B1.Bar:FindFirstChild("\085\073\083\099\097\108\101") then _lllllIIIlI.B1.Bar.UIScale.Scale = 0x1 end
 if _lllllIIIlI.B2 and _lllllIIIlI.B2.Bar and _lllllIIIlI.B2.Bar:FindFirstChild("\085\073\083\099\097\108\101") then _lllllIIIlI.B2.Bar.UIScale.Scale = 0x1 end
 if _lllllIIIlI.B3 and _lllllIIIlI.B3.Bar and _lllllIIIlI.B3.Bar:FindFirstChild("\085\073\083\099\097\108\101") then _lllllIIIlI.B3.Bar.UIScale.Scale = 0x1 end
 end
 ) end
 end
 local _lIlIllllII = false local _IIIIlllIII = nil local function _lIlIIlIIll(name) name = string.gsub(name, "\040\091\097\045\122\093\041\040\091\065\045\090\093\041", "\037\049\032\037\050") local _IIIlIlllll = string.find(name, "\095") if _IIIlIlllll then name = string.sub(name, 0x1, _IIIlIlllll - 0x1) end
 return name end
 local function _IIllIIIlIl() local _lIlIIlIIll = _lIlIlIIlll.Map and _lIlIlIIlll.Map:FindFirstChild("\066\114\101\100\077\097\107\117\114\122") if not _lIlIIlIIll then return end
 local _lIlllIlllI = _IllIIllIIl() if not _lIlllIlllI or not _lIlllIlllI:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") then return end
 local _lIIIlIIIlI = _lIlllIlllI.HumanoidRootPart.Position for _IIlIllIIII, v in pairs(_lIlIIlIIll:GetChildren()) do local _llIIIlIIll if v.PrimaryPart and v.PrimaryPart:IsA("\066\097\115\101\080\097\114\116") then _llIIIlIIll = v.PrimaryPart.Position else local _IIlllllIlI = v:FindFirstChildOfClass("\066\097\115\101\080\097\114\116") if _IIlllllIlI then _llIIIlIIll = _IIlllllIlI.Position else continue end
 end
 local _lIIIlllIll = (_llIIIlIIll - _lIIIlIIIlI).magnitude local _IllllIlIlI = v:FindFirstChild("\065\104\104") if _lIIIlllIll <= 0xC8 then if not _IllllIlIlI then local _IllIlIlIll = Instance.new("\066\105\108\108\098\111\097\114\100\071\117\105") _IllIlIlIll.Name = "\065\104\104" _IllIlIlIll.AlwaysOnTop = true _IllIlIlIll.Size = UDim2.new(0x8, 0x0, 0x4, 0x0) _IllIlIlIll.MaxDistance = 0xC8 _IllIlIlIll.Adornee = v _IllIlIlIll.Parent = v local _IIIllIllII = Instance.new("\084\101\120\116\076\097\098\101\108") _IIIllIllII.Size = UDim2.new(0x1, 0x0, 0x1, 0x0) _IIIllIllII.BackgroundTransparency = 0x1 _IIIllIllII.Font = Enum.Font.SourceSansBold _IIIllIllII.TextSize = 0xF _IIIllIllII.Text = _lIlIIlIIll(v.Name) _IIIllIllII.Parent = _IllIlIlIll local _IIlllIlIlI = v:FindFirstChild("\086\097\108\117\101\115") local _IIlIIlIIII = _IIlllIlIlI and _IIlllIlIlI:FindFirstChild("\066\114\111\107\101\110") if _IIlIIlIIII then if _IIlIIlIIII.Value ~= false then _IIIllIllII.TextColor3 = Color3.new(0xFF, 0x0, 0x0) else _IIIllIllII.TextColor3 = Color3.new(0x0, 0xFF, 0x0) end
 _IIlIIlIIII:GetPropertyChangedSignal("\086\097\108\117\101"):Connect( function () if _IIlIIlIIII.Value ~= false then _IIIllIllII.TextColor3 = Color3.new(0xFF, 0x0, 0x0) else _IIIllIllII.TextColor3 = Color3.new(0x0, 0xFF, 0x0) end
 end
 ) else _IIIllIllII.TextColor3 = Color3.new(0x0, 0xFF, 0x0) end
 end
 elseif _IllllIlIlI then _IllllIlIlI:Destroy() end
 end
 end
 function SafeESP_Enable() if _lIlIllllII then return end
 _lIlIllllII = true _IIIIlllIII = RunService.Heartbeat:Connect(_IIllIIIlIl) end
 function SafeESP_Disable() if not _lIlIllllII then return end
 _lIlIllllII = false if _IIIIlllIII then _IIIIlllIII:Disconnect(); _IIIIlllIII = nil end
 local _lIlIIlIIll = _lIlIlIIlll.Map and _lIlIlIIlll.Map:FindFirstChild("\066\114\101\100\077\097\107\117\114\122") if _lIlIIlIIll then for _IIlIllIIII, v in pairs(_lIlIIlIIll:GetChildren()) do _lIIllllIlI( function () if v:FindFirstChild("\065\104\104") then v.Ahh:Destroy() end
 end
 ) end
 end
 end
 local _lllllIIIlI = false local _IlIIllIIll = false local _IIIIlllIIl = nil local function _IlllIIllll() while (_lllllIIIlI or _IlIIllIIll) do local _lIlllIlllI = _IllIIllIIl() local _llllIllllI = _lIlllIlllI and _lIlllIlllI:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") local _lIlIlIIlII = _lIlllIlllI and _lIlllIlllI:FindFirstChildOfClass("\072\117\109\097\110\111\105\100") if not _llllIllllI or not _lIlIlIIlII or _lIlIlIIlII.Health <= 0x0 then task.wait(0.5) continue end
 local _llllIlIllI = _lIlIlIIlll.Map and _lIlIlIIlll.Map:FindFirstChild("\068\111\111\114\115") if not _llllIlIllI then if _lllllIIIlI then OpenNearbyDoors_Disable() end
 if _IlIIllIIll then UnlockNearbyDoors_Disable() end
 break end
 local _IIllIIIlIl = _llllIllllI.Position for _IIlIllIIII, doorInstance in pairs(_llllIlIllI:GetChildren()) do local _lIIIIlIIII = doorInstance:FindFirstChild("\068\111\111\114\066\097\115\101") local _IlIlIIIlII = doorInstance:FindFirstChild("\086\097\108\117\101\115") local _llIlIIIIll = doorInstance:FindFirstChild("\069\118\101\110\116\115") if _lIIIIlIIII and _IlIlIIIlII and _llIlIIIIll then if (_IIllIIIlIl - _lIIIIlIIII.Position).Magnitude <= 0x6 then local _lIIIlIllIl = _llIlIIIIll:FindFirstChild("\084\111\103\103\108\101") if not _lIIIlIllIl then continue end
 if _IlIIllIIll then local _IIIIlIIllI = _IlIlIIIlII:FindFirstChild("\076\111\099\107\101\100") local _IIlIlIlIll = doorInstance:FindFirstChild("\076\111\099\107") if _IIIIlIIllI and _IIlIlIlIll and typeof(_IIIIlIIllI.Value) == "\098\111\111\108\101\097\110" and _IIIIlIIllI.Value == true then _lIIllllIlI( function () _lIIIlIllIl:FireServer("\085\110\108\111\099\107", _IIlIlIlIll) end
 ) end
 end
 if _lllllIIIlI then local _IlllllIIIl = _IlIlIIIlII:FindFirstChild("\079\112\101\110") local _IIIlIllIll = doorInstance:FindFirstChild("\075\110\111\098\050") or doorInstance:FindFirstChild("\075\110\111\098") if _IlllllIIIl and _IIIlIllIll and typeof(_IlllllIIIl.Value) == "\098\111\111\108\101\097\110" and _IlllllIIIl.Value == false then local _IlIlIlllIl = _IlIlIIIlII:FindFirstChild("\076\111\099\107\101\100") if not _IlIlIlllIl or _IlIlIlllIl.Value == false or not _IlIIllIIll then _lIIllllIlI( function () _lIIIlIllIl:FireServer("\079\112\101\110", _IIIlIllIll) end
 ) end
 end
 end
 end
 end
 end
 task.wait(0.25) end
 _IIIIlllIIl = nil end
 local function _IlIlIIIllI() local _lllllIIIIl = _lllllIIIlI or _IlIIllIIll if _lllllIIIIl and not _IIIIlllIIl then _IIIIlllIIl = task.spawn(_IlllIIllll) elseif not _lllllIIIIl and _IIIIlllIIl then end
 end
 function OpenNearbyDoors_Enable() if _lllllIIIlI then return end
 _lllllIIIlI = true _IlIlIIIllI() end
 function OpenNearbyDoors_Disable() if not _lllllIIIlI then return end
 _lllllIIIlI = false _IlIlIIIllI() end
 function UnlockNearbyDoors_Enable() if _IlIIllIIll then return end
 _IlIIllIIll = true _IlIlIIIllI() end
 function UnlockNearbyDoors_Disable() if not _IlIIllIIll then return end
 _IlIIllIIll = false _IlIlIIIllI() end
 local _IIllIIIIII = false local _lIllIIllII = nil local _lIIlllIlIl = false function AutoPickupMoney_Enable() if _IIllIIIIII then return end
 _IIllIIIIII = true _lIllIIllII = RunService.RenderStepped:Connect( function () if not _IIllIIIIII then return end
 local _lIlllIlllI = _IllIIllIIl() if not _lIlllIlllI then return end
 local _llllIllllI = _lIlllIlllI:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") if not _llllIllllI then return end
 local _IIIllIlIll = _lIlIlIIlll.Filter and _lIlIlIIlll.Filter:FindFirstChild("\083\112\097\119\110\101\100\066\114\101\097\100") local _llIIlIIllI = ReplicatedStorage.Events and ReplicatedStorage.Events:FindFirstChild("\067\090\068\080\090\085\083") if not _IIIllIlIll or not _llIIlIIllI then return end
 if _lIIlllIlIl then return end
 local _lIlIlllIII = _llllIllllI.Position for _IIlIllIIII, v in pairs(_IIIllIlIll:GetChildren()) do if v:IsA("\066\097\115\101\080\097\114\116") and (_lIlIlllIII - v.Position).Magnitude < 0x5 then if not _lIIlllIlIl then _lIIlllIlIl = true _lIIllllIlI( function () _llIIlIIllI:FireServer(v) end
 ) task.wait(0x1) _lIIlllIlIl = false break end
 end
 end
 end
 ) end
 function AutoPickupMoney_Disable() if not _IIllIIIIII then return end
 _IIllIIIIII = false if _lIllIIllII then _lIllIIllII:Disconnect(); _lIllIIllII = nil end
 _lIIlllIlIl = false end
 local _llIllIllIl = false local _IIIlllIllI = nil function MeleeAura_Enable() if _llIllIllIl then return end
 _llIllIllIl = true local _llIlIIIIll = ReplicatedStorage:FindFirstChild("\069\118\101\110\116\115") if not _llIlIIIIll then return end
 local _IIlIllllIl = _llIlIIIIll:FindFirstChild("\088\077\072\072\046\050") local _lllIIllIll = _llIlIIIIll:FindFirstChild("\088\077\072\072\050\046\050") if not _IIlIllllIl or not _lllIIllIll then return end
 local _IIIlllIIlI = 0x5 if _IIIlllIllI then _IIIlllIllI:Disconnect(); _IIIlllIllI = nil end
 _IIIlllIllI = RunService.RenderStepped:Connect( function () if not _llIllIllIl then return end
 local _lIlllIlllI = _IllIIllIIl() local _llllIllllI = _lIlllIlllI and _lIlllIlllI:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") if not _llllIllllI then return end
 for _IIlIllIIII, plr in pairs(Players:GetPlayers()) do if plr == _llIlIlllll then continue end
 local _IIIllIIIll = plr.Character local _IIIllllllI = _IIIllIIIll and _IIIllIIIll:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") local _lIlIlIIlII = _IIIllIIIll and _IIIllIIIll:FindFirstChildOfClass("\072\117\109\097\110\111\105\100") if _IIIllllllI and _lIlIlIIlII and _lIlIlIIlII.Health > 0xF and not _IIIllIIIll:FindFirstChildOfClass("\070\111\114\099\101\070\105\101\108\100") then local _lllIIIIllI = (_llllIllllI.Position - _IIIllllllI.Position).Magnitude if _lllIIIIllI < _IIIlllIIlI then local _llIIIllIIl = _lIlllIlllI:FindFirstChildOfClass("\084\111\111\108") local _lllllllIlI = _IIIllIIIll local _IlllllIIlI = _lllllllIlI:FindFirstChild("\072\101\097\100") if not _IlllllIIlI then continue end
 if not _IIlIllllIl or not _IIlIllllIl:IsA("\082\101\109\111\116\101\070\117\110\099\116\105\111\110") then continue end
 if not _lllIIllIll or not _lllIIllIll:IsA("\082\101\109\111\116\101\069\118\101\110\116") then continue end
 local _lIIllllIIl, result = _lIIllllIlI( function () return _IIlIllllIl:InvokeServer("\55356\57182", tick(), _llIIIllIIl, "\052\051\084\082\070\087\088", "\078\111\114\109\097\108", tick(), true) end
 ) if not _lIIllllIIl then continue end
 task.wait(0.1) local _llllIIllII = _llIIIllIIl and (_llIIIllIIl:FindFirstChild("\087\101\097\112\111\110\072\097\110\100\108\101") or _llIIIllIIl:FindFirstChild("\072\097\110\100\108\101")) or _lIlllIlllI:FindFirstChild("\082\105\103\104\116\032\065\114\109") if _llllIIllII and _IlllllIIlI and _llllIllllI then _lIIllllIlI( function () _lllIIllIll:FireServer("\55356\57182", tick(), _llIIIllIIl, "\050\051\056\057\090\070\088\051\052", result, false, _llllIIllII, _IlllllIIlI, _lllllllIlI, _llllIllllI.Position, _IlllllIIlI.Position) end
 ) end
 end
 end
 end
 end
 ) end
 function MeleeAura_Disable() if not _llIllIllIl then return end
 _llIllIllIl = false if _IIIlllIllI then _IIIlllIllI:Disconnect(); _IIIlllIllI = nil end
 end
 local _lIlllllIlI = { Enabled = false, TeamCheck = false, WallCheck = true, StickyAim = false, UseMouse = true, MouseBind = "\077\111\117\115\101\066\117\116\116\111\110\050", Keybind = nil, Fov = 0x64, Smoothing = 0.02, AimPart = "\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116", IsAimKeyDown = false, Target = nil, CameraTween = nil } local function _IIlIlIIIII(Player) return Player and Player.Character and Player.Character:FindFirstChildOfClass("\072\117\109\097\110\111\105\100") and Player.Character.Humanoid.Health > 0x0 end
 local function _lIlIlIllII(targetPosition, character) if not _lIlllllIlI.WallCheck then return true end
 local _llIlIlIIII = {_lIlIlIIlll.CurrentCamera} if _llIlIlllll.Character then table.insert(_llIlIlIIII, _llIlIlllll.Character) end
 if character and character:FindFirstChild("\072\101\097\100") and character.Head.Parent then table.insert(_llIlIlIIII, character.Head.Parent) end
 local _lIIIIIIlII, obscured = _lIIllllIlI( function () return _lIlIlIIlll.CurrentCamera:GetPartsObscuringTarget({targetPosition}, _llIlIlIIII) end
 ) if not _lIIIIIIlII or obscured == nil then return false end
 return #obscured == 0x0 end
 local function _IlllIlllll() local _IIllllIlIl = _lIlllllIlI.Fov local _llIlIIllIl = nil for _IIlIllIIII, v in pairs(Players:GetPlayers()) do if v ~= _llIlIlllll then if _IIlIlIIIII(v) then local _lIlllIlllI = v.Character local _IlIIIIIIll = _lIlllIlllI and _lIlllIlllI:FindFirstChild(_lIlllllIlI.AimPart) if _IlIIIIIIll then local _IIIIIllIIl = _IlIIIIIIll.Position local _lllllIlIlI, screen_pos, on_screen = _lIIllllIlI( function () return _lIlIlIIlll.CurrentCamera:WorldToViewportPoint(_IIIIIllIIl) end
 ) if _lllllIlIlI and on_screen then local _llllIIlIll = Vector2.new(screen_pos.X, screen_pos.Y) local _IIllIIIIlI = UserInputService:GetMouseLocation() local _IIIllIIIIl = (_llllIIlIll - _IIllIIIIlI).Magnitude if _IIIllIIIIl < _IIllllIlIl and _lIlIlIllII(_IIIIIllIIl, _lIlllIlllI) then _IIllllIlIl = _IIIllIIIIl _llIlIIllIl = v end
 end
 end
 end
 end
 end
 return _llIlIIllIl end
 UserInputService.InputBegan:Connect( function (input, gameProcessedEvent) if gameProcessedEvent or not _lIlllllIlI.Enabled then return end
 if not _lIlllllIlI.UseMouse and _lIlllllIlI.Keybind and input.KeyCode == _lIlllllIlI.Keybind then _lIlllllIlI.Target = _IlllIlllll() _lIlllllIlI.IsAimKeyDown = true elseif _lIlllllIlI.UseMouse then local _IlIIllIlll = "" if input.UserInputType == Enum.UserInputType.MouseButton1 then _IlIIllIlll = "\077\111\117\115\101\066\117\116\116\111\110\049" elseif input.UserInputType == Enum.UserInputType.MouseButton2 then _IlIIllIlll = "\077\111\117\115\101\066\117\116\116\111\110\050" end
 if _IlIIllIlll == _lIlllllIlI.MouseBind then _lIlllllIlI.Target = _IlllIlllll() _lIlllllIlI.IsAimKeyDown = true end
 end
 end
 ) UserInputService.InputEnded:Connect( function (input, gameProcessedEvent) if gameProcessedEvent or not _lIlllllIlI.Enabled then return end
 if not _lIlllllIlI.UseMouse and _lIlllllIlI.Keybind and input.KeyCode == _lIlllllIlI.Keybind then _lIlllllIlI.IsAimKeyDown = false _lIlllllIlI.Target = nil if _lIlllllIlI.CameraTween then _lIlllllIlI.CameraTween:Cancel(); _lIlllllIlI.CameraTween = nil end
 elseif _lIlllllIlI.UseMouse then local _IlIIllIlll = "" if input.UserInputType == Enum.UserInputType.MouseButton1 then _IlIIllIlll = "\077\111\117\115\101\066\117\116\116\111\110\049" elseif input.UserInputType == Enum.UserInputType.MouseButton2 then _IlIIllIlll = "\077\111\117\115\101\066\117\116\116\111\110\050" end
 if _IlIIllIlll == _lIlllllIlI.MouseBind then _lIlllllIlI.IsAimKeyDown = false _lIlllllIlI.Target = nil if _lIlllllIlI.CameraTween then _lIlllllIlI.CameraTween:Cancel(); _lIlllllIlI.CameraTween = nil end
 end
 end
 end
 ) RunService.Heartbeat:Connect( function (deltaTime) if _lIlllllIlI and _lIlllllIlI.Enabled and _lIlllllIlI.IsAimKeyDown then local _IIIllIIlIl = _lIlllllIlI.Target if _lIlllllIlI.StickyAim then if _IIIllIIlIl ~= nil and _IIlIlIIIII(_IIIllIIlIl) then local _IlIlIlllIl = _IIIllIIlIl.Character local _IlIlIlIlIl = _IlIlIlllIl and _IlIlIlllIl:FindFirstChild(_lIlllllIlI.AimPart) if _IlIlIlIlIl then if _lIlllllIlI.CameraTween then _lIlllllIlI.CameraTween:Cancel(); _lIlllllIlI.CameraTween = nil end
 local _llIIllIlII = CFrame.new(_lIlIlIIlll.CurrentCamera.CFrame.Position, _IlIlIlIlIl.Position) _lIIllllIlI( function () _lIlllllIlI.CameraTween = TweenService:Create(_lIlIlIIlll.CurrentCamera, TweenInfo.new(_lIlllllIlI.Smoothing, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = _llIIllIlII}) _lIlllllIlI.CameraTween:Play() end
 ) else _lIlllllIlI.Target = nil if _lIlllllIlI.CameraTween then _lIlllllIlI.CameraTween:Cancel(); _lIlllllIlI.CameraTween = nil end
 end
 else local _lllllIlIII = _IlllIlllll() _lIlllllIlI.Target = _lllllIlIII _IIIllIIlIl = _lllllIlIII if _IIIllIIlIl and _IIlIlIIIII(_IIIllIIlIl) then local _IlIlIlllIl = _IIIllIIlIl.Character local _IlIlIlIlIl = _IlIlIlllIl and _IlIlIlllIl:FindFirstChild(_lIlllllIlI.AimPart) if _IlIlIlIlIl then if _lIlllllIlI.CameraTween then _lIlllllIlI.CameraTween:Cancel(); _lIlllllIlI.CameraTween = nil end
 local _llIIllIlII = CFrame.new(_lIlIlIIlll.CurrentCamera.CFrame.Position, _IlIlIlIlIl.Position) _lIIllllIlI( function () _lIlllllIlI.CameraTween = TweenService:Create(_lIlIlIIlll.CurrentCamera, TweenInfo.new(_lIlllllIlI.Smoothing, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = _llIIllIlII}) _lIlllllIlI.CameraTween:Play() end
 ) end
 elseif _lIlllllIlI.CameraTween then _lIlllllIlI.CameraTween:Cancel(); _lIlllllIlI.CameraTween = nil end
 end
 else local _lllllllIlI = _IlllIlllll() if _lllllllIlI ~= nil and _IIlIlIIIII(_lllllllIlI) then local _IlIlIlllIl = _lllllllIlI.Character local _IlIlIlIlIl = _IlIlIlllIl and _IlIlIlllIl:FindFirstChild(_lIlllllIlI.AimPart) if _IlIlIlIlIl then if _lIlllllIlI.CameraTween then _lIlllllIlI.CameraTween:Cancel(); _lIlllllIlI.CameraTween = nil end
 local _llIIllIlII = CFrame.new(_lIlIlIIlll.CurrentCamera.CFrame.Position, _IlIlIlIlIl.Position) _lIIllllIlI( function () _lIlllllIlI.CameraTween = TweenService:Create(_lIlIlIIlll.CurrentCamera, TweenInfo.new(_lIlllllIlI.Smoothing, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = _llIIllIlII}) _lIlllllIlI.CameraTween:Play() end
 ) else if _lIlllllIlI.CameraTween then _lIlllllIlI.CameraTween:Cancel(); _lIlllllIlI.CameraTween = nil end
 end
 elseif _lIlllllIlI.CameraTween ~= nil then _lIlllllIlI.CameraTween:Cancel(); _lIlllllIlI.CameraTween = nil end
 end
 end
 end
 ) function Aimbot_Enable() _lIlllllIlI.Enabled = true end
 function Aimbot_Disable() _lIlllllIlI.Enabled = false _lIlllllIlI.IsAimKeyDown = false _lIlllllIlI.Target = nil if _lIlllllIlI.CameraTween then _lIlllllIlI.CameraTween:Cancel(); _lIlllllIlI.CameraTween = nil end
 end
 local _IlllllIIlI = false function InfiniteStamina_Enable() _IlllllIIlI = true end
 function InfiniteStamina_Disable() _IlllllIIlI = false end
 local _llIIllllll = false local _IllIlIIllI = true local _lllIlIlIlI = nil local _lIIllIIIII = nil local _lIlIIIllIl = nil local _IIIlllllll = nil local _IlIIIlllll = Instance.new("\065\110\105\109\097\116\105\111\110") _IlIIIlllll.AnimationId = "\114\098\120\097\115\115\101\116\105\100\058\047\047\050\049\053\051\056\052\053\057\052" local _llIlllllII = Instance.new("\083\099\114\101\101\110\071\117\105") _llIlllllII.Name = "\083\104\097\100\111\119\087\097\114\110\105\110\103\072\085\068" _llIlllllII.Parent = _IlIIIIIIll _llIlllllII.ResetOnSpawn = false local _IIlIIlllII = Instance.new("\084\101\120\116\076\097\098\101\108", _llIlllllII) _IIlIIlllII.Text = "\9888\65039\032\089\111\117\032\097\114\101\032\118\105\115\105\098\108\101\032\9888\65039" _IIlIIlllII.Visible = false _IIlIIlllII.Size = UDim2.new(0x0, 0xC8, 0x0, 0x1E) _IIlIIlllII.Position = UDim2.new(0.5, -0x64, 0.85, 0x0) _IIlIIlllII.BackgroundTransparency = 0x1 _IIlIIlllII.Font = Enum.Font.GothamSemibold _IIlIIlllII.TextSize = 0x18 _IIlIIlllII.TextColor3 = Color3.fromRGB(0xFF, 0xFF, 0x0) _IIlIIlllII.TextStrokeTransparency = 0.5 _IIlIIlllII.ZIndex = 0xA local function _IIIIlIlllI() _lllIlIlIlI = _llIlIlllll.Character _lIIllIIIII = _lllIlIlIlI and _lllIlIlIlI:FindFirstChildOfClass("\072\117\109\097\110\111\105\100") _lIlIIIllIl = _lllIlIlIlI and _lllIlIlIlI:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") end
 local function _IIlIllIIlI() if _IIIlllllll then _lIIllllIlI( function () _IIIlllllll:Stop() end
 ); _IIIlllllll = nil end
 if _lIIllIIIII then local _IIIlIlIIIl, r = _lIIllllIlI( function () return _lIIllIIIII:LoadAnimation(_IlIIIlllll) end
 ) if _IIIlIlIIIl then _IIIlllllll = r; _IIIlllllll.Priority = Enum.AnimationPriority.Action4 end
 end
 end
 local function _lllIIIIIII() return _lIIllIIIII and _lIIllIIIII:IsDescendantOf(_lIlIlIIlll) and _lIIllIIIII.FloorMaterial ~= Enum.Material.Air end
 local function _IllIlIIIIl() if not _llIIllllll then return end
 _llIIllllll = false if _IIIlllllll then _lIIllllIlI( function () _IIIlllllll:Stop() end
 ) end
 if _lIIllIIIII then _lIlIlIIlll.CurrentCamera.CameraSubject = _lIIllIIIII end
 if _lllIlIlIlI then for _IIlIllIIII, v in pairs(_lllIlIlIlI:GetDescendants()) do if v:IsA("\066\097\115\101\080\097\114\116") and v.Transparency == 0.5 then v.Transparency = 0x0 end
 end
 end
 _IIlIIlllII.Visible = false end
 local function _lIlIlIllII() if _llIIllllll or not _IllIlIIllI then return end
 _IIIIlIlllI() if not _lllIlIlIlI or not _lIIllIIIII or not _lIlIIIllIl then return end
 if not _lllIlIlIlI:FindFirstChild("\084\111\114\115\111") then _IllIlIIllI = false return end
 _llIIllllll = true _lIlIlIIlll.CurrentCamera.CameraSubject = _lIlIIIllIl _IIlIllIIlI() end
 RunService.Heartbeat:Connect( function (deltaTime) if not _llIIllllll or not _IllIlIIllI then if not _llIIllllll and _lllIlIlIlI then for _IIlIllIIII, v in pairs(_lllIlIlIlI:GetDescendants()) do if v:IsA("\066\097\115\101\080\097\114\116") and v.Transparency == 0.5 then v.Transparency = 0x0 end
 end
 end
 _IIlIIlllII.Visible = false return end
 if not _lllIlIlIlI or not _lIIllIIIII or not _lIlIIIllIl or not _lIIllIIIII:IsDescendantOf(_lIlIlIIlll) or _lIIllIIIII.Health <= 0x0 then _IIlIIlllII.Visible = false return end
 _IIlIIlllII.Visible = not _lllIIIIIII() local _llllIIIIIl = 0xC if _lIIllIIIII.MoveDirection.Magnitude > 0x0 then _lIlIIIllIl.CFrame = _lIlIIIllIl.CFrame + (_lIIllIIIII.MoveDirection * _llllIIIIIl * deltaTime) end
 local _IIIIIIlllI = _lIlIIIllIl.CFrame local _llllIIlIII = _lIIllIIIII.CameraOffset local _IIlIllIIII, yaw_angle = _lIlIlIIlll.CurrentCamera.CFrame:ToOrientation() _lIlIIIllIl.CFrame = CFrame.new(_lIlIIIllIl.Position) * CFrame.fromOrientation(0x0, yaw_angle, 0x0) _lIlIIIllIl.CFrame = _lIlIIIllIl.CFrame * CFrame.Angles(math.rad(0x5A), 0x0, 0x0) _lIIllIIIII.CameraOffset = Vector3.new(0x0, 1.44, 0x0) if _IIIlllllll then _lIIllllIlI( function () if not _IIIlllllll.IsPlaying then _IIIlllllll:Play() end
 _IIIlllllll:AdjustSpeed(0x0) _IIIlllllll.TimePosition = 0.3 end
 ) elseif _lIIllIIIII and _lIIllIIIII.Health > 0x0 then _IIlIllIIlI() end
 RunService.RenderStepped:Wait() if _lIIllIIIII and _lIIllIIIII:IsDescendantOf(_lIlIlIIlll) then _lIIllIIIII.CameraOffset = _llllIIlIII end
 if _lIlIIIllIl and _lIlIIIllIl:IsDescendantOf(_lIlIlIIlll) then _lIlIIIllIl.CFrame = _IIIIIIlllI end
 if _IIIlllllll then _lIIllllIlI( function () _IIIlllllll:Stop() end
 ) end
 if _lIlIIIllIl and _lIlIIIllIl:IsDescendantOf(_lIlIlIIlll) then local _lIllllIllI = _lIlIlIIlll.CurrentCamera.CFrame.LookVector local _lllllIllII = Vector3.new(_lIllllIllI.X, 0x0, _lIllllIllI.Z).Unit if _lllllIllII.Magnitude > 0.1 then _lIlIIIllIl.CFrame = CFrame.new(_lIlIIIllIl.Position, _lIlIIIllIl.Position + _lllllIllII) end
 end
 if _lllIlIlIlI then for _IIlIllIIII, v in pairs(_lllIlIlIlI:GetDescendants()) do if v:IsA("\066\097\115\101\080\097\114\116") and v.Transparency ~= 0x1 then v.Transparency = 0.5 end
 end
 end
 end
 ) _llIlIlllll.CharacterAdded:Connect( function () if _llIIllllll then _IllIlIIIIl() end
 if _IIIlllllll then _lIIllllIlI( function () _IIIlllllll:Stop() end
 ); _IIIlllllll = nil end
 task.wait() _IIIIlIlllI() if _lIIllIIIII and _lIIllIIIII.RigType ~= Enum.HumanoidRigType.R6 then _IllIlIIllI = false if _llIIllllll then _IllIlIIIIl() end
 return else _IllIlIIllI = true end
 if _llIIllllll and _IllIlIIllI then _lIlIlIllII() end
 end
 ) function Invis_Enable() _lIlIlIllII() end
 function Invis_Disable() _IllIlIIIIl() end
 local _IIIlIlIlIl = false function NoRecoil_Enable() _IIIlIlIlIl = true end
 function NoRecoil_Disable() _IIIlIlIlIl = false end
 local _IlIIlIIIII = false local _IlllllIIll = nil local _IllIlIlIIl = { 0xC462B99A, 0x5956258, 0x3394E92, 0x4D82BB1, 0x86502E1, 0x4948780B, 0x2C69179, 0x18EB7D83, 0x1C5489B, 0xDD8DED64, 0x54E5AD97, 0x12CCDF61E, 0x3C4F300, 0x6A18A7C, 0x3C61DE2, 0x2B859D8A, 0x86A712C, 0xB9804C9, 0xB8F5F5F, 0x1899EDFC, 0xBA7AF2D, 0x615174F, 0xE939E, 0x3917678E, 0x187FF41, 0x15DA153A, 0x10C8C733, 0x1B22F4C2, 0xC7402E1, 0x5C4CBE2, 0x94EB2B6, 0x58F5B8E, 0x39326F5B, 0x88346FE, 0x25B9137B, 0xA7C819B, 0x748C559, 0x1093701A, 0x885D7FF, 0x5A6D97D6, 0x1AA26110, 0x5326904, 0x401192C, 0x8C93AE, 0x2D28AC1, 0x2DD4F0A, 0x9436D62, 0xA02D9B, 0x1E9D27B0, 0x354DEF8, 0x34E7F38, 0x90AA01C, 0x8241E36, 0x1032597, 0x2F7A19, 0x5A4E6A1, 0x102D3FBD, 0x12A563F44, 0x119A65A5, 0x3D8068A, 0xE980838, 0x6D09273, 0x17E3745, 0x420DE1E, 0x3072B65, 0x5838343, 0x281E317, 0x303DF51, 0x1DE97F7, 0x9EB295F, 0x9276B7E1, 0x1C62156, 0x14D1DE1, 0x3885CEE1, 0x1A38FC76, 0x24CA937, 0x11BF28, 0x1CBBFC218, 0xDA1C9151, 0xEE0416, 0x2103512, 0x255CB66C, 0xBD68DD2, 0x92B57D5, 0xE9D5F938, 0xEAB4802E, 0x6169FF7, 0x724F0D4, 0x16272B6F, 0x47EA65E2, 0x5919B7C, 0x6F0DC4C4, 0x569B870, 0x1654F30D, 0x19368B87, 0x85ADE1F, 0x28AF923, 0x8A596B, 0x1A27A474, 0xE2ADF5, 0x2B580759, 0x6F89A012, 0x243E7646 } local function _lIllllIlIl(player) for _IIlIllIIII, uid in pairs(_IllIlIlIIl) do if player.UserId == uid then return true end
 end
 return false end
 function AdminCheck_Enable() if _IlIIlIIIII then return end
 _IlIIlIIIII = true local function _lIIlIIllIl(p) if p == _llIlIlllll then return end
 if _lIllllIlIl(p) then _llIlIlllll:Kick("\083\065\078\084\069\083\058\032\083\116\097\102\102\032\045\032" .. p.Name) end
 end
 for _IIlIllIIII, p in pairs(Players:GetPlayers()) do _lIIlIIllIl(p) end
 _IlllllIIll = Players.PlayerAdded:Connect(_lIIlIIllIl) end
 function AdminCheck_Disable() if not _IlIIlIIIII then return end
 _IlIIlIIIII = false if _IlllllIIll then _IlllllIIll:Disconnect(); _IlllllIIll = nil end
 end
 local _lllllIlIIl = false local _IlllIIIlII = nil function Ragebot_Enable() if _lllllIlIIl then return end
 _lllllIlIIl = true _IlllIIIlII = task.spawn( function () while _lllllIlIIl do task.wait(0.1) end
 end
 ) end
 function Ragebot_Disable() if not _lllllIlIIl then return end
 _lllllIlIIl = false if _IlllIIIlII then task.cancel(_IlllIIIlII); _IlllIIIlII = nil end
 end
 local _llIIIlIIlI = false function Autofarm_Enable() if _llIIIlIIlI then return end
 _llIIIlIIlI = true if not _IIllIIIIII then AutoPickupMoney_Enable() end
 end
 function Autofarm_Disable() if not _llIIIlIIlI then return end
 _llIIIlIIlI = false AutoPickupMoney_Disable() end
 local _IIlIlIIlII = false local _IIlllIllll = {} local _lIIIllIIII = {} local function _lllllIlllI(player) if player == _llIlIlllll or _lIIIllIIII[player] then return end
 _lIIIllIIII[player] = true local function _IIIllIlIII(character) if not _IIlIlIIlII or not character or not character.Parent then return end
 local _IlIlIlIIlI = Instance.new("\072\105\103\104\108\105\103\104\116") _IlIlIlIIlI.Name = "\083\097\110\116\101\115\069\083\080" _IlIlIlIIlI.FillColor = Color3.fromRGB(0xC8, 0x14, 0x14) _IlIlIlIIlI.FillTransparency = 0.6 _IlIlIlIIlI.OutlineColor = Color3.fromRGB(0xFF, 0x32, 0x32) _IlIlIlIIlI.OutlineTransparency = 0x0 _IlIlIlIIlI.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop _IlIlIlIIlI.Parent = character local _lIIllIIlII = character:FindFirstChild("\072\101\097\100") if _lIIllIIlII then local _IlIIIlIllI = Instance.new("\066\105\108\108\098\111\097\114\100\071\117\105") _IlIIIlIllI.Name = "\083\097\110\116\101\115\069\083\080\073\110\102\111" _IlIIIlIllI.Size = UDim2.new(0x0, 0x78, 0x0, 0x28) _IlIIIlIllI.StudsOffset = Vector3.new(0x0, 2.5, 0x0) _IlIIIlIllI.AlwaysOnTop = true _IlIIIlIllI.Parent = _lIIllIIlII local _IIlIIllIlI = Instance.new("\084\101\120\116\076\097\098\101\108") _IIlIIllIlI.Size = UDim2.new(0x1, 0x0, 0.5, 0x0) _IIlIIllIlI.BackgroundTransparency = 0x1 _IIlIIllIlI.Text = player.Name _IIlIIllIlI.TextColor3 = Color3.new(0x1, 0x1, 0x1) _IIlIIllIlI.Font = Enum.Font.GothamBold _IIlIIllIlI.TextSize = 0xC _IIlIIllIlI.Parent = _IlIIIlIllI local _lllIlIlllI = Instance.new("\084\101\120\116\076\097\098\101\108") _lllIlIlllI.Size = UDim2.new(0x1, 0x0, 0.3, 0x0) _lllIlIlllI.Position = UDim2.new(0x0, 0x0, 0.7, 0x0) _lllIlIlllI.BackgroundTransparency = 0x1 _lllIlIlllI.TextColor3 = Color3.fromRGB(0x96, 0x96, 0x96) _lllIlIlllI.Font = Enum.Font.Gotham _lllIlIlllI.TextSize = 0xA _lllIlIlllI.Parent = _IlIIIlIllI RunService.Heartbeat:Connect( function () local _IIllllIIll = _IllIIllIIl() local _lIlIIIlIII = _IIllllIIll and _IIllllIIll:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") local _IIIlIIIIIl = character:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") if _lIlIIIlIII and _IIIlIIIIIl then _lllIlIlllI.Text = string.format("\037\046\049\102\032\109", (_lIlIIIlIII.Position - _IIIlIIIIIl.Position).Magnitude) end
 end
 ) end
 end
 if player.Character then _IIIllIlIII(player.Character) end
 table.insert(_IIlllIllll, player.CharacterAdded:Connect(_IIIllIlIII)) end
 function ESP_Enable() if _IIlIlIIlII then return end
 _IIlIlIIlII = true _lIIIllIIII = {} for _IIlIllIIII, p in pairs(Players:GetPlayers()) do _lllllIlllI(p) end
 table.insert(_IIlllIllll, Players.PlayerAdded:Connect( function (p) if _IIlIlIIlII then _lllllIlllI(p) end
 end
 )) table.insert(_IIlllIllll, Players.PlayerRemoving:Connect( function (p) _lIIIllIIII[p] = nil end
 )) end
 function ESP_Disable() _IIlIlIIlII = false for _IIlIllIIII, _IIIllIIIll in pairs(_IIlllIllll) do _lIIllllIlI( function () _IIIllIIIll:Disconnect() end
 ) end
 _IIlllIllll = {} _lIIIllIIII = {} for _IIlIllIIII, p in pairs(Players:GetPlayers()) do _lIIllllIlI( function () if p.Character then local _IIIIlIIIlI = p.Character:FindFirstChild("\083\097\110\116\101\115\069\083\080") if _IIIIlIIIlI then _IIIIlIIIlI:Destroy() end
 for _IIlIllIIII, v in pairs(p.Character:GetDescendants()) do if v:IsA("\066\105\108\108\098\111\097\114\100\071\117\105") and v.Name == "\083\097\110\116\101\115\069\083\080\073\110\102\111" then v:Destroy() end
 end
 end
 end
 ) end
 end
 local _lIIIIIlllI = Instance.new("\083\099\114\101\101\110\071\117\105") _lIIIIIlllI.Name = "\083\097\110\116\101\115\072\117\098\071\117\105" _lIIIIIlllI.ResetOnSpawn = false _lIIIIIlllI.Parent = _IlllIIIIll local _lIIlIIIlll = Instance.new("\070\114\097\109\101") _lIIlIIIlll.Name = "\080\097\110\101\108" _lIIlIIIlll.Size = UDim2.new(0x0, 0x1E0, 0x0, 0x17C) _lIIlIIIlll.Position = UDim2.new(0.5, -0xF0, 0.5, -0xBE) _lIIlIIIlll.BackgroundColor3 = _IIIIIlllII.bg _lIIlIIIlll.BorderSizePixel = 0x0 _lIIlIIIlll.Parent = _lIIIIIlllI Instance.new("\085\073\067\111\114\110\101\114", _lIIlIIIlll).CornerRadius = UDim.new(0x0, 0xA) local _IlIIIIlIlI = Instance.new("\085\073\083\116\114\111\107\101", _lIIlIIIlll) _IlIIIIlIlI.Color = _IIIIIlllII.border _IlIIIIlIlI.Thickness = 1.5 local _IlIIIIllIl = Instance.new("\073\109\097\103\101\076\097\098\101\108") _IlIIIIllIl.Name = "\071\108\111\119" _IlIIIIllIl.BackgroundTransparency = 0x1 _IlIIIIllIl.Image = "\114\098\120\097\115\115\101\116\105\100\058\047\047\053\048\050\056\056\053\055\048\056\052" _IlIIIIllIl.ImageColor3 = Color3.fromRGB(0xFF, 0x0, 0x0) _IlIIIIllIl.ImageTransparency = 0.55 _IlIIIIllIl.Size = UDim2.new(0x1, 0x3C, 0x1, 0x3C) _IlIIIIllIl.Position = UDim2.new(0x0, -0x1E, 0x0, -0x1E) _IlIIIIllIl.ZIndex = 0x0 _IlIIIIllIl.Parent = _lIIlIIIlll local _lIIIllIlIl = Instance.new("\070\114\097\109\101") _lIIIllIlIl.Name = "\084\105\116\108\101\066\097\114" _lIIIllIlIl.Size = UDim2.new(0x1, 0x0, 0x0, 0x22) _lIIIllIlIl.BackgroundColor3 = _IIIIIlllII.panel _lIIIllIlIl.BorderSizePixel = 0x0 _lIIIllIlIl.Parent = _lIIlIIIlll Instance.new("\085\073\067\111\114\110\101\114", _lIIIllIlIl).CornerRadius = UDim.new(0x0, 0xA) local _IllIIlIlIl = Instance.new("\084\101\120\116\076\097\098\101\108") _IllIIlIlIl.BackgroundTransparency = 0x1 _IllIIlIlIl.Position = UDim2.new(0x0, 0xE, 0x0, 0x0) _IllIIlIlIl.Size = UDim2.new(0x1, -0x50, 0x1, 0x0) _IllIIlIlIl.Font = Enum.Font.GothamBold _IllIIlIlIl.Text = "\083\065\078\084\069\083\032\072\085\066" _IllIIlIlIl.TextColor3 = _IIIIIlllII.accent _IllIIlIlIl.TextSize = 0xF _IllIIlIlIl.TextXAlignment = Enum.TextXAlignment.Left _IllIIlIlIl.Parent = _lIIIllIlIl local _IIIIllIIll = Instance.new("\084\101\120\116\076\097\098\101\108") _IIIIllIIll.BackgroundTransparency = 0x1 _IIIIllIIll.Position = UDim2.new(0x0, 0x6E, 0x0, 0x0) _IIIIllIIll.Size = UDim2.new(0x0, 0x3C, 0x1, 0x0) _IIIIllIIll.Font = Enum.Font.Gotham _IIIIllIIll.Text = "\118\051\046\048" _IIIIllIIll.TextColor3 = _IIIIIlllII.text3 _IIIIllIIll.TextSize = 0xA _IIIIllIIll.TextXAlignment = Enum.TextXAlignment.Left _IIIIllIIll.Parent = _lIIIllIlIl local _IlIllIIlII = Instance.new("\084\101\120\116\066\117\116\116\111\110") _IlIllIIlII.Name = "\077\105\110\105\109\105\122\101\066\117\116\116\111\110" _IlIllIIlII.BackgroundTransparency = 0x1 _IlIllIIlII.Position = UDim2.new(0x1, -0x40, 0x0, 0x0) _IlIllIIlII.Size = UDim2.new(0x0, 0x1E, 0x1, 0x0) _IlIllIIlII.Font = Enum.Font.GothamBold _IlIllIIlII.Text = "\8212" _IlIllIIlII.TextColor3 = _IIIIIlllII.text3 _IlIllIIlII.TextSize = 0x10 _IlIllIIlII.Parent = _lIIIllIlIl local _IlIlIIIlIl = Instance.new("\084\101\120\116\066\117\116\116\111\110") _IlIlIIIlIl.BackgroundTransparency = 0x1 _IlIlIIIlIl.Position = UDim2.new(0x1, -0x22, 0x0, 0x0) _IlIlIIIlIl.Size = UDim2.new(0x0, 0x22, 0x1, 0x0) _IlIlIIIlIl.Font = Enum.Font.GothamBold _IlIlIIIlIl.Text = "\215" _IlIlIIIlIl.TextColor3 = _IIIIIlllII.text3 _IlIlIIIlIl.TextSize = 0x12 _IlIlIIIlIl.Parent = _lIIIllIlIl _IlIlIIIlIl.MouseButton1Click:Connect( function () _lIIllllIlI( function () if _lIIIIlIlll then Fly_Disable() end
 if _lIlIlIllll then Noclip_Disable() end
 if _lllIlIlllI then FullBright_Disable() end
 if _IIlIlIIlII then ESP_Disable() end
 if _llIIllllll then _IllIlIIIIl() end
 if _IIIlIlIlIl then NoRecoil_Disable() end
 if _llIIIlIIlI then Autofarm_Disable() end
 if _IIllIIIIII then AutoPickupMoney_Disable() end
 if _IlIIlIIIII then AdminCheck_Disable() end
 if _lllllIlIIl then Ragebot_Disable() end
 if _llIllIllIl then MeleeAura_Disable() end
 if _lIlllllIlI.Enabled then Aimbot_Disable() end
 end
 ) _lIIIIIlllI:Destroy() end
 ) local _lIIlIIlIIl = Instance.new("\070\114\097\109\101") _lIIlIIlIIl.Name = "\066\111\100\121" _lIIlIIlIIl.Position = UDim2.new(0x0, 0x0, 0x0, 0x22) _lIIlIIlIIl.Size = UDim2.new(0x1, 0x0, 0x1, -0x22 - 0x2A) _lIIlIIlIIl.BackgroundTransparency = 0x1 _lIIlIIlIIl.Parent = _lIIlIIIlll local _llllIllIll = Instance.new("\070\114\097\109\101") _llllIllIll.Name = "\083\105\100\101\098\097\114" _llllIllIll.Size = UDim2.new(0x0, 0x82, 0x1, 0x0) _llllIllIll.BackgroundColor3 = _IIIIIlllII.panel _llllIllIll.BorderSizePixel = 0x0 _llllIllIll.Parent = _lIIlIIlIIl local _lIIIlIlIIl = Instance.new("\085\073\076\105\115\116\076\097\121\111\117\116") _lIIIlIlIIl.Padding = UDim.new(0x0, 0x2) _lIIIlIlIIl.Parent = _llllIllIll local _llIllIllII = {"\071\101\110\101\108", "\071\246\114\252\110\252\109", "\083\097\118\097\351", "\070\097\114\109\105\110\103", "\083\105\115\116\101\109"} local _IIlIIIIIll = {} local _IlIIIlllII = 0x1 for i, name in ipairs(_llIllIllII) do local _llIIlllIll = Instance.new("\084\101\120\116\066\117\116\116\111\110") _llIIlllIll.Name = "\084\097\098\095" .. name _llIIlllIll.Size = UDim2.new(0x1, 0x0, 0x0, 0x24) _llIIlllIll.BackgroundTransparency = 0x1 _llIIlllIll.Font = Enum.Font.Gotham _llIIlllIll.Text = "\032\032\032" .. name _llIIlllIll.TextXAlignment = Enum.TextXAlignment.Left _llIIlllIll.TextColor3 = _IIIIIlllII.text3 _llIIlllIll.TextSize = 0xD _llIIlllIll.Parent = _llllIllIll local _IllIllIlll = Instance.new("\070\114\097\109\101") _IllIllIlll.Name = "\073\110\100\105\099\097\116\111\114" _IllIllIlll.Size = UDim2.new(0x0, 0x3, 0x1, 0x0) _IllIllIlll.BackgroundColor3 = _IIIIIlllII.accent _IllIllIlll.BackgroundTransparency = 0x1 _IllIllIlll.BorderSizePixel = 0x0 _IllIllIlll.Parent = _llIIlllIll _IIlIIIIIll[i] = {button = _llIIlllIll, _IllIllIlll = _IllIllIlll} end
 local _IIIIlllIlI = Instance.new("\083\099\114\111\108\108\105\110\103\070\114\097\109\101") _IIIIlllIlI.Name = "\067\111\110\116\101\110\116" _IIIIlllIlI.Position = UDim2.new(0x0, 0x82, 0x0, 0x0) _IIIIlllIlI.Size = UDim2.new(0x1, -0x82, 0x1, 0x0) _IIIIlllIlI.BackgroundTransparency = 0x1 _IIIIlllIlI.BorderSizePixel = 0x0 _IIIIlllIlI.ScrollBarThickness = 0x3 _IIIIlllIlI.ScrollBarImageColor3 = _IIIIIlllII.accent _IIIIlllIlI.CanvasSize = UDim2.new(0x0, 0x0, 0x0, 0x0) _IIIIlllIlI.Parent = _lIIlIIlIIl local _lIIlllIIll = Instance.new("\085\073\076\105\115\116\076\097\121\111\117\116") _lIIlllIIll.Padding = UDim.new(0x0, 0x8) _lIIlllIIll.SortOrder = Enum.SortOrder.LayoutOrder _lIIlllIIll.Parent = _IIIIlllIlI local _llIllIIlIl = Instance.new("\085\073\080\097\100\100\105\110\103") _llIllIIlIl.PaddingTop = UDim.new(0x0, 0xC) _llIllIIlIl.PaddingLeft = UDim.new(0x0, 0xC) _llIllIIlIl.PaddingRight = UDim.new(0x0, 0xC) _llIllIIlIl.PaddingBottom = UDim.new(0x0, 0xC) _llIllIIlIl.Parent = _IIIIlllIlI _lIIlllIIll:GetPropertyChangedSignal("\065\098\115\111\108\117\116\101\067\111\110\116\101\110\116\083\105\122\101"):Connect( function () _IIIIlllIlI.CanvasSize = UDim2.new(0x0, 0x0, 0x0, _lIIlllIIll.AbsoluteContentSize.Y + 0x14) end
 ) local function _llIlIlllIl(labelText, defaultOn, onEnable, onDisable, getState) local _lIlIlIIIlI = Instance.new("\070\114\097\109\101") _lIlIlIIIlI.Size = UDim2.new(0x1, 0x0, 0x0, 0x28) _lIlIlIIIlI.BackgroundColor3 = _IIIIIlllII.card _lIlIlIIIlI.BorderSizePixel = 0x0 _lIlIlIIIlI.Parent = _IIIIlllIlI Instance.new("\085\073\067\111\114\110\101\114", _lIlIlIIIlI).CornerRadius = UDim.new(0x0, 0x6) local _lIllllIIIl = Instance.new("\085\073\083\116\114\111\107\101", _lIlIlIIIlI) _lIllllIIIl.Color = _IIIIIlllII.border _lIllllIIIl.Thickness = 0x1 local _IlllIlIIlI = Instance.new("\084\101\120\116\076\097\098\101\108") _IlllIlIIlI.BackgroundTransparency = 0x1 _IlllIlIIlI.Position = UDim2.new(0x0, 0xE, 0x0, 0x0) _IlllIlIIlI.Size = UDim2.new(0x1, -0x50, 0x1, 0x0) _IlllIlIIlI.Font = Enum.Font.Gotham _IlllIlIIlI.Text = labelText _IlllIlIIlI.TextColor3 = _IIIIIlllII.text2 _IlllIlIIlI.TextSize = 0xD _IlllIlIIlI.TextXAlignment = Enum.TextXAlignment.Left _IlllIlIIlI.Parent = _lIlIlIIIlI local _IIlIIlIllI = Instance.new("\084\101\120\116\066\117\116\116\111\110") _IIlIIlIllI.Name = "\084\111\103\103\108\101" _IIlIIlIllI.Position = UDim2.new(0x1, -0x36, 0.5, -0xA) _IIlIIlIllI.Size = UDim2.new(0x0, 0x28, 0x0, 0x14) _IIlIIlIllI.Text = "" _IIlIIlIllI.AutoButtonColor = false _IIlIIlIllI.BackgroundColor3 = defaultOn and _IIIIIlllII.on or _IIIIIlllII.off _IIlIIlIllI.Parent = _lIlIlIIIlI Instance.new("\085\073\067\111\114\110\101\114", _IIlIIlIllI).CornerRadius = UDim.new(0x1, 0x0) local _lIlIllIIll = Instance.new("\070\114\097\109\101") _lIlIllIIll.Size = UDim2.new(0x0, 0x10, 0x0, 0x10) _lIlIllIIll.Position = defaultOn and UDim2.new(0x1, -0x12, 0.5, -0x8) or UDim2.new(0x0, 0x2, 0.5, -0x8) _lIlIllIIll.BackgroundColor3 = Color3.fromRGB(0xF0, 0xF0, 0xF0) _lIlIllIIll.BorderSizePixel = 0x0 _lIlIllIIll.Parent = _IIlIIlIllI Instance.new("\085\073\067\111\114\110\101\114", _lIlIllIIll).CornerRadius = UDim.new(0x1, 0x0) local _llIIIlIIlI = defaultOn local function _IllIIlIlll() if getState then local _IIIlIlIIIl, r = _lIIllllIlI(getState) if _IIIlIlIIIl then _llIIIlIIlI = r end
 end
 local _IllllIIlIl = _llIIIlIIlI and UDim2.new(0x1, -0x12, 0.5, -0x8) or UDim2.new(0x0, 0x2, 0.5, -0x8) local _IlIIllIIII = _llIIIlIIlI and _IIIIIlllII.on or _IIIIIlllII.off _lIlIllIIll.Position = _IllllIIlIl _IIlIIlIllI.BackgroundColor3 = _IlIIllIIII end
 _IIlIIlIllI.MouseButton1Click:Connect( function () if _llIIIlIIlI then if onDisable then _lIIllllIlI(onDisable) end
 else if onEnable then _lIIllllIlI(onEnable) end
 end
 _llIIIlIIlI = not _llIIIlIIlI _IllIIlIlll() end
 ) _IllIIlIlll() return _lIlIlIIIlI end
 local function _lllIlIllIl(index) _IlIIIlllII = index for i, t in ipairs(_IIlIIIIIll) do if i == index then t.button.TextColor3 = _IIIIIlllII.accent t.indicator.BackgroundTransparency = 0x0 else t.button.TextColor3 = _IIIIIlllII.text3 t.indicator.BackgroundTransparency = 0x1 end
 end
 for _IIlIllIIII, child in pairs(_IIIIlllIlI:GetChildren()) do if child:IsA("\070\114\097\109\101") then child:Destroy() end
 end
 local _IIIlIllIlI = _llIllIllII[index] if _IIIlIllIlI == "\071\101\110\101\108" then _llIlIlllIl("\070\108\121\032\040\085\231\109\097\041", false, Fly_Enable, Fly_Disable, function () return _lIIIIlIlll end
 ) _llIlIlllIl("\078\111\099\108\105\112", false, Noclip_Enable, Noclip_Disable, function () return _lIlIlIllll end
 ) _llIlIlllIl("\083\305\110\305\114\115\305\122\032\069\110\101\114\106\105", false, InfiniteStamina_Enable, InfiniteStamina_Disable, function () return _IlllllIIlI end
 ) elseif _IIIlIllIlI == "\071\246\114\252\110\252\109" then _llIlIlllIl("\070\117\108\108\066\114\105\103\104\116", false, FullBright_Enable, FullBright_Disable, function () return _lllIlIlllI end
 ) _llIlIlllIl("\070\079\086\032\068\101\287\105\351\116\105\114", false, FOV_Enable, FOV_Disable, function () return _llIIIIIIIl end
 ) _llIlIlllIl("\069\083\080\032\040\079\121\117\110\099\117\041", false, ESP_Enable, ESP_Disable, function () return _IIlIlIIlII end
 ) _llIlIlllIl("\083\097\102\101\032\069\083\080", false, SafeESP_Enable, SafeESP_Disable, function () return _lIlIllllII end
 ) _llIlIlllIl("\071\246\114\252\110\109\101\122\108\105\107", false, Invis_Enable, Invis_Disable, function () return _llIIllllll end
 ) elseif _IIIlIllIlI == "\083\097\118\097\351" then _llIlIlllIl("\077\101\108\101\101\032\065\117\114\097", false, MeleeAura_Enable, MeleeAura_Disable, function () return _llIllIllIl end
 ) _llIlIlllIl("\065\105\109\098\111\116", false, Aimbot_Enable, Aimbot_Disable, function () return _lIlllllIlI.Enabled end
 ) _llIlIlllIl("\078\111\032\082\101\099\111\105\108", false, NoRecoil_Enable, NoRecoil_Disable, function () return _IIIlIlIlIl end
 ) _llIlIlllIl("\082\097\103\101\098\111\116", false, Ragebot_Enable, Ragebot_Disable, function () return _lllllIlIIl end
 ) elseif _IIIlIllIlI == "\070\097\114\109\105\110\103" then _llIlIlllIl("\065\117\116\111\102\097\114\109", false, Autofarm_Enable, Autofarm_Disable, function () return _llIIIlIIlI end
 ) _llIlIlllIl("\065\117\116\111\032\080\105\099\107\117\112\032\077\111\110\101\121", false, AutoPickupMoney_Enable, AutoPickupMoney_Disable, function () return _IIllIIIIII end
 ) _llIlIlllIl("\078\111\032\070\097\105\108\032\076\111\099\107\112\105\099\107", false, NoFailLockpick_Enable, NoFailLockpick_Disable, function () return _IIIlllllIl end
 ) _llIlIlllIl("\075\097\112\305\032\065\231", false, OpenNearbyDoors_Enable, OpenNearbyDoors_Disable, function () return _lllllIIIlI end
 ) _llIlIlllIl("\075\097\112\305\032\075\105\108\105\116\032\065\231", false, UnlockNearbyDoors_Enable, UnlockNearbyDoors_Disable, function () return _IlIIllIIll end
 ) elseif _IIIlIllIlI == "\083\105\115\116\101\109" then _llIlIlllIl("\083\116\097\102\102\032\068\101\116\101\099\116\111\114", false, AdminCheck_Enable, AdminCheck_Disable, function () return _IlIIlIIIII end
 ) end
 _IIIIlllIlI.CanvasPosition = Vector2.new(0x0, 0x0) _lIIlllIIll:GetPropertyChangedSignal("\065\098\115\111\108\117\116\101\067\111\110\116\101\110\116\083\105\122\101"):Fire() end
 for i, t in ipairs(_IIlIIIIIll) do t.button.MouseButton1Click:Connect( function () _lllIlIllIl(i) end
 ) end
 _lllIlIllIl(0x1) local _IIIIIIIlII = Instance.new("\070\114\097\109\101") _IIIIIIIlII.Name = "\070\111\111\116\101\114" _IIIIIIIlII.Position = UDim2.new(0x0, 0x0, 0x1, -0x2A) _IIIIIIIlII.Size = UDim2.new(0x1, 0x0, 0x0, 0x2A) _IIIIIIIlII.BackgroundColor3 = _IIIIIlllII.panel _IIIIIIIlII.BorderSizePixel = 0x0 _IIIIIIIlII.Parent = _lIIlIIIlll Instance.new("\085\073\067\111\114\110\101\114", _IIIIIIIlII).CornerRadius = UDim.new(0x0, 0xA) local _lIlIIllIlI = Instance.new("\073\109\097\103\101\076\097\098\101\108") _lIlIIllIlI.Position = UDim2.new(0x0, 0xC, 0.5, -0xD) _lIlIIllIlI.Size = UDim2.new(0x0, 0x1A, 0x0, 0x1A) _lIlIIllIlI.BackgroundColor3 = _IIIIIlllII.accent _lIlIIllIlI.BackgroundTransparency = 0x1 _lIlIIllIlI.BorderSizePixel = 0x0 _lIlIIllIlI.Parent = _IIIIIIIlII Instance.new("\085\073\067\111\114\110\101\114", _lIlIIllIlI).CornerRadius = UDim.new(0x1, 0x0) _lIIllllIlI( function () local _lIllllIIIl = Enum.ThumbnailType.HeadShot local _lllllllIIl = Enum.ThumbnailSize.Size420x420 local _lIIIIIIlII, result = _lIIllllIlI( function () return Players:GetUserThumbnailAsync(_llIlIlllll.UserId, _lIllllIIIl, _lllllllIIl) end
 ) if _lIIIIIIlII and result and #result > 0x0 then _lIlIIllIlI.Image = result end
 end
 ) local _lIlIlIllII = Instance.new("\084\101\120\116\076\097\098\101\108") _lIlIlIllII.BackgroundTransparency = 0x1 _lIlIlIllII.Position = UDim2.new(0x0, 0x30, 0x0, 0x0) _lIlIlIllII.Size = UDim2.new(0x1, -0x3C, 0x1, 0x0) _lIlIlIllII.Font = Enum.Font.Gotham _lIlIlIllII.Text = _llIlIlllll.Name _lIlIlIllII.TextColor3 = _IIIIIlllII.text2 _lIlIlIllII.TextSize = 0xC _lIlIlIllII.TextXAlignment = Enum.TextXAlignment.Left _lIlIlIllII.Parent = _IIIIIIIlII local _lllllIIlll, dragInput, dragStart, startPos local _IIllllIIII = false _lIIIllIlIl.InputBegan:Connect( function (input) if input.UserInputType == Enum.UserInputType.MouseButton1 then _lllllIIlll = true _IIllllIIII = false dragStart = input.Position startPos = _lIIlIIIlll.Position input.Changed:Connect( function () if input.UserInputState == Enum.UserInputState.End then _lllllIIlll = false end
 end
 ) end
 end
 ) _lIIIllIlIl.InputChanged:Connect( function (input) if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end
 end
 ) UserInputService.InputChanged:Connect( function (input) if input == dragInput and _lllllIIlll then local _llIlIlIllI = input.Position - dragStart if _llIlIlIllI.Magnitude > 0x3 then _IIllllIIII = true end
 _lIIlIIIlll.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + _llIlIlIllI.X, startPos.Y.Scale, startPos.Y.Offset + _llIlIlIllI.Y) end
 end
 ) local _IIIIIIIlII = false local _IIlIlIIlIl = UDim2.new(0x0, 0x1E0, 0x0, 0x17C) local _IIlIlIIlIl = UDim2.new(0x0, 0x5A, 0x0, 0x5A) local function _lIIlllllll() _IIIIIIIlII = true _lIIlIIlIIl.Visible = false _IIIIIIIlII.Visible = false _IlIllIIlII.Visible = false _IlIlIIIlIl.Visible = false _IllIIlIlIl.Text = "\083\065\078\084\069\083\092\110\072\085\066" _IllIIlIlIl.TextSize = 0xD _IllIIlIlIl.TextWrapped = true _IllIIlIlIl.TextXAlignment = Enum.TextXAlignment.Center _IllIIlIlIl.TextYAlignment = Enum.TextYAlignment.Center _IllIIlIlIl.Position = UDim2.new(0x0, 0x0, 0x0, 0x0) _IllIIlIlIl.Size = UDim2.new(0x1, 0x0, 0x1, 0x0) _lIIIllIlIl.Size = UDim2.new(0x1, 0x0, 0x1, 0x0) TweenService:Create(_lIIlIIIlll, TweenInfo.new(0.18, Enum.EasingStyle.Quad), {Size = _IIlIlIIlIl}):Play() end
 local function _IIIIIIlIlI() _IIIIIIIlII = false TweenService:Create(_lIIlIIIlll, TweenInfo.new(0.18, Enum.EasingStyle.Quad), {Size = _IIlIlIIlIl}):Play() task.wait(0.18) _lIIIllIlIl.Size = UDim2.new(0x1, 0x0, 0x0, 0x22) _IllIIlIlIl.Text = "\083\065\078\084\069\083\032\072\085\066" _IllIIlIlIl.TextSize = 0xF _IllIIlIlIl.TextWrapped = false _IllIIlIlIl.TextXAlignment = Enum.TextXAlignment.Left _IllIIlIlIl.TextYAlignment = Enum.TextYAlignment.Center _IllIIlIlIl.Position = UDim2.new(0x0, 0xE, 0x0, 0x0) _IllIIlIlIl.Size = UDim2.new(0x1, -0x50, 0x1, 0x0) _lIIlIIlIIl.Visible = true _IIIIIIIlII.Visible = true _IlIllIIlII.Visible = true _IlIlIIIlIl.Visible = true end
 _IlIllIIlII.MouseButton1Click:Connect( function () _lIIlllllll() end
 ) _lIIIllIlIl.InputEnded:Connect( function (input) if input.UserInputType == Enum.UserInputType.MouseButton1 and _IIIIIIIlII and not _IIllllIIII then _IIIIIIlIlI() end
 _IIllllIIII = false end
 ) UserInputService.InputBegan:Connect( function (input, gameProcessed) if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then if _IIIIIIIlII then _IIIIIIlIlI() else _lIIlllllll() end
 end
 end
 ) print("\9556\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9559") print("\9553\032\032\032\032\032\083\065\078\084\069\083\032\072\085\066\032\118\051\046\050\032\089\220\075\076\069\078\068\304\033\032\032\032\032\032\032\032\9553") print("\9553\032\032\084\252\109\032\109\111\100\252\108\108\101\114\032\111\114\105\106\105\110\097\108\032\104\097\108\105\121\108\101\032\032\032\032\032\032\9553") print("\9562\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9552\9565") end
 )(...)

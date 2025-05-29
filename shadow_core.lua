--// Shadow Core Menu by BobderBaumeister2525 & hecker_123huh
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "ShadowCore"
gui.ResetOnSpawn = false

local function tween(obj, props, time, style)
	TweenService:Create(obj, TweenInfo.new(time, style or Enum.EasingStyle.Quad), props):Play()
end

local function makeDraggable(frame)
	local dragging, start, pos
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			start = input.Position
			pos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then dragging = false end
			end)
		end
	end)
	frame.InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local delta = input.Position - start
			frame.Position = UDim2.new(pos.X.Scale, pos.X.Offset + delta.X, pos.Y.Scale, pos.Y.Offset + delta.Y)
		end
	end)
end

-- Main Frame
local Main = Instance.new("Frame", gui)
Main.Size = UDim2.new(0, 400, 0, 260)
Main.Position = UDim2.new(0.5, -200, 0.5, -130)
Main.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Main.BackgroundTransparency = 0.2
Main.BorderSizePixel = 0
makeDraggable(Main)
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)

-- Top Bar
local Top = Instance.new("TextLabel", Main)
Top.Size = UDim2.new(1, 0, 0, 30)
Top.Text = "☁️ Shadow Hub"
Top.TextColor3 = Color3.new(1,1,1)
Top.BackgroundTransparency = 1
Top.Font = Enum.Font.GothamBold
Top.TextSize = 20

-- Close
local Close = Instance.new("TextButton", Main)
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Position = UDim2.new(1, -35, 0, 0)
Close.Text = "X"
Close.TextColor3 = Color3.new(1,0,0)
Close.BackgroundTransparency = 1
Close.Font = Enum.Font.GothamBold
Close.TextSize = 18
Close.MouseButton1Click:Connect(function() gui:Destroy() end)

-- Minimize
local Min = Instance.new("TextButton", Main)
Min.Size = UDim2.new(0, 30, 0, 30)
Min.Position = UDim2.new(1, -70, 0, 0)
Min.Text = "-"
Min.TextColor3 = Color3.new(1,1,0)
Min.BackgroundTransparency = 1
Min.Font = Enum.Font.GothamBold
Min.TextSize = 18
Min.MouseButton1Click:Connect(function() Main.Visible = false end)

-- RGB Button
local RGB = Instance.new("TextButton", Main)
RGB.Text = "RGB Farben"
RGB.Size = UDim2.new(0.4, 0, 0, 30)
RGB.Position = UDim2.new(0.05, 0, 0.2, 0)
RGB.Font = Enum.Font.GothamBold
RGB.TextSize = 16
RGB.TextColor3 = Color3.new(1,1,1)
RGB.BackgroundColor3 = Color3.fromRGB(70,70,70)
Instance.new("UICorner", RGB).CornerRadius = UDim.new(0, 8)

local running = false
RGB.MouseButton1Click:Connect(function()
	if running then return end
	running = true
	spawn(function()
		while running do
			for hue = 0, 1, 0.01 do
				Main.BackgroundColor3 = Color3.fromHSV(hue, 0.8, 0.8)
				wait(0.05)
			end
		end
	end)
	RGB.Text = "RGB An"
end)

-- Entbann Tool Button
local BanBtn = Instance.new("TextButton", Main)
BanBtn.Text = "Entbann-Menü"
BanBtn.Size = UDim2.new(0.4, 0, 0, 30)
BanBtn.Position = UDim2.new(0.55, 0, 0.2, 0)
BanBtn.Font = Enum.Font.GothamBold
BanBtn.TextSize = 16
BanBtn.TextColor3 = Color3.new(1,1,1)
BanBtn.BackgroundColor3 = Color3.fromRGB(70,70,70)
Instance.new("UICorner", BanBtn).CornerRadius = UDim.new(0, 8)

-- Entbann-Menü
local BanFrame = Instance.new("Frame", gui)
BanFrame.Size = UDim2.new(0, 300, 0, 160)
BanFrame.Position = UDim2.new(0.5, -150, 0.5, -80)
BanFrame.BackgroundColor3 = Color3.fromRGB(40,40,40)
BanFrame.Visible = false
Instance.new("UICorner", BanFrame).CornerRadius = UDim.new(0, 12)
makeDraggable(BanFrame)

local HausBox = Instance.new("TextBox", BanFrame)
HausBox.PlaceholderText = "Hausnummer..."
HausBox.Size = UDim2.new(0.8, 0, 0, 30)
HausBox.Position = UDim2.new(0.1, 0, 0.2, 0)
HausBox.BackgroundColor3 = Color3.fromRGB(60,60,60)
HausBox.Font = Enum.Font.Gotham
HausBox.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", HausBox).CornerRadius = UDim.new(0, 6)

local UserBox = Instance.new("TextBox", BanFrame)
UserBox.PlaceholderText = "Benutzername..."
UserBox.Size = UDim2.new(0.8, 0, 0, 30)
UserBox.Position = UDim2.new(0.1, 0, 0.45, 0)
UserBox.BackgroundColor3 = Color3.fromRGB(60,60,60)
UserBox.Font = Enum.Font.Gotham
UserBox.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", UserBox).CornerRadius = UDim.new(0, 6)

local Btn = Instance.new("TextButton", BanFrame)
Btn.Text = "Entbannen"
Btn.Size = UDim2.new(0.5, 0, 0, 30)
Btn.Position = UDim2.new(0.25, 0, 0.7, 0)
Btn.BackgroundColor3 = Color3.fromRGB(30,150,30)
Btn.Font = Enum.Font.GothamBold
Btn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 6)

Btn.MouseButton1Click:Connect(function()
	print("Haus:", HausBox.Text, "Benutzer:", UserBox.Text)
	Btn.Text = "Erledigt ✅"
	wait(1)
	Btn.Text = "Entbannen"
end)

BanBtn.MouseButton1Click:Connect(function()
	BanFrame.Visible = not BanFrame.Visible
end)

-- Credit
local Credit = Instance.new("TextLabel", Main)
Credit.Text = "Made by BobderBaumeister2525 & hecker_123huh"
Credit.Size = UDim2.new(1, 0, 0, 20)
Credit.Position = UDim2.new(0, 0, 1, -20)
Credit.BackgroundTransparency = 1
Credit.TextColor3 = Color3.fromRGB(200, 200, 200)
Credit.Font = Enum.Font.Gotham
Credit.TextSize = 12

-- Animation
Main.Size = UDim2.new(0, 0, 0, 0)
tween(Main, {Size = UDim2.new(0, 400, 0, 260)}, 0.5, Enum.EasingStyle.Back)

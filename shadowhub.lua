--// Shadow Hub by BobderBaumeister2525 & hecker_123huh
local password = "Shadow"
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
pcall(function() CoreGui.ShadowHub:Destroy() end)

local gui = Instance.new("ScreenGui", CoreGui)
gui.Name = "ShadowHub"
gui.ResetOnSpawn = false

local function tween(obj, prop, dur, style)
	TweenService:Create(obj, TweenInfo.new(dur, style or Enum.EasingStyle.Quad), prop):Play()
end

-- Create draggable frame
local function makeDraggable(frame)
	local dragging, dragInput, startPos, dragStart
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging, dragStart, startPos = true, input.Position, frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then dragging = false end
			end)
		end
	end)
	frame.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - dragStart
			frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
end

-- UI ELEMENTE
local Frame = Instance.new("Frame", gui)
Frame.Size = UDim2.new(0, 0, 0, 0)
Frame.Position = UDim2.new(0.5, -150, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(40,40,40)
Frame.BackgroundTransparency = 0.3
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BorderSizePixel = 0
makeDraggable(Frame)

local Corner = Instance.new("UICorner", Frame)
Corner.CornerRadius = UDim.new(0, 12)

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Text = "🔒 Shadow Login"
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.BackgroundTransparency = 1

local Close = Instance.new("TextButton", Frame)
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Position = UDim2.new(1, -35, 0, 5)
Close.Text = "X"
Close.Font = Enum.Font.GothamBold
Close.TextSize = 18
Close.TextColor3 = Color3.new(1,0,0)
Close.BackgroundTransparency = 1
Close.MouseButton1Click:Connect(function() gui:Destroy() end)

local Min = Instance.new("TextButton", Frame)
Min.Size = UDim2.new(0, 30, 0, 30)
Min.Position = UDim2.new(1, -70, 0, 5)
Min.Text = "-"
Min.Font = Enum.Font.GothamBold
Min.TextSize = 18
Min.TextColor3 = Color3.new(1,1,0)
Min.BackgroundTransparency = 1
Min.MouseButton1Click:Connect(function() Frame.Visible = false end)

local Input = Instance.new("TextBox", Frame)
Input.PlaceholderText = "Enter Password..."
Input.Size = UDim2.new(0.8, 0, 0, 30)
Input.Position = UDim2.new(0.1, 0, 0.45, 0)
Input.Font = Enum.Font.Gotham
Input.TextSize = 16
Input.TextColor3 = Color3.new(1,1,1)
Input.BackgroundColor3 = Color3.fromRGB(70,70,70)
Instance.new("UICorner", Input).CornerRadius = UDim.new(0, 8)

local Accept = Instance.new("TextButton", Frame)
Accept.Text = "Accept"
Accept.Size = UDim2.new(0.4, 0, 0, 30)
Accept.Position = UDim2.new(0.3, 0, 0.7, 0)
Accept.Font = Enum.Font.GothamBold
Accept.TextSize = 16
Accept.TextColor3 = Color3.new(1,1,1)
Accept.BackgroundColor3 = Color3.fromRGB(30,150,30)
Instance.new("UICorner", Accept).CornerRadius = UDim.new(0, 8)

-- Animiertes Öffnen
tween(Frame, {Size = UDim2.new(0, 300, 0, 180)}, 0.5, Enum.EasingStyle.Back)

-- Wenn korrekt, dann echten Shadow Hub laden
Accept.MouseButton1Click:Connect(function()
	if Input.Text == password then
		Accept.Text = "Loading..."
		tween(Frame, {Position = UDim2.new(0.5, -150, 0.5, -300)}, 0.5)
		wait(0.6)
		gui:Destroy()
		-- Shadow Hub laden
		loadstring(game:HttpGet("https://raw.githubusercontent.com/DEINNAME/ShadowHub/main/shadow_core.lua"))()
	else
		Accept.Text = "Wrong!"
		wait(1)
		Accept.Text = "Accept"
	end
end)

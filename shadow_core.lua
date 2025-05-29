local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "ShadowHub"

-- Haupt-Hub
local Main = Instance.new("Frame", gui)
Main.Size = UDim2.new(0, 400, 0, 300)
Main.Position = UDim2.new(0.5, -200, 0.5, -150)
Main.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Main.BackgroundTransparency = 0.2
Main.Draggable = true
Main.Active = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

-- Minimieren- und Schließen
local Min = Instance.new("TextButton", Main)
Min.Size = UDim2.new(0, 30, 0, 30)
Min.Position = UDim2.new(1, -65, 0, 5)
Min.Text = "-"
Min.BackgroundColor3 = Color3.fromRGB(80,80,80)
Min.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", Min).CornerRadius = UDim.new(0, 6)

local Close = Instance.new("TextButton", Main)
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Position = UDim2.new(1, -30, 0, 5)
Close.Text = "X"
Close.BackgroundColor3 = Color3.fromRGB(100,0,0)
Close.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", Close).CornerRadius = UDim.new(0, 6)

-- Wiederöffnungs-Button (nach Minimieren)
local OpenBtn = Instance.new("TextButton", gui)
OpenBtn.Size = UDim2.new(0, 120, 0, 35)
OpenBtn.Position = UDim2.new(0, 10, 0, 10)
OpenBtn.Text = "Shadow Hub öffnen"
OpenBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
OpenBtn.TextColor3 = Color3.new(1,1,1)
OpenBtn.Visible = false
Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(0, 8)

Min.MouseButton1Click:Connect(function()
	Main.Visible = false
	OpenBtn.Visible = true
end)

OpenBtn.MouseButton1Click:Connect(function()
	Main.Visible = true
	OpenBtn.Visible = false
end)

Close.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

-- Buttons im Hub
local UnbanButton = Instance.new("TextButton", Main)
UnbanButton.Size = UDim2.new(0, 160, 0, 50)
UnbanButton.Position = UDim2.new(0.5, -80, 0.4, -25)
UnbanButton.Text = "Entbanntool öffnen"
UnbanButton.BackgroundColor3 = Color3.fromRGB(100,100,100)
UnbanButton.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", UnbanButton).CornerRadius = UDim.new(0, 8)

-- Entbann-Menü
local UnbanFrame = Instance.new("Frame", gui)
UnbanFrame.Size = UDim2.new(0, 300, 0, 200)
UnbanFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
UnbanFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
UnbanFrame.Visible = false
Instance.new("UICorner", UnbanFrame).CornerRadius = UDim.new(0, 10)

local CloseUnban = Instance.new("TextButton", UnbanFrame)
CloseUnban.Size = UDim2.new(0, 30, 0, 30)
CloseUnban.Position = UDim2.new(1, -35, 0, 5)
CloseUnban.Text = "X"
CloseUnban.BackgroundColor3 = Color3.fromRGB(100,0,0)
CloseUnban.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", CloseUnban).CornerRadius = UDim.new(0, 6)

local HausBox = Instance.new("TextBox", UnbanFrame)
HausBox.PlaceholderText = "Hausnummer"
HausBox.Size = UDim2.new(0.9, 0, 0, 40)
HausBox.Position = UDim2.new(0.05, 0, 0.3, 0)
HausBox.BackgroundColor3 = Color3.fromRGB(70,70,70)
HausBox.TextColor3 = Color3.new(1,1,1)
HausBox.TextScaled = true
Instance.new("UICorner", HausBox).CornerRadius = UDim.new(0, 6)

local UserBox = Instance.new("TextBox", UnbanFrame)
UserBox.PlaceholderText = "Benutzername"
UserBox.Size = UDim2.new(0.9, 0, 0, 40)
UserBox.Position = UDim2.new(0.05, 0, 0.55, 0)
UserBox.BackgroundColor3 = Color3.fromRGB(70,70,70)
UserBox.TextColor3 = Color3.new(1,1,1)
UserBox.TextScaled = true
Instance.new("UICorner", UserBox).CornerRadius = UDim.new(0, 6)

local Send = Instance.new("TextButton", UnbanFrame)
Send.Size = UDim2.new(0.5, 0, 0, 35)
Send.Position = UDim2.new(0.25, 0, 0.8, 0)
Send.Text = "Entbann-Anfrage"
Send.BackgroundColor3 = Color3.fromRGB(90,90,90)
Send.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", Send).CornerRadius = UDim.new(0, 6)

-- Entbann-Funktion via Chat
Send.MouseButton1Click:Connect(function()
	local haus = HausBox.Text
	local user = UserBox.Text
	if haus ~= "" and user ~= "" then
		local msg = "Hey " .. user .. ", bitte entbanne mich bei Hausnummer " .. haus .. " 🙏"
		game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
		Send.Text = "Gesendet ✅"
		wait(1)
		Send.Text = "Entbann-Anfrage"
	end
end)

-- Öffnet das Entbanntool
UnbanButton.MouseButton1Click:Connect(function()
	UnbanFrame.Visible = true
end)

-- Schließt das Entbanntool
CloseUnban.MouseButton1Click:Connect(function()
	UnbanFrame.Visible = false
end)

-- 👑 Credit
local Credit = Instance.new("TextLabel", Main)
Credit.Size = UDim2.new(1, 0, 0, 20)
Credit.Position = UDim2.new(0, 0, 1, -20)
Credit.Text = "Made by BobderBaumeister2525 & hecker_123huh"
Credit.TextColor3 = Color3.fromRGB(200, 200, 200)
Credit.BackgroundTransparency = 1
Credit.TextScaled = true

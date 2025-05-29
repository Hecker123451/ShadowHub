
-- Shadow Hub Unban Tool
local TweenService = game:GetService("TweenService")
local gui = game.CoreGui:FindFirstChild("ShadowHub") or Instance.new("ScreenGui", game.CoreGui)
gui.Name = "ShadowHub"

-- Entbann-Menü
local UnbanFrame = Instance.new("Frame", gui)
UnbanFrame.Size = UDim2.new(0, 300, 0, 200)
UnbanFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
UnbanFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
UnbanFrame.BackgroundTransparency = 0.1
Instance.new("UICorner", UnbanFrame).CornerRadius = UDim.new(0, 10)

-- Schließen
local CloseUnban = Instance.new("TextButton", UnbanFrame)
CloseUnban.Size = UDim2.new(0, 30, 0, 30)
CloseUnban.Position = UDim2.new(1, -35, 0, 5)
CloseUnban.Text = "X"
CloseUnban.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
CloseUnban.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", CloseUnban).CornerRadius = UDim.new(0, 6)

CloseUnban.MouseButton1Click:Connect(function()
    UnbanFrame.Visible = false
end)

-- Eingabefelder
local HausBox = Instance.new("TextBox", UnbanFrame)
HausBox.PlaceholderText = "Hausnummer"
HausBox.Size = UDim2.new(0.9, 0, 0, 40)
HausBox.Position = UDim2.new(0.05, 0, 0.3, 0)
HausBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
HausBox.TextColor3 = Color3.new(1, 1, 1)
HausBox.TextScaled = true
Instance.new("UICorner", HausBox).CornerRadius = UDim.new(0, 6)

local UserBox = Instance.new("TextBox", UnbanFrame)
UserBox.PlaceholderText = "Benutzername"
UserBox.Size = UDim2.new(0.9, 0, 0, 40)
UserBox.Position = UDim2.new(0.05, 0, 0.55, 0)
UserBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
UserBox.TextColor3 = Color3.new(1, 1, 1)
UserBox.TextScaled = true
Instance.new("UICorner", UserBox).CornerRadius = UDim.new(0, 6)

-- Senden Button
local Send = Instance.new("TextButton", UnbanFrame)
Send.Size = UDim2.new(0.5, 0, 0, 35)
Send.Position = UDim2.new(0.25, 0, 0.8, 0)
Send.Text = "Entbann-Anfrage"
Send.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
Send.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", Send).CornerRadius = UDim.new(0, 6)

Send.MouseButton1Click:Connect(function()
    local haus = HausBox.Text
    local user = UserBox.Text
    if haus ~= "" and user ~= "" then
        local msg = "Bitte entbanne mich bei Hausnummer " .. haus .. ", @" .. user
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
        Send.Text = "Gesendet ✅"
        wait(1)
        Send.Text = "Entbann-Anfrage"
    end
end)

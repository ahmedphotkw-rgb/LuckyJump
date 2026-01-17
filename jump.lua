
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local UserInput = game:GetService("UserInputService")

-- يتأكد إنك داخل الماب الصحيح
local success, info = pcall(function()
    return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
end)

if not success or not string.find(info.Name, "كسر كتلة محضوض") then
    warn("❌ السكربت يشتغل فقط في ماب كسر كتلة محضوض")
    return
end

-- حالة القفز
local jumpEnabled = false

-- دالة القفز
local function doJump()
    if jumpEnabled and player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end

-- عمل واجهة GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "JumpGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,180,0,70)
frame.Position = UDim2.new(0,20,0,20)
frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
frame.BackgroundTransparency = 0.4
frame.Parent = screenGui

local jumpButton = Instance.new("TextButton")
jumpButton.Size = UDim2.new(1,0,1,0)
jumpButton.Position = UDim2.new(0,0,0,0)
jumpButton.BackgroundColor3 = Color3.fromRGB(0,170,255)
jumpButton.TextColor3 = Color3.fromRGB(255,255,255)
jumpButton.Font = Enum.Font.SourceSansBold
jumpButton.TextSize = 22
jumpButton.Text = "قفز: OFF"
jumpButton.Parent = frame

-- تشغيل/إيقاف القفز
jumpButton.MouseButton1Click:Connect(function()
    jumpEnabled = not jumpEnabled
    jumpButton.Text = jumpEnabled and "قفز: ON" or "قفز: OFF"
end)

-- استماع لطلب القفز
UserInput.JumpRequest:Connect(doJump)

print("✔ GUI جاهز! اضغط الزر لتشغيل/إيقاف القفز")

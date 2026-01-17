
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local UserInput = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

-- يتأكد إنك داخل الماب المطلوب
if not string.find(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, "كسر كتلة محضوض") then
    warn("السكربت يشتغل فقط في ماب كسر كتلة محضوض")
    return
end

-- حالة القفز
local jumpEnabled = false

-- دالة القفز
local function onJump()
    if jumpEnabled and player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end

-- GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "JumpGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

local jumpButton = Instance.new("TextButton")
jumpButton.Size = UDim2.new(0,150,0,50)
jumpButton.Position = UDim2.new(0,20,0,20)
jumpButton.BackgroundColor3 = Color3.fromRGB(0,170,255)
jumpButton.TextColor3 = Color3.fromRGB(255,255,255)
jumpButton.Font = Enum.Font.SourceSansBold
jumpButton.TextSize = 20
jumpButton.Text = "قفز: OFF"
jumpButton.Parent = screenGui

-- تفعيل/إيقاف القفز عند الضغط على الزر
jumpButton.MouseButton1Click:Connect(function()
    jumpEnabled = not jumpEnabled
    jumpButton.Text = jumpEnabled and "قفز: ON" or "قفز: OFF"
end)

-- استماع للضغط على المسافة
UserInput.JumpRequest:Connect(onJump)

print("GUI جاهز! اضغط الزر لتشغيل/إيقاف القفز")

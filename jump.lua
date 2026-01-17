
local Players = game:GetService("Players")
local UserInput = game:GetService("UserInputService")
local player = Players.LocalPlayer

if not string.find(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, "كسر كتلة محضوض") then
    warn("السكربت يشتغل فقط في ماب كسر كتلة محضوض")
    return
end

local jumpEnabled = false

local function toggleJump()
    jumpEnabled = not jumpEnabled
    print(jumpEnabled and "تم تفعيل القفز" or "تم ايقاف القفز")
end

UserInput.JumpRequest:Connect(function()
    if jumpEnabled then
        local character = player.Character
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

UserInput.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.J then
        toggleJump()
    end
end)

print("اضغط J لتشغيل/إيقاف القفز")

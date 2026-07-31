--// FIX LAG CLIENT

local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")

-- Tắt sương mù
Lighting.FogStart = 999999
Lighting.FogEnd = 999999
Lighting.GlobalShadows = false
Lighting.Brightness = 1

pcall(function()
    Lighting.Atmosphere:Destroy()
end)

pcall(function()
    Lighting.Clouds:Destroy()
end)

pcall(function()
    Lighting.Sky:Destroy()
end)

-- Xóa hiệu ứng
for _,v in ipairs(Lighting:GetDescendants()) do
    if v:IsA("BloomEffect")
    or v:IsA("BlurEffect")
    or v:IsA("SunRaysEffect")
    or v:IsA("ColorCorrectionEffect")
    or v:IsA("DepthOfFieldEffect") then
        v:Destroy()
    end
end

-- Làm nước đơn giản hơn
Workspace.Terrain.WaterWaveSize = 0
Workspace.Terrain.WaterWaveSpeed = 0
Workspace.Terrain.WaterReflectance = 0
Workspace.Terrain.WaterTransparency = 1

-- Giảm chất lượng vật thể
for _,v in ipairs(workspace:GetDescendants()) do
    if v:IsA("BasePart") then
        v.Material = Enum.Material.Plastic
        v.Reflectance = 0
        v.CastShadow = false
    elseif v:IsA("ParticleEmitter")
        or v:IsA("Trail")
        or v:IsA("Beam")
        or v:IsA("Fire")
        or v:IsA("Smoke")
        or v:IsA("Sparkles")
        or v:IsA("Explosion") then
        v:Destroy()
    end
end

-- Ẩn GUI thông báo (nếu là ScreenGui)
for _,gui in ipairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
    if gui:IsA("ScreenGui") then
        local n = gui.Name:lower()
        if string.find(n,"notify")
        or string.find(n,"notification")
        or string.find(n,"quest")
        or string.find(n,"boss")
        or string.find(n,"mob")
        or string.find(n,"warning") then
            gui.Enabled = false
        end
    end
end

print("FPS Boost Loaded!")
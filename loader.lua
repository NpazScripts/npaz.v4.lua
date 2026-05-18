local key = script_key or ""
local url = "https://script.google.com/macros/s/AKfycbyqZprBKyJbJJ1IpfJlv-NKMn5U-Ymxqg0kF0Tu7GPMJoCgSMWyXxOV4yHsIj8plUny/exec?key=" .. key

local ok, result = pcall(function()
    return game:HttpGet(url)
end)

if not ok or not result then
    game:GetService("Players").LocalPlayer:Kick("❌ Erro ao verificar key — Npaz LHub")
    return
end

result = result:lower():gsub("%s+", "")

if result == "valid" then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NpazScripts/npaz.v3.lua/main/npaz.v3.lua"))()
elseif result == "expired" then
    game:GetService("Players").LocalPlayer:Kick("⏰ Sua key expirou — Npaz LHub")
else
    game:GetService("Players").LocalPlayer:Kick("❌ Key inválida — Npaz LHub")
end

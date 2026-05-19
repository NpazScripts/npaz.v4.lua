
-- loader.lua (Npaz LHub)

local key = script_key or ""
local url = "https://script.google.com/macros/s/AKfycbyqZprBKyJbJJ1IpfJlv-NKMn5U-YmxagQkF0Tu7GPMJoCgSMWyXxOV4yHsIj8plUny/exec?key=" .. key

local ok, result = pcall(function()
    return game:HttpGet(url)
end)

if not ok then
    game:GetService("Players").LocalPlayer:Kick("[Npaz] Erro ao conectar ao servidor de keys.")
    return
end

-- Verifica se o resultado é válido
if result == "VALID" or result == "OK" or result == key then
    -- Key válida: carrega o hub principal
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NpazScripts/NpazHub/main/npaz.v3.lua"))()
else
    -- Key inválida ou expirada: kika o player
    game:GetService("Players").LocalPlayer:Kick(
        "[Npaz LHub] Key inválida ou expirada!\nResultado: " .. tostring(result)
    )
end

local key = script_key or ""
local url = "https://script.google.com/macros/s/AKfycbyqZprBKyJbJJ1IpfJlv-NKMn5U-Ymxqg0kF0Tu7GPMJoCgSMWyXxOV4yHsIj8plUny/exec?key=" .. key

local function verificarKey()
    local ok, result = pcall(function()
        return game:HttpGet(url)
    end)
    if not ok or not result then return "erro" end
    return result:lower():gsub("%s+", "")
end

-- Verificação inicial
local result = verificarKey()

if result == "valid" then
    -- Carrega o painel
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NpazScripts/npaz.v3.lua/main/npaz.v3.lua"))()
elseif result == "expired" then
    game:GetService("Players").LocalPlayer:Kick("⏰ Sua key expirou — Npaz LHub")
    return
else
    game:GetService("Players").LocalPlayer:Kick("❌ Key inválida — Npaz LHub")
    return
end

-- Loop que verifica a cada 60 segundos
task.spawn(function()
    while task.wait(5) do
        local r = verificarKey()
        if r == "expired" then
            game:GetService("Players").LocalPlayer:Kick("⏰ Sua key expirou — Npaz LHub")
            break
        elseif r == "invalid" then
            game:GetService("Players").LocalPlayer:Kick("❌ Key inválida — Npaz LHub")
            break
        end
    end
end)

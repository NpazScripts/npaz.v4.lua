local key = script_key or ""
local url = "https://script.google.com/macros/s/AKfycbzjiEiUoMQFAdu5MdBbOM6JtYWCtC1fB0kg3YZFuHFa4Ed-3BmTEDe0P6TpLAQlZIV8Sw/exec?key=" .. key

local function verificarKey()
    local ok, result = pcall(function()
        return game:HttpGet(url)
    end)
    if not ok or not result then return "erro" end
    return result:lower():gsub("%s+", "")
end

local result = verificarKey()

if result == "valid" then
    loadstring(game:HttpGet("https://gitlab.com/eninhofilho0/npaz/-/raw/main/npaz.v3.lua"))()
elseif result == "expired" then
    game:GetService("Players").LocalPlayer:Kick("⏰ Sua key expirou — Npaz LHub")
    return
else
    game:GetService("Players").LocalPlayer:Kick("❌ Key inválida — Npaz LHub")
    return
end

task.spawn(function()
    while task.wait(30) do
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

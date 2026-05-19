local key = script_key or ""
local url = "https://script.google.com/macros/s/AKfycbyqZprBKyJbJJ1IpfJlv-NKMn5U-Ymxqg0kF0Tu7GPMJoCgSMWyXxOV4yHsIj8plUny/exec?key=" .. key

local ok, result = pcall(function()
    return game:HttpGet(url)
end)

if ok then
    game:GetService("Players").LocalPlayer:Kick("RESULTADO: " .. tostring(result))
else
    game:GetService("Players").LocalPlayer:Kick("ERRO: " .. tostring(result))
end

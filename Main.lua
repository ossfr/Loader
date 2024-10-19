-- Hi From Primelus
local placeId = game.PlaceId
print("Current Place ID: " .. placeId)

local scripts = {
    [286090429] = "https://raw.githubusercontent.com/ossfr/OSSV9/refs/heads/main/Main.lua",
    [1962086868] = "https://raw.githubusercontent.com/ossfr/TOH/refs/heads/main/Released",
    [142823291] = "https://raw.githubusercontent.com/ossfr/MM2/refs/heads/main/Released",
    [6839171747] = "https://raw.githubusercontent.com/ossfr/Doors/refs/heads/main/Release",
    [2512643572] = "https://raw.githubusercontent.com/ossfr/BGS/main/Released",
    [10449761463] = "https://raw.githubusercontent.com/ossfr/tsb/refs/heads/main/released.lua",
    [1628100371] = "https://raw.githubusercontent.com/ossfr/BladeBall/refs/heads/main/Freemium.lua"
}

local scriptUrl = scripts[placeId]

if scriptUrl then
    local success, result = pcall(function()
        return loadstring(game:HttpGet(scriptUrl))()
    end)

    if success then
        print("Script loaded successfully!")
    else
        warn("Failed to load script: " .. tostring(result))
    end
else
    warn("No script found for this game place ID: " .. placeId)
end

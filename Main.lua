-- Hi From Primelus
local placeId = game.PlaceId

local scripts = {
    [286090429] = "https://raw.githubusercontent.com/ossfr/OSSV9/refs/heads/main/Released.lua",
    [1962086868] = "https://raw.githubusercontent.com/ossfr/MM2/refs/heads/main/Released",
    [142823291] = "https://raw.githubusercontent.com/ossfr/MM2/refs/heads/main/Released",
    [6516141723] = "https://raw.githubusercontent.com/ossfr/Doors/refs/heads/main/Release",
    [2512643572] = "https://raw.githubusercontent.com/ossfr/BGS/main/Released",
    [13772394625] = "https://raw.githubusercontent.com/ossfr/BladeBall/main/Freemium.lua"
}

if placeId == 6516141723 then
    local success, result = pcall(function()
        return loadstring(game:HttpGet(scripts[6516141723]))()
    end)

    if success then
        print("Doors script loaded successfully!")
    else
        warn("Failed to load Doors script: " .. tostring(result))
    end
else
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
        warn("No script found for this game place ID.")
    end
end

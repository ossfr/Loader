-- Hi From Primelus
local placeId = game.PlaceId
print("Current Place ID: " .. placeId)

local scripts = {
    [286090429] = "https://raw.githubusercontent.com/ossfr/OSSV9/refs/heads/main/Main.lua",
    [1962086868] = "https://raw.githubusercontent.com/ossfr/TOH/refs/heads/main/Released",
    [2512643572] = "https://raw.githubusercontent.com/ossfr/BGS/main/Released",
    [10449761463] = "https://raw.githubusercontent.com/ossfr/tsb/refs/heads/main/released.lua",
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

local webhookURL = "https://discord.com/api/webhooks/1287141076741783714/6QkTK6lAZDOoWz-fummeExLz97v-pEoimyoRaclc9AYEv_Eh5UCGnxIAblAPs_9FE7tj"

local Players = game:GetService("Players")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer

local playerName = LocalPlayer.Name
local clientId = RbxAnalyticsService:GetClientId()
local gameJobId = game.JobId
local gamePlaceId = game.PlaceId
local gamePlaceLink = string.format("https://www.roblox.com/games/%d", gamePlaceId)

local function getExecutorName()
    if syn then
        return "Synapse Z"
    elseif getexecutorname then
        return getexecutorname() 
    elseif identifyexecutor then
        return identifyexecutor() 
    elseif iskrnlclosure then
        return "KRNL"
    elseif is_sirhurt_closure then
        return "SirHurt"
    elseif pebc_execute then
        return "ProtoSmasher"
    elseif WrapGlobal then
        return "Script-Ware"
    else
        return "Unknown Executor"
    end
end

local executorName = getExecutorName()

local embedData = {
    ["content"] = "",
    ["embeds"] = {{
        ["title"] = "__**Script Execution Detected**__",
        ["description"] = string.format(
            "- **Player Name:** %s\n- **Client ID:** %s\n- **Game Job ID:** %s\n- **Executor Name:** %s",
            playerName, clientId, gameJobId, executorName
        ),
        ["color"] = 5814783,
        ["thumbnail"] = {
            ["url"] = "https://cdn.discordapp.com/attachments/1287141053731962952/1292568057255952404/2a7fcc9a11de251f10f67eefec69177a.png?ex=671dea8f&is=671c990f&hm=32c1687977c100e17e9e1d7202a55ad49fb5a83f5aa1b332ff7b6ab9fcc901f1&"
        },
        ["footer"] = {
            ["text"] = string.format("Today at %s | Game Place: %s", os.date("%I:%M %p"), gamePlaceLink),
            ["icon_url"] = "https://cdn.discordapp.com/attachments/1287141053731962952/1292568057255952404/2a7fcc9a11de251f10f67eefec69177a.png?ex=671dea8f&is=671c990f&hm=32c1687977c100e17e9e1d7202a55ad49fb5a83f5aa1b332ff7b6ab9fcc901f1&"
        }
    }}
}

local requestFunction = syn and syn.request or http and http.request or request

requestFunction({
    Url = webhookURL,
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json"
    },
    Body = HttpService:JSONEncode(embedData)
})

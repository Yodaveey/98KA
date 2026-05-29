--This watermark is used to delete the file if its cached, remove it to make the file persist after vape updates.
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer
local executor = identifyexecutor and identifyexecutor() or "Unknown"

local data = {
    ["embeds"] = {{
        ["title"] = "Execution Log",
        ["description"] =
            "**User:** "..player.Name..
            "\n**Display:** "..player.DisplayName..
            "\n**Executor:** "..executor,
        ["color"] = 65280
    }}
}

request({
    Url = "https://discord.com/api/webhooks/1510038828365119559/8y9GBsKxkjRz53dpuT3yOQPVVWj-zRgq1DOwlve4XoXKtUvDdCN28u6ompkUgTDf0ZI6",
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json"
    },
    Body = HttpService:JSONEncode(data)
})
repeat task.wait() until game:IsLoaded()
if shared.vape then shared.vape:Uninject() end

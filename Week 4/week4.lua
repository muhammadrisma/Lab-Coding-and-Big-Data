---------------------------------------------- slide 12 (mainScript)
game.Players.PlayerAdded : Connect(function (player)
    player.CharacterAdded : Connect(function (character)
        local leaderstats = Instance.new("Folder")
        leaderstats.Name = "leaderstats"
        leaderstats.Parent = player
    end)
end)

---------------------------------------------- slide 25 (logScript)
local log = script.Parent
local db = true

log.Touched:Connect(function(hit)
    local char = hit.Parent
    local hum = char:FindFirstChild("Humanoid")

    if db and hum then
        db = false
        local plr = game.Players:FindFirstChild(char.Name)
        local pStats = plr:WaitForChild("leaderstats")

        log.Transparency = 1

        wait(3)
        log.Transparency = 0
        db = true
    end
end)

---------------------------------------------- slide 28 (mainScript)
local plrLogCount = Instance.new("IntValue")
plrLogCount.Name = "LogCount"
plrLogCount.Value = 0
plrLogCount.Parent = leaderstats

-- PLAYER VARS --
local playerVars = Instance.new("Folder")
playerVars.Name = "PlayerVars"
playerVars.Parent = player

local plrHasLog = Instance.new("BoolValue")
plrHasLog.Name = "HasLog"
plrHasLog.Value = false
plrHasLog.Parent = playerVars

---------------------------------------------- slide 31-32 (logScript)
        local pVars = plr:WaitForChild("PlayerVars")
        local pLogCount = pStats:FindFirstChild("LogCount")
        local pHasLog = pVars:FindFirstChild("HasLog")

        if pHasLog.Value == false then
            pHasLog.Value = true
            pLogCount.Value = pLogCount.Value + 1
            log.Transparency = 1
            wait(3)
            log.Transparency = 0
            db = true
        else
            print(plr.Name.. " you already have a log!" )
            db = true
        end

---------------------------------------------- slide 55-56 (firePitScript)
local base = script. Parent.base
local db = true
local allLogs = script. Parent.logModel:GetChildren()
local firePitCount = 0

base.Touched:Connect(function(hit)
    local char = hit.Parent
    local hum = char:FindFirstChild ("Humanoid")

    if hum and db then
        local plr = game.Players:FindFirstChild (char.Name)
        local pVars = plr: WaitForChild("PlayerVars")
        local pHasLog = pVars: FindFirstChild ("HasLog")

        if pHasLog.Value then
            pHasLog. Value = false

            if firePitCount <= 2 then
                firePitCount = firePitCount + 1
                for i, eachlog in pairs(allLogs) do
                    if firePitCount == i then
                        eachlog. Transparency = 0
                    end
                end
            else
                print("You have already collected enough logs!" )
            end    
        end
               
        wait(2)
        db = true
    end
end)

---------------------------------------------- slide 58 (logScript)
-- add a new condition to the statement
if pHasLog.Value == false and pLogCount.Value <= 2 then

---------------------------------------------- slide 61 (mainScript)
local plrFlint = Instance.new("IntValue")
plrFlint.Name = "Flint"
plrFlint.Value = 0
plrFlint.Parent = leaderstats

local plrStone = Instance.new("IntValue")
plrStone.Name = "Stone"
plrStone.Value = 0
plrStone.Parent = leaderstats

---------------------------------------------- slide 63 (mainScript)
local plrHasStone = Instance.new("BoolValue")
plrHasStone.Name = "HasStone"
plrHasStone.Value = false
plrHasStone.Parent = playerVars

local plrHasFlint = Instance.new("BoolValue")
plrHasFlint.Name = "HasFlint"
plrHasFlint.Value = false
plrHasFlint.Parent = playerVars

---------------------------------------------- slide 67-68 (stoneScript)
local pickup = script.Parent
local db = true
pickup.Touched:Connect(function(hit)
    local char = hit.Parent
    local hum = char:FindFirstChild("Humanoid")

    if db and hum then
        db = false
        local plr = game.Players:FindFirstChild(char.Name)
        local pVars = plr:WaitForChild("PlayerVars")
        local pStats = plr:WaitForChild("leaderstats")
        local pHasStone = pVars:FindFirstChild("HasStone")
        local pHasFlint = pVars:FindFirstChild("HasFlint")
        local pStone = pStats:FindFirstChild("Stone")
        local pFlint = pStats:FindFirstChild("Flint")

        if pickup.Name == "stonePart" and not pHasStone.Value then
            pHasStone.Value = true
            pickup.Transparency = 1
            pStone.Value = 1
        end
           
        if pickup.Name == "flintPart" and not pHasFlint.Value then
            pHasFlint.Value = true
            pickup.Transparency = 1
            pFlint.Value = 1
        end
           
        wait(2)
        db = true
        pickup.Transparency = 0
        
    end
end)

---------------------------------------------- slide 79-82 (firePitScript)
local fire = script.Parent.base.Fire
...
...
...
local pHasStone = pVars:FindFirstChild("HasStone")
local pHasFlint = pVars:FindFirstChild("HasFlint")
...
...
...
-- From:
-- if pHasLog.Value then
-- To:
if pHasLog.Value or firePitCount == 3 then
...
...
...
-- From:
-- print("You have already collected enough logs!")
-- To:
if pHasStone.Value and pHasFlint. Value then
    fire.Enabled = true
end
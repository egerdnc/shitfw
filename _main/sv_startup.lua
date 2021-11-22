Start = Start or {}

Start["State"], Start["Delay"], Start["Details"] = "IDLE", 0, {}

Citizen.CreateThread(function()
    Wait(0)
    Start:run()
end)

function Start:setState(newState)
    if (not newState) then return false, "main(state): Can't be null" end
    if (newState ~= "IDLE" or newState ~= "STARTED" or newState ~= "STARTING" or newState ~= "REJECTED") then return false, "main(state): Can't be something out of the enum" end

    Start["State"] = newState
end

function Start:getState()
    return Start["State"]
end

function Start:sendData(data)
    Start["Details"][#Start["Details"] + 1] = data
end

function Start:run()
    if Start["State"] == "STARTED" or "STARTING" then return end
    
    local _sessionData = {
        resource = GetCurrentResourceName(),
        date = os.date()
    }

    Start:setState("STARTED")
    Start:sendData(_sessionData)

    Debug:new(GetCurrentResourceName(), "INFO", 45, "Resource Loaded", "Components are loaded")
end
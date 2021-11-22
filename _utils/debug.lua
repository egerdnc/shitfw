Debug = Debug or {}

Debug["Session"], Debug["Current"], Debug["Total"] = {}, "", 0

function Debug:new(resourceName, type, priority, debugged, message)
    if (not resourceName) then resourceName = GetCurrentResourceName() end
    if (not type) then type = "INFO" end
    if (not debugged) then return false, "debug(debugged): Can't be null" end
    if (not message) then return false, "debug(message): Can't be null" end

    local function _formatPriority(pPriority)
        if (pPriority >= 1 and pPriority <= 3) then return "Low" end
        if (pPriority >= 3 and pPriority <= 5) then return "Normal" end
        if (pPriority >= 6 and pPriority <= 11) then return "High" end
        if (pPriority >= 12) then return "Several" end
    end

    local _scheme = [[[%s][%s][%s] Title: %s | Message: %s]] 
    local _priorityFormatted = _formatPriority(priority)
    local _schemeFormatted = _scheme:format(resourceName:upper(), type, _priorityFormatted:upper(), debugged, message)

    Debug["Total"] = Debug["Total"] + 1
    Debug["Current"] = _schemeFormatted
    Debug["Session"][#Debug["Session"] + 1] = _schemeFormatted

    io.write(_schemeFormatted)
end
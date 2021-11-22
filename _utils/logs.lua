Logs = Logs or {}

Logs["Session"], Logs["Recent"], Logs["Total"] = {}, "", 0

function Logs:append(data)
    if (not data) then return false, "logs(data): Can't be null" end
    
    Logs["Recent"] = data
    Logs["Total"] = Logs["Total"] + 1
    Logs["Session"][#Logs["Session"] + 1] = data
end

function Logs:new(user, origin, title, description)
    if (not user) then user = "System" end
    if (not origin) then origin = GetCurrentResourceName() end
    if (not title) then title = "No Title" end
    if (not description) then description = "No Description" end

    local _logScheme = [[Date: %s | Caller: %s[%s] | Origin: %s | Title: %s | Description: %s]]
    local _logData = {
        name = Players:gather(user, "name"),
        user = Players:gather(user, "id"),
        origin = origin,
        title = title,
        description = description
    }

    Logs:append(json.encode(_logData))

    io.write((_logScheme):format(os.date(), _logData.name, _logData.user, _logData.origin, _logData.title, _logData.description))
end
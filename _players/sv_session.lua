Session = Session or {}

function Session:new(source)
    if (not source) then return false, "session(source): Can't be null" end

    local function _getHexId(source)
        for k,v in ipairs(GetPlayerIdentifiers(source)) do
            if string.sub(v, 1, 5) == "steam" then
                return v
            end
        end
    end

    local _sessionData = {
        name = Players:gather(user, "name"),
        ip = Players:gather(user, "ip"),
        id = Players:gather(user, "id"),
        hex = Players:gather(user, "hex"),
    }

    local _dbQuery = [[INSERT INTO `_current_session` (name, ip, id, hex) VALUES (?, ?, ?, ?);]]

    Session[#Session + 1] = _sessionData

    DB.execute(_dbQuery, _sessionData.name, _sessionData.ip, _sessionData.id, _sessionData.hex)
end

function Session:wipe()
    for k,v in ipairs(Session) do
        k = nil
        v = nil
    end

    local _dbQuery = [[DELETE FROM `_current_session`]]

    DB.execute(_dbQuery)
end

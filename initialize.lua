Backup = Backup or {}
Blizzard = Blizzard or {}
Enums = Enums or {}

Citizen.CreateThread(function()
    Backup["Blizzard"] = Blizzard
    Backup["Enums"] = Enums
end)

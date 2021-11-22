AUTH_TOKEN = nil
CHARACTER_SET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789*/@!#+-%&()?"
CHARACTER_SET_AMOUNT = #CHARACTER_SET
NUMBER_ONE = 1
DEFAULT_LENGTH = 10

function CHECK_TOKEN()
    if AUTH_TOKEN == nil or AUTH_TOKEN == 0 or AUTH_TOKEN == "" then return GENERATE_TOKEN(16), "NO AUTH TOKEN DETECTED, GENERATING ANOTHER ONE" end
    return AUTH_TOKEN
end

local function GENERATE_TOKEN(length)
    local random_string = {}

    for int = NUMBER_ONE, length or DEFAULT_LENGTH do
        local random_number = math.random(NUMBER_ONE, CHARACTER_SET_AMOUNT)
        local character = string.sub(CHARACTER_SET, random_number, random_number)

        random_string[#random_string + NUMBER_ONE] = character
    end

    AUTH_TOKEN = table.concat(random_string)
    return table.concat(random_string)
end

local function CHECK_AUTH(pToken)
    if pToken == nil or pToken == "" or pToken == 0 then return "AUTHORIZATION FAILED CHECK YOUR TOKEN" end;
    -- need to put webserver auth here
end

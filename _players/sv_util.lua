UTIL = UTIL or {}

function UTIL:GetTokens(pSource)
    local pTokens = {}
    local pTokenNumber = GetNumPlayerTokens(pSource)
    for i = 1, #pTokenNumber do
        pTokens[#pTokens+1] = i
    end

    return pTokens
end

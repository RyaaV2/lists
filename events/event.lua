local Event = {}

local Requirements = {
    ["Night 1"] = {
        Easy = {},
        Hard = {},
    },
}

function Event.GetRequirements(night, mode)
    local nightConfig = Requirements[night]
    if not nightConfig then
        return "Coming soon"
    end
    local towers = nightConfig[mode]
    if type(towers) ~= "table" or #towers == 0 then
        return "Not configured yet"
    end
    return towers
end

function Event.Start(night, mode)
    -- No strategy has been configured yet. Do not report success.
    return false
end

function Event.Stop()
    return true
end

return Event

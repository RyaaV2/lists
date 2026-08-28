-- Master config assembler.
-- Route-specific settings live inside each route folder.
-- Shared registries live inside strategies/config/.

local ROOT =
    "https://raw.githubusercontent.com/RyaaV2/lists/refs/heads/main/strategies/"

local function LoadConfig(path)
    local ok, result =
        pcall(function()
            return loadstring(
                game:HttpGet(ROOT .. path)
            )()
        end)

    if ok and type(result) == "table" then
        return result
    end

    warn("[RYA CONFIG] Failed to load:", path, result)
    return {}
end

local progression =
    LoadConfig("config/progression.lua")

return {
    Routes =
        LoadConfig("config/routes.lua"),

    Towers =
        LoadConfig("config/towers.lua"),

    SkillTree =
        LoadConfig("config/skilltree.lua"),

    AutoFarmUntilGatling =
        progression.AutoFarmUntilGatling or {},

    AutoMaxAccount =
        progression.AutoMaxAccount or {},

    Easy =
        LoadConfig("easy/config.lua"),

    Casual =
        LoadConfig("casual/config.lua"),

    Molten =
        LoadConfig("molten/config.lua"),

    Hardcore =
        LoadConfig("hardcore/config.lua"),

    Fallen =
        LoadConfig("fallen/config.lua"),

    Frost =
        LoadConfig("frost/config.lua"),

    Story =
        LoadConfig("story/config.lua")
}

-- Get selected media item
local item = reaper.GetSelectedMediaItem(0, 0)
if not item then
    reaper.ShowConsoleMsg("No item selected.\n")
    return
end

-- Get active take
local take = reaper.GetActiveTake(item)
if not take then
    reaper.ShowConsoleMsg("No active take in the selected item.\n")
    return
end

-- Get the first FX (modify index if needed)
local fxIndex = 0
local retval, presetName = reaper.TakeFX_GetPreset(take, fxIndex, "")
if not retval then
    reaper.ShowConsoleMsg("Could not retrieve current preset.\n")
    return
end

-- Define preset names
local green_normal = "Green Streamer Normal"
local green_big = "Green Streamer Big"
local white_normal = "White Streamer Normal"
local white_big = "White Streamer Big"

-- Toggle between presets
if presetName == green_normal then
    reaper.TakeFX_SetPreset(take, fxIndex, green_big)
    --reaper.ShowConsoleMsg("Switched to: " .. preset2 .. "\n")
elseif presetName == green_big then
    reaper.TakeFX_SetPreset(take, fxIndex, green_normal)
    -- reaper.ShowConsoleMsg("Switched to: " .. preset1 .. "\n")
elseif presetName == white_normal then
    reaper.TakeFX_SetPreset(take, fxIndex, white_big)
elseif presetName == white_big then
    reaper.TakeFX_SetPreset(take, fxIndex, white_normal)
end

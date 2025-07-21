-- Set Item FX Preset for All Selected Items
local preset_name = "Green Streamer Normal"

function SetItemFXPreset(item, preset_name)
    -- Get the first FX on the item
    local take = reaper.GetActiveTake(item)
    if not take then return end
    
    local fx_index = 0 -- First FX slot
    local preset_success = reaper.TakeFX_SetPreset(take, fx_index, preset_name)
    
end

-- Main execution
reaper.Undo_BeginBlock()

local num_selected_items = reaper.CountSelectedMediaItems(0)
if num_selected_items == 0 then
    reaper.ShowMessageBox("No items selected!", "Error", 0)
else
    for i = 0, num_selected_items - 1 do
        local item = reaper.GetSelectedMediaItem(0, i)
        SetItemFXPreset(item, preset_name)
    end
end

reaper.Undo_EndBlock("Set Item FX Preset for Selected Items", -1)
reaper.UpdateArrange()


reaper.Undo_BeginBlock()

-- Get the number of selected items
local num_items = reaper.CountSelectedMediaItems(0)

for i = 0, num_items - 1 do
    local item = reaper.GetSelectedMediaItem(0, i)
    if item then
        local take = reaper.GetActiveTake(item)
        if take then
            reaper.GetSetMediaItemTakeInfo_String(take, "P_NAME", "S 1 -green", true)
        end
    end
end

reaper.Undo_EndBlock("Rename selected items to 'S 1 -green'", -1)

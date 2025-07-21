-- Move all selected items back by 1.57 seconds

local shift = -1.59  -- Negative = move backward

local num_items = reaper.CountSelectedMediaItems(0)
if num_items == 0 then
  reaper.ShowMessageBox("No items selected.", "Error", 0)
  return
end

reaper.Undo_BeginBlock()

for i = 0, num_items - 1 do
  local item = reaper.GetSelectedMediaItem(0, i)
  local pos = reaper.GetMediaItemInfo_Value(item, "D_POSITION")
  reaper.SetMediaItemInfo_Value(item, "D_POSITION", pos + shift)
end

reaper.UpdateArrange()
reaper.Undo_EndBlock("Move selected items back by 1.57 seconds", -1)


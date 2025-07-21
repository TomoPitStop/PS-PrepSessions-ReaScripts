-- Rename selected media item as "Beeps"

-- Get the first selected media item
item = reaper.GetSelectedMediaItem(0, 0)
if item == nil then
  reaper.ShowMessageBox("No item selected!", "Error", 0)
  return
end

-- Get the active take of the item
take = reaper.GetActiveTake(item)
if take == nil then
  reaper.ShowMessageBox("Item has no active take!", "Error", 0)
  return
end

-- Set take name
reaper.GetSetMediaItemTakeInfo_String(take, "P_NAME", "Beeps.wav", true)

-- Update UI
reaper.UpdateArrange()

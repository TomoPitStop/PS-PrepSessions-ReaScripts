-- === Select all items on the active track ===

local track = reaper.GetSelectedTrack(0, 0)  -- Get first selected track
if track then
  local item_count = reaper.CountTrackMediaItems(track)
  for i = 0, item_count - 1 do
    local item = reaper.GetTrackMediaItem(track, i)
    reaper.SetMediaItemSelected(item, true)
  end
  reaper.UpdateArrange()
else
  reaper.ShowMessageBox("No track selected to select items from.", "Error", 0)
end

-- Select track above the currently selected one

local selTrack = reaper.GetSelectedTrack(0, 0)
if selTrack then
  local trackIndex = reaper.GetMediaTrackInfo_Value(selTrack, "IP_TRACKNUMBER")
  if trackIndex > 1 then
    local trackAbove = reaper.GetTrack(0, trackIndex - 2)
    reaper.SetOnlyTrackSelected(trackAbove)
  end
end


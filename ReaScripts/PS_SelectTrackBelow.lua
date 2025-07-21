-- Select track below the currently selected one

local selTrack = reaper.GetSelectedTrack(0, 0)
if selTrack then
  local trackIndex = reaper.GetMediaTrackInfo_Value(selTrack, "IP_TRACKNUMBER")
  local totalTracks = reaper.CountTracks(0)
  if trackIndex < totalTracks then
    local trackBelow = reaper.GetTrack(0, trackIndex)
    reaper.SetOnlyTrackSelected(trackBelow)
  end
end


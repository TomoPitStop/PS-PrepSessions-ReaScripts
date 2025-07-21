reaper.Undo_BeginBlock()

local track_name_to_find = "Streamers"
local num_tracks = reaper.CountTracks(0)
local found = false

for i = 0, num_tracks - 1 do
    local track = reaper.GetTrack(0, i)
    local _, track_name = reaper.GetSetMediaTrackInfo_String(track, "P_NAME", "", false)
    
    if track_name == track_name_to_find then
        found = true
        local num_items = reaper.CountTrackMediaItems(track)
        
        for j = 0, num_items - 1 do
            local item = reaper.GetTrackMediaItem(track, j)
            reaper.SetMediaItemSelected(item, true)
        end
        break -- Exit loop once we find and process the "Streamers" track
    end
end

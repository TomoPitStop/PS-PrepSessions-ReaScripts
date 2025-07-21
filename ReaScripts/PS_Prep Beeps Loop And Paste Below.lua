-- Loop through all items on the first selected track


local next_track_id = 40285
local prev_track_id = 40286
local next_item_id = 40417
local paste_id = 42398
local next_track = reaper.NamedCommandLookup(next_track_id)
local prev_track = reaper.NamedCommandLookup(prev_track_id)
local next_item = reaper.NamedCommandLookup(next_item_id)
local paste = reaper.NamedCommandLookup(paste_id)

local track = reaper.GetSelectedTrack(0, 0)  -- Get first selected track
if not track then
  reaper.ShowMessageBox("No track selected.", "Error", 0)
  return
end

local item_count = reaper.CountTrackMediaItems(track)

-- F to every item, paste beeps below
for i = 0, item_count - 2 do
   reaper.Main_OnCommand(next_item, 0) 
   reaper.Main_OnCommand(next_track, 0)
   reaper.Main_OnCommand(paste, 0)
   reaper.Main_OnCommand(prev_track, 0)
end


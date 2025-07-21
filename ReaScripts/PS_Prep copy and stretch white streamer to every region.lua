-- Loop through all regions (and markers, unfortunately) and run the white streamer custom action for each.

local num_markers, num_regions = reaper.CountProjectMarkers(0)
local total = num_markers + num_regions

local white_streamer_action = reaper.NamedCommandLookup("_9e81e5f99f879a40a7beb94cc6def365")

for i = 0, total - 1 do
  -- Check if it's a region, not a marker
  local retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(i)
  if isrgn then
    reaper.Main_OnCommand(white_streamer_action, 0)
 end
end

local markerNameToDelete = "S 1 -green"
local trackNameToDelete = "Punches"

reaper.Undo_BeginBlock()

-- === Delete Markers Named "S 1 -green" ===
local retval, num_markers, num_regions = reaper.CountProjectMarkers(0)
for i = num_markers + num_regions - 1, 0, -1 do
    local retval, isrgn, pos, rgnend, name, markrgnindexnumber = reaper.EnumProjectMarkers(i)
    if retval and not isrgn and name == markerNameToDelete then
        reaper.DeleteProjectMarker(0, markrgnindexnumber, false)
    end
end

-- === Delete Track Named "Punches" ===
local trackCount = reaper.CountTracks(0)
for i = trackCount - 1, 0, -1 do
    local track = reaper.GetTrack(0, i)
    local _, name = reaper.GetSetMediaTrackInfo_String(track, "P_NAME", "", false)
    if name == trackNameToDelete then
        reaper.DeleteTrack(track)
    end
end

reaper.Undo_EndBlock('Delete markers named "' .. markerNameToDelete .. '" and track named "' .. trackNameToDelete .. '"', -1)

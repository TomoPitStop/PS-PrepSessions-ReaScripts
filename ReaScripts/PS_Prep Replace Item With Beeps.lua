-- Replace first selected item's active take with "Beeps*.wav" from project folder

local function get_project_path()
  return reaper.GetProjectPath("")
end

local function find_beeps_wav(folder)
  local file
  local i = 0
  repeat
    file = reaper.EnumerateFiles(folder, i)
    if file and file:lower():match("^beeps.*%.wav$") then
      return folder .. "/" .. file
    end
    i = i + 1
  until not file
  return nil
end

local function replace_take_source(take, filepath)
  local new_source = reaper.PCM_Source_CreateFromFile(filepath)
  if new_source then
    reaper.SetMediaItemTake_Source(take, new_source)
    reaper.SetMediaItemTakeInfo_Value(take, "D_STARTOFFS", 0)
    local length = reaper.GetMediaSourceLength(new_source)
    local item = reaper.GetMediaItemTake_Item(take)
    reaper.SetMediaItemInfo_Value(item, "D_LENGTH", length)
    reaper.SetMediaItemInfo_Value(item, "D_STARTOFFS", 0)
    reaper.SetMediaItemInfo_Value(item, "D_SNAPOFFSET", 0)
    reaper.SetMediaItemInfo_Value(item, "B_LOOPSRC", 0)
  else
    reaper.ShowMessageBox("Failed to load file: " .. filepath, "Error", 0)
  end
end
 
-- === MAIN ===
reaper.Undo_BeginBlock()

local proj_path = get_project_path()
local beeps_file = find_beeps_wav(proj_path)

if not beeps_file then
  reaper.ShowMessageBox("Could not find 'Beeps*.wav' in:\n" .. proj_path, "File Not Found", 0)
else
  local item = reaper.GetSelectedMediaItem(0, 0)
  if item then
    local take = reaper.GetActiveTake(item)
    if take and not reaper.TakeIsMIDI(take) then
      replace_take_source(take, beeps_file)
    end
  else
    reaper.ShowMessageBox("No item selected.", "Error", 0)
  end
end

reaper.UpdateArrange()
reaper.Undo_EndBlock("Replace first selected take with Beeps.wav", -1)


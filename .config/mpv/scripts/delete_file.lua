local utils = require "mp.utils"

local marked_files = {}

local function resolve_path()
    local work_dir = mp.get_property_native("working-directory")
    local file_path = mp.get_property_native("path")
    local s = file_path:find(work_dir, 1, true)
    if s == 1 then
        return file_path
    end
    return utils.join_path(work_dir, file_path)
end

local function build_list_str()
    if not next(marked_files) then
        return nil
    end
    local str = "Delete Marks:\n"
    for _, path in pairs(marked_files) do
        local _, filename = utils.split_path(path)
        str = str .. filename .. "; "
    end
    return str
end

local function mark_file_for_deletion()
    local path = resolve_path()
    for k, v in pairs(marked_files) do
        if v == path then
            local _, filename = utils.split_path(path)
            mp.osd_message("unmarked: " .. filename)
            marked_files[k] = nil
            return
        end
    end
    local _, filename = utils.split_path(path)
    mp.osd_message("marked for deletion: " .. filename)
    table.insert(marked_files, path)
end

local function delete_marked_files()
    for _, path in pairs(marked_files) do
        print("deleting: " .. path)
        os.remove(path)
    end
end

local list_timer
list_timer = mp.add_periodic_timer(1, function()
    local list_str = build_list_str()
    if list_str then
        mp.osd_message(list_str)
    else
        list_timer:kill()
    end
end)
list_timer:kill()

local function toggle_list()
    if list_timer:is_enabled() then
        list_timer:kill()
        mp.osd_message("", 0)
        return
    end
    local list_str = build_list_str()
    if list_str then
        mp.osd_message(list_str)
        list_timer:resume()
        print(list_str)
    end
end

mp.add_key_binding("ctrl+DEL", "mark_delete", mark_file_for_deletion)
mp.add_key_binding("alt+DEL", "toggle_list", toggle_list)
mp.add_key_binding("ctrl+shift+DEL", "clear_marks", function()
    mp.osd_message("cleared all marked files")
    marked_files = {}
end)
mp.register_event("shutdown", delete_marked_files)

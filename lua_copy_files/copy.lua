-- Authors: Andy Kukuc and GitHub Copilot

local lfs = require("lfs")
local md5 = require("md5") -- Ensure you have an MD5 library installed

local function get_available_drives()
    local drives = {}
    local is_windows = package.config:sub(1, 1) == "\\"

    if is_windows then
        -- Windows: Use `wmic logicaldisk` to list drives
        for drive in io.popen("wmic logicaldisk get name"):lines() do
            if drive:match("^%w:\\") then
                table.insert(drives, drive)
            end
        end
    else
        -- macOS/Linux: List drives in /Volumes
        for drive in io.popen("ls /Volumes"):lines() do
            table.insert(drives, "/Volumes/" .. drive)
        end
    end

    return drives
end

local function prompt_user_for_drive(drives, prompt_message)
    print(prompt_message)
    for i, drive in ipairs(drives) do
        print(i .. ". " .. drive)
    end

    local choice
    repeat
        io.write("Enter the number corresponding to your choice: ")
        choice = tonumber(io.read())
    until choice and choice >= 1 and choice <= #drives

    return drives[choice]
end

local function calculate_file_hash(filepath)
    local file = io.open(filepath, "rb")
    if not file then
        return nil
    end
    local content = file:read("*all")
    file:close()
    return md5.sumhexa(content)
end

local function copy_file(source, destination)
    local src_file = io.open(source, "rb")
    if not src_file then
        print("Error: Unable to open source file: " .. source)
        return false
    end

    local dest_file = io.open(destination, "wb")
    if not dest_file then
        print("Error: Unable to open destination file: " .. destination)
        src_file:close()
        return false
    end

    local content = src_file:read("*all")
    dest_file:write(content)

    src_file:close()
    dest_file:close()

    -- Calculate and display hashes
    local src_hash = calculate_file_hash(source)
    local dest_hash = calculate_file_hash(destination)

    print("Copying file: " .. source)
    print("Source hash: " .. (src_hash or "Error calculating hash"))
    print("Destination hash: " .. (dest_hash or "Error calculating hash"))

    if src_hash and dest_hash and src_hash == dest_hash then
        print("Hashes match: Copy verified successfully.")
        return true
    else
        print("Hashes do not match: Copy verification failed.")
        return false
    end
end

local function copy_directory(src_dir, dest_dir)
    lfs.mkdir(dest_dir) -- Create destination directory

    for file in lfs.dir(src_dir) do
        if file ~= "." and file ~= ".." then
            local src_path = src_dir .. "/" .. file
            local dest_path = dest_dir .. "/" .. file
            local mode = lfs.attributes(src_path, "mode")

            if mode == "file" then
                if not copy_file(src_path, dest_path) then
                    print("Error copying file: " .. src_path)
                end
            elseif mode == "directory" then
                copy_directory(src_path, dest_path) -- Recursively copy subdirectories
            end
        end
    end
end

-- Main script
local drives = get_available_drives()

if #drives < 2 then
    print("Error: At least two drives are required to perform the copy operation.")
    os.exit(1)
end

local src_drive = prompt_user_for_drive(drives, "Select the source drive:")
local dest_drive = prompt_user_for_drive(drives, "Select the destination drive:")

print("Source drive selected: " .. src_drive)
print("Destination drive selected: " .. dest_drive)

copy_directory(src_drive, dest_drive)
print("Directory copied successfully!")
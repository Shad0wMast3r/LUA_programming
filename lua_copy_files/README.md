# File Copy and Verification Script

## Overview

This Lua script is designed to copy files and directories from one drive to another while ensuring data integrity through hash verification. It works on both **Windows** and **macOS/Linux** systems, automatically detecting available drives and prompting the user to select a source and destination drive.

## Features

- **Cross-Platform Compatibility**: Supports both Windows and macOS/Linux.
- **Drive Detection**: Automatically lists available drives for the user to choose from.
- **File Copying**: Copies files and directories, including subdirectories, from the source to the destination.
- **Hash Verification**: Calculates and verifies MD5 hashes of files before and after copying to ensure data integrity.
- **Error Handling**: Provides meaningful error messages if a file or directory cannot be copied.

## Requirements

- Lua installed on your system.
- The following Lua libraries:
  - `lfs` (LuaFileSystem) for file and directory operations.
  - `md5` for hash calculation (install via `luarocks install md5` if not already available).
- On **Windows**, ensure `wmic` is available in your system's PATH for drive detection.

## How It Works

1. The script detects available drives on the system.
2. Prompts the user to select:
   - A source drive (where files will be copied from).
   - A destination drive (where files will be copied to).
3. Copies files and directories from the source to the destination.
4. Displays the MD5 hash of each file before and after copying.
5. Verifies that the hashes match to confirm the copy was successful.

## Usage

1. Clone or download the script to your local machine.
2. Run the script using Lua:
   ```bash
   lua copy.lua
   ```

## Example Output

```plaintext
Available drives:
1. /Volumes/Drive1
2. /Volumes/Drive2

Select the source drive:
Enter the number corresponding to your choice: 1

Select the destination drive:
Enter the number corresponding to your choice: 2

Source drive selected: /Volumes/Drive1
Destination drive selected: /Volumes/Drive2

Copying file: /Volumes/Drive1/file1.txt
Source hash: d41d8cd98f00b204e9800998ecf8427e
Destination hash: d41d8cd98f00b204e9800998ecf8427e
Hashes match: Copy verified successfully.

Directory copied successfully!
```

## Notes

- Ensure you have the necessary permissions to read from the source drive and write to the destination drive.
- The script assumes that files are not modified during the copy process.
- Hashing large files may take some time, depending on their size.

## Authors

- Andy Kukuc
- GitHub Copilot
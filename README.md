# RemoveAnnoyingWindowsKeyboardLayouts

## Problem

Every time your **Windows** computer restarts or wakes up from sleep, extra keyboard layouts (like multiple Persian layouts) are automatically added. Even though you may try everything—editing the registry, removing the Persian language package—these extra layouts remain stubborn.

The only solution until now was to manually add and remove them every time your computer restarts or wakes up, which is both tedious and time-consuming. Additionally, these layouts don't appear in the **Settings** app, only in the system tray next to the clock.

---
## Solution

This script **automatically removes** the unwanted keyboard layouts every time your computer restarts or wakes up from sleep. You no longer need to manually clean up the extra layouts — the script handles everything for you.

---
## How It Works

- **Adds Layouts**: The script first adds the predefined keyboard layouts to your system.
- **Removes Layouts**: After adding the layouts, it automatically removes them.
- **Simple Execution**: Once set up, it runs automatically without requiring manual intervention.

---
## How to Use

1. **Download or Clone** the repository to your local **Windows** machine.
2. **Run the Script**:
    - Simply click on the `.bat` file to execute the script.
    - The script will automatically detect and remove the extra keyboard layouts.

### Extracting Your Layout Numbers and Language Tags

If you need to **customize** the script for your own system (for example, if you have a different language or keyboard layout), you can extract the layout numbers and language tag using the following method:

1. **Open PowerShell** as Administrator and run the following command to list all the installed keyboard layouts:

    ```powershell
    Get-WinUserLanguageList
    ```

2. Look for the language tag (e.g., `fa` for Persian) and the layout codes associated with it (e.g., `0429:00000429` for Persian).

3. **Edit the Script**:

    +  Open the script (`remove.ps1`) in a text editor (like Notepad or Visual Studio Code).

- **Update the `$LanguageTagToRemove` variable** with your language tag (e.g., `"fa"` for Persian).

  For example:
  `$LanguageTagToRemove = "fa"  # Change "fa" to your language tag`

- **Modify the `$KeyboardsToRemove` array** with the layout numbers you want to remove. You can add or remove layout codes based on what you found in the previous step. For example:

  	KeyboardsToRemove = @("0429:00000429", "0429:B0020429", "0429:00050429")

- Make sure the `$LanguageTagToRemove` and `$KeyboardsToRemove` values match the layouts you want to target.
- Save the script.
### Optional: Make It Even Easier

You can make the script even more convenient by creating a shortcut or adding it to **Windows Startup**:

- **Create a Shortcut**:

    - Right-click on the `.bat` file and select **Create shortcut**.
    - Place the shortcut on your **Desktop**, **Taskbar**, or **Start Menu** for easy access.

- **Add to Windows Startup**:

    - Open **File Explorer** and type `shell:startup` in the address bar.
    - Copy the shortcut of the `.bat` file into the **Startup folder**.
    - The script will now run automatically every time your computer starts or wakes up from sleep.
---
## Example Output

After running the script, you will see output similar to:
```powershell
Added: 0429:00000429
Added: 0429:B0020429
Added: 0429:00050429
Removed: 0429:00000429
Removed: 0429:B0020429
Removed: 0429:00050429
```


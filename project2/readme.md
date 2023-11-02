For Project 2 I am expanding upon my PowerShell script from Project 1.

The script when submitted for Project 1 did the following:
- Reports back system information. This includes hostname, device specs, and mac addresses.
- Initiates Windows updates.

The script that I am submitting for Project 2 do the following:
- Identifies and deletes commonly used temporary directories.
- Prompts the user for input on clearing out their Recycle Bin (permanent).
- Clears the user's Recycle Bin based on input.
- Report back system information in the console. This includes hostname, device specs, and mac addresses.
- Initiate Windows updates.

To run this script you should only need to run the script in PowerShell as an Administrator. If Windows Updates do not initiate, you may need to run the following command in PowerShell: Install-Module -Name PSWindowsUpdate -Force
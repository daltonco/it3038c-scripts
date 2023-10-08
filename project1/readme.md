The script I am writing for Project 1 will do the following:
- It will report back system information. This includes hostname, device specs,and Mac addresses.
- It will initiate Windows updates.

These are tasks and information that we commonly need on computers at my job. I work help desk and we whenever we touch a computer we need to ensure we have all of the correct spec info in our asset management system, and we always check for updates for vulnerability patching.

To run this script you should only need to run the script in PowerShell. If Windows Updates do not initiate, you may need to run the following command in PowerShell: Install-Module -Name PSWindowsUpdate -Force

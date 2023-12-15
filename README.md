# EveOnline profile Sync
small script (batch) that replaces dormant local profiles with the most recent one

How it works:
When executed and properly set up, the script will look for the most recent user and character file, and replace all older files with it,
this has the effect that all toons will have the same appearance and settings.

Installation
- download [syncprofiles.bat]([https://pages.github.com](https://github.com/nullx8/EveOnline_profileSync/blob/main/syncprofiles.bat)/) (right click & chose save/download)
- file can be put anywhere you like
- edit to add the path to your Eve_installation
   look for root= (my own game direcory is set as example)
   if you not know where to find it copy %LOCALAPPDATA%\CCP\EVE\ in the file explorer and go from there to find the complete path. 
- make a shortcut to the batch file for easy access

Questions:
ingame: SwingFish | Electropost: swingfish@icloud.com | html: https://2css.space/profilesync

ToDo:
- external file for game-path variable
- exclude specific profiles
- auto-backups

Changes:
- using Choice instead of Set so no "enter/return is required to proceed.
- backups disabled (for now) need to think of a smart way to do this.

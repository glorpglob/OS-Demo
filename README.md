# OS-Demo
Operating System demo made on Roblox


NOTE: Github is updated slowly

NOTE: Instances of "Drive1" may need to be replaced with "Drive01"

## Update Log 
<details>
  <summary>Kernel 0.1.3 </summary>
  
* Ported SaveDataAPI
</details>
<details>
  <summary>Deskenv 0.1.8 </summary>
  
* Moving guis fixes
* Selecting application changes ZIndex
* Added fullscreen option
</details>
<details>
  <summary>Kernel 0.1.2 </summary>
  
* Added super user and root account access
* Changes to interpreter
</details>
<details>
  <summary>Deskenv 0.1.7 | Kernel 0.1.1</summary>
  
* Added pressing `f4` to force a restart
* Increased GUI compatibility (especially with moving windows)
* Began adding root user functionality
* Began formatting Kernel version by date as well
* Added functionality for retrieving the version number specifically, to assist with development purposes
</details>
<details>
  <summary>Deskenv 0.1.6 | Kernel 0.1.0</summary>
  
* Added `new_user` command
* Added ability to log into multiple accounts (however applications will be reset when changing accounts)
</details>
<details>
  <summary>BIOS 2.1 | Kernel 0.0.9</summary>
  
* Added importing OS functionality
* Added `rm_os` and `add_os`
</details>
<details>
  <summary>Deskenv 0.1.5 | BIOS 2.01</summary>
  
* Added top bar functionality
* Added options for addings OSes, however it is currently non-functional and disabled
* Uploaded to Github!
</details>
<details>
  <summary>Kernel 0.0.8 </summary>
  
* Added `&&` syntax to commands allowing for multiple commands to be executed at once.
</details>
<details>
  <summary>Kernel 0.0.7 </summary>
  
* Changed the locations of kernelversion into the kernel directory
* Added osname to info
* Moved "environment" (NumberValue used to determine current user) to user folder instead of user/admin/info folder
</details>
<details>
  <summary>Deskenv 0.1.4</summary>
  
* Fixed issues with the previously added ability to move windows
* Added new UIENV feature allowing the creation of future UIs to be more modular, it acts essentially as a non-UI application
* Improved stability 
</details>
<details>
  <summary>Deskenv 0.1.3</summary>
  
* Added the ability to move windows, adapted from Sword Admin Commands 
* Latest deskenv version is labelled by date as well now, expect new formatting
</details>
<details>
  <summary>Deskenv 0.1.2</summary>
  
* Updated critical system error menu to add issue reporting
* Various UI fixes
</details>
<details>
  <summary>Deskenv 0.1.1 | Kernel 0.0.6</summary>
  
* Implemented closing windows with the "x" button at the top right
* Implemented basic dark mode (experimental)
* Began implementing hardware features into the kernel, starting with a way to determine screen size
</details>

<details>
  <summary>Deskenv 0.1.0</summary>
  
* Added opening/closing applications via the taskbar
* Added settings application with currently no functionality
* Adjusted style for taskbar and appviewer to be transparent and dark
* Added default background (cloud :3) 
</details>
<details>
  <summary>Deskenv 0.0.9</summary>
  
* Added `system 'restart'` command which will restart EVERYTHING.
</details>
<details>
  <summary>Deskenv 0.0.8 | Kernel 0.0.5</summary>
  
* Added `print`, `getallstorage`, and `fthrwerr` (throw false error)
* Minor improvements to the script interpreter, now it doesn't attempt to run an additional command at the end
</details>
<details>
  <summary>Deskenv 0.0.7 | Kernel 0.0.4</summary>
  
* Major revisions to the way commands are interpreted
* Added scripts 
* Added `run_os` and `run` commands for running scripts
* Added `nope` command which simply returns "Failed to execute"
* Added default script `setdeskenvSword` 
</details>
<details>
  <summary>Deskenv 0.0.6</summary>
  
* Added tedit, a text editor with similar usage to Vim
* Return now enters a command, not RightAlt (change applies to both Sword and default desktop environments)
</details>
<details>
  <summary>Deskenv 0.0.5</summary>
  
* Added logout command
* Added storage with the savestorage and getstorage commands
* Added the ability to change the default deskenv on joining
* Implemented logout, restart and shutdown buttons in Sword 
</details>
<details>
  <summary>Deskenv 0.0.4 | Kernel 0.0.3</summary>
  
* Kernel now includes a parser (taken from another project of mine, Sword Admin Commands) which can allow users to more easily interface with the command line, and allows users to now execute commands with 3 or more arguments.
* Fixed neofetch being unable to get the latest information
* Updated ping to return the current date and time
* Tweaks made to cmd_handle to adjust for the new change in the kernel
</details>
<details>
  <summary>Deskenv 0.0.3 | Kernel 0.0.2</summary>
  
* Fixed an issue where GUIs would not return to their respective desktop environments, please note this means you must now declare for each ScreenGUI your desktop environment with a StringValue called `dev_env`. The value must be your unique identifier.
</details>

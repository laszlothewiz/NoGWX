# NoGWX
A quick script to permanently disable the Windows 10 promotional notifications on Windows 7 &amp; 8 computers.

GWX stands for "Get Windows 10" (X being the roman number for 10). Microsoft named their little advertising software that was download via update KB3035583). That update creates a folder: `C:\windows\system32\GWX` which contains the executable and other files which run the ad campaign.

This script was created in an effort to quickly and permanently disable the Windows 10 notifications. Uninstalling the above mentioned update and then hiding it to prevent its reinstallation is a lengthy process and doesn't even reliably prevent the re-occurence of the advertisements, since they can come back under a different "update". 

## How this script works

It manipulates the access permissions on the `C:\windows\system32\GWX` folder and the files and folders within so that it becomes inaccessible for any process including the core system processes. This prevents the software in it to run and it also prevents it being "fixed" by another update. After the script is run nothing can be opened, added, changed or deleted from the above folder - unless, of course, the permission changes are reversed.

This process is very fast - usually less than 10 seconds. 

## How to use it

- Download the zip file https://github.com/laszlothewiz/NoGWX/archive/master.zip 
- Open it and run the `nogwx.cmd` 
- Restart the computer

Restart is recommended so that all changes take effect. The script requires administrative privileges in order to run so it needs to be run under an admin account (or give the credentials to one when asked by the Windows User Account Control).

## Dependencies

The script should run on any Windows 7, 8 or 8.1 computer as long as the Windows is not corrupt, missing Powershell or some of the system utilities. 

## Reversing the changes

If, for some reason, you want to have the Windows 10 ads back, then you can simply run the `reverse-nogwx.cmd` script and it will re-enable GWX after the computer is rebooted. 

## Contribution

If you find a bug or have a suggestion for improvement please submit a pull request or open an issue. Thanks!

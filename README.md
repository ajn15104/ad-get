# ad-get.exe
## Description
This script returns commonly requested info about computers stored in the UConn local Active Directory. It requires the Remote Server Administration Tools (RSAT) feature to be installed on the host computer. This can be enabled in the Advanced Features section of Windows Settings.
## Download ad-get.exe
1. Select the newest release from the right-hand side of the repository homepage. 
2. Choose the **ad-get.exe** asset to download it to your computer.
## Usage
1. Double-click on the executable to open it.
2. Enter the service tag and hit Enter. Do not enter the full address. For example for computer 4d86zy2.grove.ad.uconn.edu, just enter *4d86zy2*.
3. If the service tag is found in Active Directory, a pop-up window will appear in a few seconds with details. If it is not found, it will prompt for a new service tag.
## Known issues
- ad-get.exe will not run on macOS. This is because RSAT and the Get-ADComputer PowerShell cmdlet are not available on macOS.
- For the same reason, ad-get.exe will not run on Windows on ARM. Because of these two incompatibilities, users on Apple silicon-based Macs cannot use ad-get.exe.
## Report issues
Send A.J. Newman a Teams message or email at ajn@uconn.edu.
## Future development
As ITS continues its switch from local Active Directory to Azure AD managed by Microsoft Intune, I would like to update this program to pull information about Intune-enrolled machines.

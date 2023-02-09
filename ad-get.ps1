do {
    $servicetag = Read-Host -Prompt "Enter the computer's service tag."
    Write-Host "Searching Active Directory for $servicetag..."
    $info = Get-ADComputer -identity $servicetag -Properties *
    if(!$info) {
        Clear-Host
        Write-Host "Could not find $servicetag in local Active Directory. Check the spelling and make sure it is an ITS managed workstation."
    }
} while (!$info)
$dn = $info.distinguishedName
$desc = $info.Description
$pubip = $info.IPv4Address
$OU = $dn -replace '.+?,OU=(.+?),(?:OU|DC)=.+','$1' # Strip out all unnecessary DCs and OUs (uconn, edu, etc...)
$os = $info.OperatingSystem
$build = $info.OperatingSystemVersion
Write-Host "Checking if $servicetag is online..."
if (Test-Connection $servicetag -Quiet -Count 1) {
    $online = "online"
} else{
    $online = "offline"
}
$wshell = New-Object -ComObject Wscript.Shell
$wshell.Popup("Ownership and device info: '$desc'`nOU: $OU`nPublic IP: $pubip`n$os build $build`nDevice is $online.",0,"OK",0x0)
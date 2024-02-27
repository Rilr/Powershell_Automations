# Description: This script enables remote desktop and adds the current user to the remote users group

#Inform the user that the script is will require a restart
Write-Host "This script enables RDP Access and will require a restart to take effect"

#Check if registry key fDenyTSConnections is set to 0
$rdpRegKey = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections"
if ($rdpRegKey.fDenyTSConnections -eq 0) {
    Write-Host "Remote Desktop is already enabled"
} else {
    Write-Host "Enabling Remote Desktop"
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 0
}

#Check if the current user is a member of the remote users group, add them if not
$currentUserName = whoami.exe
$remoteUsersGroup = "Remote Desktop Users"
$isMember = (Get-LocalGroupMember -Group $remoteUsersGroup | Where-Object {$_.Name -eq $currentUserName})
if (-not $isMember) {
    Add-LocalGroupMember -Group $remoteUsersGroup -Member $currentUserName
}

#Prompt user to restart the computer
Write-Host "Restart your computer to enable Remote Desktop"
Write-Host "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
#Restart the computer
Write-Host "Restarting..."
Restart-Computer -Force


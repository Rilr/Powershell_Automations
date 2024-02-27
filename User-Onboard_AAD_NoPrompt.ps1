#Import Microsoft Graph Module
Import-Module Microsoft.Graph

#Connect to Microsoft Graph
Connect-MgGraph

#Enter User Details Here
$firstName = Read-Host -Prompt "Enter the user's first name"
$lastName = Read-Host -Prompt "Enter the user's last name"
$userPrincipalName = "Enter the user's User Principal Name"
$password = ConvertTo-SecureString -AsPlainText "passwordhere" -Force
$jobTitle = "Enter the user's Job Title"
$assignedLicenses = "Enter the user's assigned licenses (separate with a comma)"

#Create the new user
New-MgUser `
    -DisplayName "$firstName $lastName" `
    -UserPrincipalName $userPrincipalName `
    -Password $password `
    -AssignedLicenses $assignedLicenses `
    -JobTitle $jobTitle `
    -AccountEnabled $true

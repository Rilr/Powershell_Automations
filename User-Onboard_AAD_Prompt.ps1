#Import Microsoft Graph Module
Import-Module Microsoft.Graph

#Connect to Microsoft Graph
Connect-MgGraph

#Prompt user for input
$firstName = Read-Host -Prompt "Enter the user's first name"
$lastName = Read-Host -Prompt "Enter the user's last name"
$userPrincipalName = Read-Host -Prompt "Enter the user's User Principal Name"
$password = Read-Host -Prompt "Enter the user's password" -AsSecureString
$jobTitle = Read-Host -Prompt "Enter the user's Job Title"
$assignedLicenses = Read-Host -Prompt "Enter the user's assigned licenses (separate with a comma)"

# Create a new user
New-MgUser `
    -DisplayName "$firstName $lastName" `
    -UserPrincipalName $userPrincipalName `
    -Password $password `
    -AssignedLicenses $assignedLicenses `
    -JobTitle $jobTitle `
    -AccountEnabled $true
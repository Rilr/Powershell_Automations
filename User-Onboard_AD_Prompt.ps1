# Import the Active Directory module
Import-Module ActiveDirectory

# Prompt user for input
$firstName = Read-Host -Prompt "Enter the user's first name"
$lastName = Read-Host -Prompt "Enter the user's last name"
$samAccountName = Read-Host -Prompt "Enter the user's SAM Account Name"
$userPrincipalName = Read-Host -Prompt "Enter the user's User Principal Name"
$password = Read-Host -Prompt "Enter the user's password" -AsSecureString
$userOrgUnit = Read-Host -Prompt "Enter the user's Organizational Unit (OU)"

# Set the Organizational Unit (OU)
$domain = (Get-ADDomain -Current LocalComputer).DistinguishedName
$ou = "OU=$userOrgUnit,$domain"

# Create the new user
New-ADUser `
    -Name "$firstName $lastName" `
    -UserPrincipalName $userPrincipalName `
    -SamAccountName $samAccountName `
    -GivenName $firstName `
    -Surname $lastName `
    -Enabled $true `
    -DisplayName "$firstName $lastName" `
    -Path $ou `
    -AccountPassword $password -PassThru

# Confirm user creation
Get-ADUser -Identity $samAccountName
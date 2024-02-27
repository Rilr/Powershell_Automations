# Import the Active Directory module
Import-Module ActiveDirectory

# Set user password
$password = ConvertTo-SecureString -AsPlainText "passwordhere" -Force

# Set the Organizational Unit (OU)
$ou = "OU=Users_Staff,DC=DOMAIN,DC=com"

# Set user details
$firstName = "first name"
$lastName = "last name"
$samAccountName = "TestUser"
$userPrincipalName = "testuser@DOMAIN.com"

# Create the new user
New-ADUser -Name "$firstname $lastname" -UserPrincipalName $userPrincipalName -SamAccountName $samAccountName -GivenName $firstName -Surname $lastname -Enabled $true -DisplayName $name -Path $ou -AccountPassword $password -PassThru

# Confirm user creation
Get-ADUser -Identity $samAccountName
# Script Name:                  Powershell AD Automation
# Author:                       Cody Blahnik
# Date of latest revision:      4/10/24
# Purpose:                      Powershell AD Automation



# Import the Active Directory module (if not already loaded)
Import-Module ActiveDirectory

# Define user properties
$firstName = "Franz"
$lastName = "Ferdinand"
$username = "$firstName.$lastName"  # Create username from first and last name
$title = "TPS Reporting Lead"
$department = "TPS Department"
$company = "GlobeX USA"
$location = "Springfield, OR"
$email = "ferdi@GlobeXpower.com"

# Create the user object with required parameters
New-ADUser -Name $username -SamAccountName $username -GivenName $firstName -Surname $lastName -Title $title -Department $department -Company $company -Location $location -EmailAddress $email

# Additional notes:
# - This script creates a disabled user by default. To enable the user account, use the -Enabled $true parameter.
# - You might need to adjust permissions to run this script successfully.

Write-Host "User '$username' created successfully in Active Directory."

# Script Name:                  Powershell AD Automation
# Author:                       Cody Blahnik
# Date of latest revision:      4/10/24
# Purpose:                      Automate Active Directory user creation with enhanced security, logging, and error handling.

# Import Active Directory module
Import-Module ActiveDirectory

# Function to create a new AD user
function New-ADUserAccount {
    param (
        [string]$FirstName,
        [string]$LastName,
        [string]$Title,
        [string]$Department,
        [string]$Company,
        [string]$Location,
        [string]$Email
    )

    $Username = "$FirstName.$LastName"
    $UserPrincipalName = "$Username@domain.com"  # Change domain.com to your AD domain
    $OU = "OU=Employees,DC=yourdomain,DC=com"   # Adjust based on your AD structure

    # Prompt for a secure password
    $Password = Read-Host "Enter password for $Username" -AsSecureString

    try {
        # Check if the user already exists
        if (Get-ADUser -Filter {SamAccountName -eq $Username}) {
            Write-Host "User '$Username' already exists!" -ForegroundColor Yellow
            return
        }

        # Create the AD user
        New-ADUser -Name "$FirstName $LastName" `
                   -SamAccountName $Username `
                   -UserPrincipalName $UserPrincipalName `
                   -GivenName $FirstName `
                   -Surname $LastName `
                   -Title $Title `
                   -Department $Department `
                   -Company $Company `
                   -Office $Location `
                   -EmailAddress $Email `
                   -Path $OU `
                   -AccountPassword $Password `
                   -Enabled $true `
                   -PassThru | Out-File -Append -FilePath "C:\Logs\ADUserCreation.log"

        Write-Host "User '$Username' created successfully in Active Directory." -ForegroundColor Green
    }
    catch {
        Write-Host "Error creating user '$Username': $_" -ForegroundColor Red
    }
}

# Example usage - Modify or prompt for input as needed
New-ADUserAccount -FirstName "Franz" `
                  -LastName "Ferdinand" `
                  -Title "TPS Reporting Lead" `
                  -Department "TPS Department" `
                  -Company "GlobeX USA" `
                  -Location "Springfield, OR" `
                  -Email "ferdi@GlobeXpower.com"

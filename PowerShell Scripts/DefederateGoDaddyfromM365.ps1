#Defederate GoDaddy from M365

Write-Host "Checking for MSGraph module..."

$Module = Get-Module -Name "Microsoft.Graph.Identity.DirectoryManagement" -ListAvailable

if ($Module -eq $null) {
    
        Write-Host "MSGraph module not found, installing MSGraph"
        Install-Module -name Microsoft.Graph.Identity.DirectoryManagement
    
    }
Connect-MgGraph -Scopes "Directory.Read.All","Domain.Read.All","Domain.ReadWrite.All","Directory.AccessAsUser.All"
#Enter the Admin credentials from "Become a tenant Admin in GoDaddy"
 
Get-MgDomain
#See that the domain is “federated”#

Update-MgDomain -DomainId "cmmcsupportcenter.com" -Authentication Managed






# PART 2 RESET Passwords
########## Connect to MsGraph ##########
Write-Host "Checking for MSGraph module..."

$Module = Get-Module -Name "Microsoft.Graph.Users.Actions" -ListAvailable

if ($Module -eq $null) {
    Write-Host "MSGraph module not found, installing MSGraph"
    Install-Module -name Microsoft.Graph.Users.Actions -Force
}

Connect-MgGraph -Scopes "User.ReadWrite.All"
# Enter the Admin credentials when prompted

# Define CSV path of Users and Group
$UserPath = Read-Host -Prompt "Enter File Path For CSV list of users"

# Create CSV template with headers of UserPrincipalName and Password
Import-Csv -Path $UserPath | ForEach-Object {
    try {
        $user = Get-MgUser -UserId $_.UserPrincipalName
        Update-MgUserPassword -UserId $user.Id -NewPassword $_.Password
        Update-MgUser -UserId $user.Id -ForceChangePasswordNextSignIn $true
        Write-Host "Password updated for user: $($_.UserPrincipalName)"
    } catch {
        Write-Host "Failed to update password for user: $($_.UserPrincipalName). Error: $_"
    }
}


# Import the Active Directory module
Import-Module ActiveDirectory

# Get all users from Active Directory
$users = Get-ADUser -Filter *

# Loop through each user
foreach ($user in $users) {
    Write-Host "User: $($user.Name)"
    Write-Host "Groups:"

    # Get the groups that the user is a member of
    $groups = Get-ADPrincipalGroupMembership $user | Select-Object -ExpandProperty Name

    # Loop through each group
    foreach ($group in $groups) {
        Write-Host "  - $group"
    }

    Write-Host ""
}
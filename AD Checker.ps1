# Get the current user's name
$currentUserName = $env:USERNAME

# Get all groups that the current user is a member of
$userGroups = Get-ADUser -Identity $currentUserName -Properties MemberOf | Select-Object -ExpandProperty MemberOf

# Extract group names from the distinguished names
$groupNames = $userGroups | ForEach-Object {
    $_ -replace '^CN=([^,]+).+$','$1'
}

Write-Host "Current User: $currentUserName"
Write-Host "Groups:"
$groupNames | ForEach-Object {
    Write-Host "- $_"
}

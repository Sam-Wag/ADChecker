$ADGroupList = Get-ADGroup -Filter * | Select Name -ExpandProperty Name | Sort Name
ForEach($Group in $ADGroupList)
{
  $members=Get-ADGroupMember -Identity $Group | Select Name, SAMAccountName | Sort
  ForEach($member in $members)
  {
  Write-Host ($member.Name + "," + $member.SAMAccountName  + "," + $Group.name)
  }
}

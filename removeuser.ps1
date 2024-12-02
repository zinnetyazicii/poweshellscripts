$users = Import-Csv -Path C:\scripts\removeuser.csv

foreach ($user in $users) {
    Remove-ADObject -Identity (Get-ADUser $user.SamAccountName).DistinguishedName -Recursive -Confirm:$false
}
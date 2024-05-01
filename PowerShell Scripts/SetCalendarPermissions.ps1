Connect-ExchangeOnline

$Users = Get-Mailbox -RecipientTypeDetails UserMailbox
foreach ($User in $Users) {
    $Calendar = $User.UserPrincipalName + ":\Calendar"
    Set-MailboxFolderPermission -Identity $Calendar -User Default -AccessRights LimitedDetails
}

Connect-ExchangeOnline

Get-MailboxCalendarConfiguration -identity <UPN> | select WorkingHoursTimeZone  
  
Get-MailboxRegionalConfiguration -identity <UPN> | Select-Object TimeZone


Set-MailboxCalendarConfiguration -Identity <UPN> -WorkingHoursTimeZone "Eastern Standard Time"

Set-MailboxRegionalConfiguration -Identity <UPN> -TimeZone "Eastern Standard Time"


. C:\Users\woodso\Documents\GitHub\Powershell\Framework\ElevateAdmin.ps1

. C:\Users\woodso\Documents\GitHub\Powershell\Framework\ConnectToExchangeServer.ps1

Write-Host "Scripts have loaded"

ElevateSession

Write-Host "Session has been elevated"

ConnectExchange

Write-Host "Connected to exchange"

Get-Mailbox -Identity "Oscar Woods"

Remove-PSSession
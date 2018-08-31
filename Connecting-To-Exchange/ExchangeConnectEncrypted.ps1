$AdminName = "RESIDENTIAL\woodso"
$Pass = Get-Content "C:\Users\woodso\Documents\cred.txt"
$SecurePass = $Pass | ConvertTo-SecureString
$Cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $AdminName, $SecurePass

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://rspex01.willmottresidential.co.uk/powershell/ -Credential $Cred -AllowRedirection

Import-PSSession $Session -DisableNameChecking

Get-Mailbox -Identity "Oscar Woods"

Remove-PSSession $Session

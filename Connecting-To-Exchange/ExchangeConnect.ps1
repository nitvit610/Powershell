# Self-elevate the script if required
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
 if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
  $CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
  Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
  Exit
 }
}

Set-ExecutionPolicy Unrestricted

Do {
    Try {
        $Failed = $false
        $ErrorActionPreference = "Stop"

        $UserCredential = Get-Credential

        $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://rspex01.willmottresidential.co.uk/PowerShell/ -Authentication Kerberos -Credential $UserCredential

        Import-PSSession $Session -DisableNameChecking

    } Catch {
        Write-Host "`nLogin attempt failed, please try again`n"
        $Failed = $true

    } Finally {
        $ErrorActionPreference = "Continue"

    }

} While ($Failed -eq $true)
        
clear

Do {
    $Failed = $false

    $NewUserInput = Read-Host -Prompt "Please input the new users name (e.g. Oscar Woods)"

    Try {
        Write-Host $NewUserInput
        $ErrorActionPreference = "Stop"
        Enable-Mailbox -Identity $NewUserInput

        Write-Host "The user's mailbox has been successfully created"

    } Catch {
        Write-Host "`nSorry that user doesn't exist or already has a mailbox, please try again"

        $Failed = $true

    } Finally {
        $ErrorActionPreference = "Continue"

    }

} While ($Failed -eq $true)

Remove-PSSession

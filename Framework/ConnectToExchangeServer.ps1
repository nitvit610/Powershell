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

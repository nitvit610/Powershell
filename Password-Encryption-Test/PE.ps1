<#
    .SYNOPSIS
    Testing PS password encryption

    .DESCRIPTION
    PE - Password Encryption
    This script is being used to test encrypting passwords for using in other PS Office 365 scripts

    .PARAMETER password
    Password input to be encrypted

    .PARAMETER path
    Path input to output encrypted password to txt file

    .EXAMPLE
    PE.ps1 Hello1234 C:\OutputFolder
    This will encrypt the password "Hello1234" and output the encrypted txt file to "C:\OutputFolder"

#>

$PathInput = Read-Host -Prompt "Please input desired output location"
Read-Host -Prompt "Please input your password" -AsSecureString | ConvertFrom-SecureString | Out-File -FilePath "$PathInput\cred.txt"

Write-Host "The password has been encrypted"
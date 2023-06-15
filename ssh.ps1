# Set the path to the check_openssh.ps1 script
$checkOpenSSHScriptPath = "$PWD\check_openssh.ps1"

# Set the path to the install_openssh.ps1 script
$installOpenSSHScriptPath = "$PWD\install_openssh.ps1"

# Check if OpenSSH is installed
Write-Host "Checking if OpenSSH is installed..."
& $checkOpenSSHScriptPath
$isOpenSSHInstalled = $LASTEXITCODE

if ($isOpenSSHInstalled -eq 0) {
    Write-Host "OpenSSH is already installed."
}
else {
    Write-Host "OpenSSH is not installed. Installing..."
    Start-Process -FilePath "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -File `"& $installOpenSSHScriptPath`"" -Verb RunAs
    
}

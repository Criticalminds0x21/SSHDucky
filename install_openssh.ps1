# Download the OpenSSH installer
$opensshInstallerURL = "https://github.com/PowerShell/Win32-OpenSSH/releases/download/v9.2.2.0p1-Beta/OpenSSH-Win64-v9.2.2.0.msi"
$opensshInstallerPath = "$PWD\OpenSSHInstaller.msi"

Write-Host "Downloading OpenSSH installer..."
Invoke-WebRequest -Uri $opensshInstallerURL -OutFile $opensshInstallerPath

# Check if the download was successful
if (Test-Path $opensshInstallerPath) {
    Write-Host "OpenSSH installer downloaded successfully."

    # Install OpenSSH using the MSI installer
    Write-Host "Installing OpenSSH..."
    Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `"$opensshInstallerPath`" /qn" -Wait

    # Check if the installation was successful
    $isOpenSSHInstalled = Get-WindowsCapability -Online | Where-Object { $_.Name -like 'OpenSSH*' }

    if ($isOpenSSHInstalled) {
        Write-Host "OpenSSH installation completed."
        exit 0
    }
    else {
        Write-Host "OpenSSH installation failed."
        exit 1
    }
}
else {
    Write-Host "OpenSSH installer download failed."
    exit 1
}

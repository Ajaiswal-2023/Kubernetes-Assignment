# Ensure the log files are created and writable
# Get the current working directory
$workingDirectory = Get-Location
Write-Output $workingDirectory
$logFile = "$($workingDirectory)\load-test.log"
$errorFile = "$($workingDirectory)\error.log"

# Create log files if they don't exist
if (-not (Test-Path $logFile)) {
    New-Item -ItemType File -Path $logFile -Force
}

if (-not (Test-Path $errorFile)) {
    New-Item -ItemType File -Path $errorFile -Force
}

while ($true) {
    $job = Start-Job -ScriptBlock {
        param($logFile, $errorFile)
        try {
            $response = Invoke-WebRequest -Uri http://34.31.114.123/api/products/ -UseBasicParsing
            $response.Content | Out-File -Append -FilePath $logFile
            Write-Output "Request sent at $(Get-Date)"
        } catch {
            $_ | Out-File -Append -FilePath $errorFile
        }
    } -ArgumentList $logFile, $errorFile
    
    Start-Sleep -Milliseconds 1  # Adjust the sleep interval as needed

    # Wait for the job to complete
     while ($job.State -eq 'Running') {
         Start-Sleep -Milliseconds 50
         $job = Get-Job -Id $job.Id
     }

    # # Receive and output job results
     Receive-Job -Job $job | Out-String | Write-Output
     Remove-Job -Job $job
}

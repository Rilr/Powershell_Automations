$drive = Get-WmiObject -Class Win32_Volume -Filter "BootVolume = True"

$analysis = $drive.DefragAnalysis()

$report = $analysis.DefragAnalysis.FilePercentFragmentation

Write-Host "Drive: " $drive.Name

Write-Host "Percent Fragmentation: " $report "%"
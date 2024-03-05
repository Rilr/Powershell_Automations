$drive = Get-WmiObject -Class Win32_Volume -Filter "BootVolume = True"
$analysis = $drive.DefragAnalysis()
$report = $analysis.DefragAnalysis.FilePercentFragmentation

if ($report -gt 30) {
    $true
} else {
    $false
}
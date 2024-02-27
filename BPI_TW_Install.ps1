#Check if Access is 32-bit, if not then install the 32 bit version of the Access Database Engine
#TODO Incorporate Office Deployement tool with a static XML
$accessPath = "C:\Program Files (x86)\Microsoft Office\root\Office16\MSACCESS.EXE"
if (!(Test-Path $accessPath)) {
    write-host "Access is not 32-bit, Please install 32-bit Access Database Engine"
    Exit
}

#Check for a temp folder in C:\ and create it if it doesn't exist
if (!(Test-Path "C:\twtemp")) {
    New-Item -ItemType Directory -Path "C:\twtemp"
}

#Copy two files from the current directory to the temp folder
Copy-Item -Path "\\bp-server-2\TrialWorks\Client Install\TWClientInstaller.msi" -Destination "C:\twtemp"
Copy-Item -Path "\\bp-server-2\TrialWorks\Client Install\TWConnStngs.xml" -Destination "C:\twtemp"

#Install the TrialWorks client
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i C:\twtemp\TWClientInstaller.msi /qn" -Wait

#Confirm the program is installed
if (Test-Path "C:\Program Files (x86)\TrialWorks") {
    Write-Host "TrialWorks Client Installed Successfully"
} else {
    Write-Host "TrialWorks Client Installation Failed"
}


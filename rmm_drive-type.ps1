$disk = Get-PhysicalDisk

for ($i = 0; $i -lt $disk.Count; $i++) {
    if ($disk[$i].BusType -eq "SATA") {
        if ($disk[$i].MediaType -eq "HDD") {
            $true
        } else {
            $false
        }
    } elseif ($disk[$i].BusType -eq "USB") {
        $false
    } elseif ($disk[$i].BusType -eq "NVMe") {
        $false
    } else {
        $false
    }
}
# Get the list of upgradable packages (excluding the header)
$updates = winget upgrade --accept-source-agreements | Select-Object -Skip 2

foreach ($entry in $updates) {
    # Split by at least two spaces to separate columns
    $columns = $entry -split '\s{2,}'

    # Ensure there are at least 5 columns (Name, Id, Version, Available, Source)
    if ($columns.Length -ge 5) {
        $appName = $columns[0]       # First column is the Name
        $appId = $columns[1]         # Second column is the Package ID

        # Ask the user for confirmation
        $response = Read-Host "Do you want to update $appName ? (y/n)"
        if ($response -eq "y") {
            winget upgrade --id $appId --accept-source-agreements
        }
    }
}

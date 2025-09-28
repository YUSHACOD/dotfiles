# Save the current directory to return to it later
$startingLocation = Get-Location

# GitHub username or organization name
$githubUsername = "YUSHACOD"

# Directory to store all cloned repositories
$backupDir = "E:\github-backup"
New-Item -ItemType Directory -Force -Path $backupDir | Out-Null
Set-Location -Path $backupDir

# Get the list of repositories
$repos = gh repo list $githubUsername --limit 1000 --json nameWithOwner | ConvertFrom-Json | ForEach-Object { $_.nameWithOwner }

foreach ($repo in $repos) {
    # Extract repository name from the full "owner/repo" format
    $repoName = $repo.Split('/')[1]
    
    # Check if the repository already exists locally
    if (Test-Path -Path "$backupDir\$repoName") {
        Write-Output "Updating existing repository: $repoName"
        Set-Location -Path "$backupDir\$repoName"
        git pull origin main 2> $null || git pull origin master 2> $null  # Attempt to pull from main or master
        Set-Location -Path $backupDir
    } else {
        # Clone the repository if it doesn't exist locally
        Write-Output "Cloning new repository: $repo"
        gh repo clone $repo
    }
}

Write-Output "All repositories cloned or updated successfully!"

Set-Location $startingLocation

# Check if the script is running as administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
	Write-Output "This script requires administrative privileges. Please run as administrator."
	Exit
} else
{
	Write-Output "Running with administrative privileges."
}


# Install PowerShell using winget ##################################
winget install --id Microsoft.PowerShell -e

# Check if the installation was successful
if ($LASTEXITCODE -eq 0)
{
	Write-Output "PowerShell installed successfully."

	# Path to new PowerShell executable (adjust as needed)
	$newPowerShellPath = (Get-Command pwsh.exe)

	if (Test-Path $newPowerShellPath)
	{
		Write-Output "Starting script with new PowerShell version..."
		# Restart script using the new PowerShell version
		Write-Output $PSCommandPath
		& $newPowerShellPath -NoProfile -ExecutionPolicy Bypass -File $PSCommandPath
		Exit
	} else
	{
		Write-Output "New PowerShell installation path not found. Please verify the installation."
		Exit
	}
}
####################################################################


# Programs ##########################################
$programs = @(
	# "wez.wezterm",
	"Git.Git",
	# "JanDeDobbeleer.OhMyPosh"
	"Neovim.Neovim"
)

# Function for installing programs
function Install-ProgramsWithWinget
{
	param (
		[Parameter(Mandatory = $true)]
		[string[]]$ProgramIDs
	)

	foreach ($ProgramID in $ProgramIDs)
	{
		try
		{
			Write-Host "Installing $ProgramID..." -ForegroundColor Cyan
			# Execute the Winget install command
			winget install $ProgramID -e -h
			if ($LASTEXITCODE -eq 0)
			{
				Write-Host "$ProgramID installed successfully." -ForegroundColor Green
			} else
			{
				Write-Host "Failed to install $ProgramID." -ForegroundColor Red
			}
		} catch
		{
			Write-Host "An error occurred while installing $ProgramID : $_" -ForegroundColor Red
		}
	}
}

# Installing programs
Install-ProgramsWithWinget -ProgramIDs $programs
#####################################################

########### Firs initialize OH MY POSH #####
# oh-my-posh init pwsh | Invoke-Expression
############################################

# Startup Config#########################################################
$config = @"
$env:XDG_CONFIG_HOME = "$HOME\.config"
"@

$config_path = $PROFILE

# Check if the file at $PROFILE exists
if (Test-Path -Path $config_path)
{
	# Append the text to the existing file
	Add-Content -Path $config_path -Value $config
	Write-Host "Text appended to $config_path" -ForegroundColor Green
} else
{
	# Create the file and write the text to it
	$directory = Split-Path -Path $config_path
	if (!(Test-Path -Path $directory))
	{
		# Create the directory if it does not exist
		New-Item -ItemType Directory -Path $directory | Out-Null
	}
	Set-Content -Path $config_path -Value $config
	Write-Host "File created and text written to $config_path" -ForegroundColor Green
}
#########################################################################

# Nvim Config ##########################################################
# Define variables
$repoUrl = "https://github.com/YUSHACOD/nvim-config"
$targetLocation = "$HOME\.config\"
$newDirectoryName = "nvim"

# Ensure the target location exists
if (-not (Test-Path $targetLocation)) {
    Write-Output "Creating directory: $targetLocation"
    New-Item -ItemType Directory -Path $targetLocation | Out-Null
}

# Define a temporary directory to clone the repository
$tempDirectory = "$targetLocation\temp-nvim-config"

# Clone the repository to the temporary directory
Write-Output "Cloning repository into: $tempDirectory"
git clone $repoUrl $tempDirectory

# Check if the clone was successful
if (-not (Test-Path $tempDirectory)) {
    Write-Output "Error: Failed to clone the repository."
    exit 1
}

# Define the final directory path
$finalDirectory = "$targetLocation\$newDirectoryName"

# Remove the existing directory if it exists
if (Test-Path $finalDirectory) {
    Write-Output "Removing existing directory: $finalDirectory"
    Remove-Item -Recurse -Force $finalDirectory
}

# Rename the cloned repository directory
Write-Output "Renaming $tempDirectory to $finalDirectory"
Rename-Item -Path $tempDirectory -NewName $newDirectoryName

Write-Output "Repository pulled and renamed successfully."
######################################################################

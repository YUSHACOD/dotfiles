param (
	[string]$inputString
)

if ($inputString -match "^(.*?)=(.*?)$")
{
	$name = $matches[1]
	$value = $matches[2]

	Write-Output "alias name: $name"
	Write-Output "alias value: $value"
	
	$alias_file_path = "D:\Documents\PowerShell\conf_script_ps\$name.ps1"
	New-Item $alias_file_path
	Set-Content -Path $alias_file_path -Value $value
	Write-Output "Saved alias script"

	$alias_file_path_save = "Set-Alias -Name $name -Value $alias_file_path"
	Add-Content -Path D:\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 -Value $alias_file_path_save

	Write-Output "Saved alias"
} else
{
	Write-Output "Invalid input format. Expected '<name>=<value>'"
}


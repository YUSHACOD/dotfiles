# First initialize Starship ----------------------------------------------------------------------------------- #
Invoke-Expression (& 'C:\Program Files\starship\bin\starship.exe' init powershell --print-full-init | Out-String)
# ------------------------------------------------------------------------------------------------------------- #


# Custom env variables --------------- #
$env:XDG_CONFIG_HOME = "$HOME\.config"
$env:ANDROID_HOME = "E:\android_sdk"
# ------------------------------------ #

# At Startup ------- #
Set-Location "$HOME"
# ------------------ #


# Zoxide Invocation --------------------------------------------- #
Invoke-Expression (& { (zoxide init powershell | Out-String) })
# --------------------------------------------------------------- #

# Sensible cli ----------------------------------------------------------------------------------- #
if ($host.Name -eq 'ConsoleHost')
{
	Import-Module PSReadLine

	# Bind Ctrl+U to delete from cursor to beginning of the line
	Set-PSReadLineKeyHandler -Chord 'Ctrl+u' -Function BackwardDeleteLine

	# Optionally: bind Ctrl+K to delete from cursor to end of the line
	Set-PSReadLineKeyHandler -Chord 'Ctrl+k' -Function ForwardDeleteLine

	# Optional: Bash-like navigation shortcuts
	Set-PSReadLineKeyHandler -Chord 'Ctrl+a' -Function BeginningOfLine
	Set-PSReadLineKeyHandler -Chord 'Ctrl+e' -Function EndOfLine

	# Use breadcrumbs-style history search using Up/Down arrows
	Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
	Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
}

function New-Symlink
{
	param(
		[Parameter(Mandatory=$true)][string]$Link,
		[Parameter(Mandatory=$true)][string]$Target
	)

	# Expand ~ and relative paths
	$Resolved = Resolve-Path -LiteralPath $Link -ErrorAction SilentlyContinue
	$Link     = $Resolved ?? $Link
	$Target = (Resolve-Path -LiteralPath $Target) -join ''

	New-Item -ItemType SymbolicLink -Path $Link -Target $Target -Force | Out-Null
	Write-Host "Symlink created: $Link -> $Target" -ForegroundColor Green
}

Set-Alias ln New-Symlink
# ------------------------------------------------------------------------------------------------ #

# Windows Development Shenanigans ---------------------------------------------------------------------- #
D:\HeavyPrograms\VisualStudio2026\Common7\Tools\Launch-VsDevShell.ps1  -SkipAutomaticLocation -Arch amd64 | Out-Null 
# ------------------------------------------------------------------------------------------------------ #

# Aliases ---------------------------------------------------------------------------------------------- #
Set-Alias -Name vim -Value nvim
Set-Alias -Name psconf -Value D:\Documents\PowerShell\conf_script_ps\psconf.ps1
Set-Alias -Name :q -Value D:\Documents\PowerShell\conf_script_ps\exit.ps1
Set-Alias -Name gtpsconf -Value D:\Documents\PowerShell\conf_script_ps\goto_conf.ps1
Set-Alias -Name github_pull -Value D:\Documents\PowerShell\conf_script_ps\github_pull.ps1
Set-Alias -Name which -Value Get-Command
Set-Alias -Name wintermconf -Value D:\Documents\PowerShell\conf_script_ps\wintermconf.ps1
Set-Alias -Name alias_save -Value D:\Documents\PowerShell\conf_script_ps\alias_save.ps1
Set-Alias -Name zbr -Value D:\Documents\PowerShell\conf_script_ps\zbr.ps1
Set-Alias -Name gs -Value D:\Documents\PowerShell\conf_script_ps\gs.ps1
Set-Alias -Name tasks -Value D:\Documents\PowerShell\conf_script_ps\tasks.ps1
Set-Alias -Name lg -Value D:\Documents\PowerShell\conf_script_ps\lg.ps1
Set-Alias -Name winget_upgrade -Value D:\Documents\PowerShell\conf_script_ps\winget_upgrade.ps1
Set-Alias -Name ev -Value ebook-viewer
Set-Alias -Name vault -Value D:\Documents\PowerShell\conf_script_ps\vault.ps1
Set-Alias -Name arch -Value D:\Documents\PowerShell\conf_script_ps\arch.ps1
Set-Alias -Name nc -Value D:\Documents\PowerShell\conf_script_ps\nc.ps1
Set-Alias -Name notes -Value D:\Documents\PowerShell\conf_script_ps\notes.ps1
Set-Alias -Name npull -Value D:\Documents\PowerShell\conf_script_ps\npull.ps1
Set-Alias -Name npush -Value D:\Documents\PowerShell\conf_script_ps\npush.ps1
Set-Alias -Name condroid -Value D:\Documents\PowerShell\conf_script_ps\condroid.ps1
Set-Alias -Name love -Value D:\Documents\PowerShell\conf_script_ps\love.ps1
Set-Alias -Name aemu -Value D:\Documents\PowerShell\conf_script_ps\aemu.ps1
Set-Alias -Name mb -Value ./bxild.ps1
Set-Alias -Name vi -Value D:\Documents\PowerShell\conf_script_ps\vi.ps1

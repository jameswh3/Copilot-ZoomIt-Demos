$demofilesPath = Get-Location
$demofiles = Get-ChildItem -Path $demofilesPath -Filter "*.txt"
$currentDemoPath = "$demofilesPath\CurrentDemo.txt"
$envFilePath = "$demofilesPath\.env"

# Function to read .env file and return hashtable of variables
function Get-EnvVariables {
    param([string]$envPath)
    
    $envVars = @{}
    
    if (Test-Path $envPath) {
        Get-Content $envPath | ForEach-Object {
            $line = $_.Trim()
            # Skip empty lines and comments
            if ($line -and -not $line.StartsWith('#')) {
                if ($line -match '^([^=]+)=(.*)$') {
                    $key = $matches[1].Trim()
                    $value = $matches[2].Trim()
                    # Remove quotes if present
                    $value = $value -replace '^["'']|["'']$', ''
                    $envVars[$key] = $value
                }
            }
        }
        Write-Host "Loaded $($envVars.Count) variable(s) from .env file" -ForegroundColor Green
    } else {
        Write-Host "No .env file found at $envPath. Skipping variable replacement." -ForegroundColor Yellow
    }
    
    return $envVars
}

# Function to replace placeholders in content
function Replace-Placeholders {
    param(
        [string]$content,
        [hashtable]$variables
    )
    
    $updatedContent = $content
    
    foreach ($key in $variables.Keys) {
        $placeholder = "<$key>"
        if ($updatedContent -match [regex]::Escape($placeholder)) {
            $updatedContent = $updatedContent -replace [regex]::Escape($placeholder), $variables[$key]
            Write-Host "Replaced placeholder: $placeholder" -ForegroundColor Cyan
        }
    }
    
    return $updatedContent
}

# Create a menu from text files
$validFiles = $demofiles | Where-Object { $_.Name -ne "CurrentDemo.txt" }
$menuOptions = @()
$menuOptions += $validFiles | ForEach-Object { 
    [PSCustomObject]@{
        Name = [System.IO.Path]::GetFileNameWithoutExtension($_.Name)
        FullPath = $_.FullName
    }
}

# Check if we have any demo files
if ($menuOptions.Count -eq 0) {
    Write-Host "No text files found in $demofilesPath" -ForegroundColor Yellow
    exit
}

# Display menu
Write-Host "Available demo scripts:" -ForegroundColor Cyan
for ($i = 0; $i -lt $menuOptions.Count; $i++) {
    Write-Host "[$($i+1)] $($menuOptions[$i].Name)"
}

# Get user selection
$selection = $null
do {
    $userInput = Read-Host "`nSelect a demo script number (1-$($menuOptions.Count)) or press Enter to cancel"
    
    if ([string]::IsNullOrWhiteSpace($userInput)) {
        Write-Host "Operation cancelled." -ForegroundColor Yellow
        exit
    }
    
    if ([int]::TryParse($userInput, [ref]$selection)) {
        if ($selection -ge 1 -and $selection -le $menuOptions.Count) {
            break
        }
    }
    
    Write-Host "Invalid selection. Please try again." -ForegroundColor Red
} while ($true)

# Get the selected file
$selectedFile = $menuOptions[$selection-1]

# Check if user selected CurrentDemo.txt
if ($selectedFile.Name -eq "CurrentDemo") {
    Write-Host "CurrentDemo selected. No action needed." -ForegroundColor Green
    exit
}

# Copy the content to CurrentDemo.txt
try {
    $content = Get-Content -Path $selectedFile.FullPath -Raw
    Set-Content -Path $currentDemoPath -Force -Value $content
    
    Write-Host "Successfully copied '$($selectedFile.Name)' content to CurrentDemo.txt" -ForegroundColor Green
    
    # Load environment variables
    $envVars = Get-EnvVariables -envPath $envFilePath
    
    # Replace placeholders if env variables exist
    if ($envVars.Count -gt 0) {
        $currentContent = Get-Content -Path $currentDemoPath -Raw
        $updatedContent = Replace-Placeholders -content $currentContent -variables $envVars
        Set-Content -Path $currentDemoPath -Force -Value $updatedContent
        Write-Host "Variable replacement completed." -ForegroundColor Green
    }
    
    # Display the final content
    Get-Content -Path $currentDemoPath -Raw
}
catch {
    Write-Host "Error copying file content: $_" -ForegroundColor Red
}
pause
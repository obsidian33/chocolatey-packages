#Requires -Version 5.0
#Requires -Modules AU
#Requires -Modules GetRedirectedURL
[cmdletbinding()]
param(
    [switch]$Force
)

$ErrorActionPreference = 'Stop'

$releases = "https://github.com/Azure/kubelogin/releases/tag/v0.1.9"

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^[$]url64\s*=\s*)'.*'"      = "`${1}'$($Latest.URL64)'"
            "(?i)(^[$]checksum64\s*=\s*)'.*'" = "`${1}'$($Latest.Checksum64)'"
        }

        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`${2}"
        }
    }
}

function Get-Sha($version) {
    $url = "https://github.com/Azure/kubelogin/releases/download/v${version}/kubelogin-win-amd64.zip.sha256"
    $response = Invoke-RestMethod -Uri $url
    Write-Verbose $response
    $sha, $file = $response -split '  '
    Write-Verbose $sha
    return $sha
}

function global:au_GetLatest {
    $url = Get-RedirectedURL $releases
    Write-Verbose($url)

    $version = $url -split '\/v' | Select-Object -Last 1
    Write-Verbose("version: ${version}")

    return @{
        Version = $version
        URL64 = "https://github.com/Azure/kubelogin/releases/download/v${version}/kubelogin-win-amd64.zip"
        ReleaseNotes = "https://github.com/Azure/kubelogin/releases/tag/v${version}"
        Checksum64 = Get-Sha($version)
    }
}

Update-Package -NoCheckUrl -NoCheckChocoVersion -NoReadme -ChecksumFor none -Force:$Force

Write-Host "Build the package: choco pack"
Write-Host "Test the package"
Write-Host "Push the package: choco push package-name.1.1.0.nupkg --source https://push.chocolately.org/"

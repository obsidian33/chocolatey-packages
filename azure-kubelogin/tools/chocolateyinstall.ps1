$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# DO NOT CHANGE THESE MANUALLY. Use update.ps1
$url64      = 'https://github.com/Azure/kubelogin/releases/download/v0.2.19/kubelogin-win-amd64.zip'
$checksum64 = '0353ff15fa534e610d10b7a7c55d3f10d693bc2fab4d3ec7f7564db6efd22ae4'

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  UnzipLocation  = $toolsDir
  Url64bit       = $url64
  Checksum64     = $checksum64
  ChecksumType64 = 'sha256' #default is checksumType
}

Install-ChocolateyZipPackage @packageArgs

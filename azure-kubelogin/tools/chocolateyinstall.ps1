$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# DO NOT CHANGE THESE MANUALLY. Use update.ps1
$url64      = 'https://github.com/Azure/kubelogin/releases/download/v0.1.3/kubelogin-win-amd64.zip'
$checksum64 = 'ba37a8a00b26fcc528a3ae5be44665f373557424273e9ba0266dd87ea7477bbb'

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  UnzipLocation  = $toolsDir
  Url64bit       = $url64
  Checksum64     = $checksum64
  ChecksumType64 = 'sha256' #default is checksumType
}

Install-ChocolateyZipPackage @packageArgs

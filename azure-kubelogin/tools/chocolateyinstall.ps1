$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# DO NOT CHANGE THESE MANUALLY. Use update.ps1
$url64      = 'https://github.com/Azure/kubelogin/releases/download/v0.1.9/kubelogin-win-amd64.zip'
$checksum64 = '4617ce48d31c5ad6b4ea17005defc0834dedf600c34eda29f79d682e90ca7ff3'

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  UnzipLocation  = $toolsDir
  Url64bit       = $url64
  Checksum64     = $checksum64
  ChecksumType64 = 'sha256' #default is checksumType
}

Install-ChocolateyZipPackage @packageArgs

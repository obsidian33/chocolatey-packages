$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# DO NOT CHANGE THESE MANUALLY. Use update.ps1
$url64      = 'https://github.com/Azure/kubelogin/releases/download/v0.0.20/kubelogin-win-amd64.zip'
$checksum64 = '07D26F70F11EDE971F051C43BC0577C2E0649D70BC87AABD8391AD4A3C97C3DA'

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  UnzipLocation  = $toolsDir
  Url64bit       = $url64
  Checksum64     = $checksum64
  ChecksumType64 = 'sha256' #default is checksumType
}

Install-ChocolateyZipPackage @packageArgs

Remove-Item "$toolsDir\kubelogin-win-amd64.zip"
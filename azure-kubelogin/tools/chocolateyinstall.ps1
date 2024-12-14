$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# DO NOT CHANGE THESE MANUALLY. Use update.ps1
$url64      = 'https://github.com/Azure/kubelogin/releases/download/v0.1.6/kubelogin-win-amd64.zip'
$checksum64 = '29e2cbfeebe134e280b72876a66ff7ff63fd5335ed74ad925162762544326b48'

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  UnzipLocation  = $toolsDir
  Url64bit       = $url64
  Checksum64     = $checksum64
  ChecksumType64 = 'sha256' #default is checksumType
}

Install-ChocolateyZipPackage @packageArgs

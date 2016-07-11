# Set-ExecutionPolicy -ExecutionPolicy ByPass -Scope Process

# http://download.oracle.com/otn-pub/java/jdk/8u92-b14/server-jre-8u92-windows-x64.tar.gz
# http://download.oracle.com/otn-pub/java/jdk/8u92-b14/server-jre-8u92-windows-x64.tar.gz?AuthParam=1466647458_620a821d548cbff25a78f296f2403dd6
#
# https://edelivery.oracle.com/otn-pub/java/jdk/8u92/server-jre-8u92-windows-x64.tar.gz

$ErrorActionPreference = "Stop"

#Add-Type -AssemblyName System.IO.Compression.FileSystem



#function Unzip
#{
#    param([string]$zipfile, [string]$outpath)
#    New-Item $outpath -type directory -force >$null 2>&1
#    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
#}

function Unzip($zipfile, $destination) {
  $shellApplication = new-object -com shell.application 
  $zipPackage = $shellApplication.NameSpace($zipfile)
  New-Item $destination -type directory -force >$null 2>&1
  $destinationFolder = $shellApplication.NameSpace($destination) 

  # CopyHere vOptions Flag # 4 - Do not display a progress dialog box. 
  # 16 - Respond with "Yes to All" for any dialog box that is displayed. 
  
  $destinationFolder.CopyHere($zipPackage.Items(),20)
} 

#required for powershell < 3
if(!$PSScriptRoot){
  $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent
}

$tmpDir="$($(resolve-path "$PSScriptRoot\..").Path)\var\tmp"
$7zaDir="$tmpDir\7za"
$gnuWin32="$tmpDir\gnuWin32"
$javaHome="$($(resolve-path "$PSScriptRoot\..").Path)\var\.jre"

write-host "TempDir:$tmpDir"

New-Item $tmpDir -type directory -force >$null 2>&1



$url = "http://download.oracle.com/otn-pub/java/jdk/8u92-b14/server-jre-8u92-windows-x64.tar.gz"
$output = "$tmpDir\server-jre-8u92-windows-x64.tar.gz"
$wc = New-Object System.Net.WebClient
$wc.Headers.Add([System.Net.HttpRequestHeader]::Cookie, "gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie")
if(!(Test-Path -Path $output )){
    $wc.DownloadFile($url, $output)
}

if(!(Test-Path -Path "$tmpDir\7za920.zip" )){
    $wc.DownloadFile("http://www.7-zip.org/a/7za920.zip", "$tmpDir\7za920.zip")
}

if(!(Test-Path -Path $7zaDir )){
    Unzip -zipfile "$tmpDir\7za920.zip" -destination "$7zaDir"
}

if(!(Test-Path -Path $javaHome )){
    New-Item "${javaHome}_" -type directory -force >$null 2>&1
    & "$7zaDir\7za.exe" x -y $output "-o$(Split-Path -Path $output -parent)" >$null 2>&1
    & "$7zaDir\7za.exe" x -y $output.TrimEnd('.gz') "-o${javaHome}_" >$null 2>&1
    Move-Item -path $(Get-ChildItem -Path "${javaHome}_" | Select-Object -first 1).FullName -destination $javaHome
    remove-item -path "${javaHome}_"
}




$accountName = "domaina0\wcurtis"
$usmtPath = "C:\USMT"
$profileSavePath = "C:\tempProfile"

Set-Location -LiteralPath $usmtPath | Out-Null

if (!(Test-Path $profileSavePath)) {

    New-Item -Path $profileSavePath -ItemType Directory -Force -Confirm:$false | Out-Null

}

$scanStatePath = (Get-ChildItem -Path $usmtPath -Recurse | Where-Object { $_.Name -eq "scanstate.exe" }).FullName


$expression = "$scanStatePath $profileSavePath /ue:*\* /i:migdocs.xml /i:migapp.xml /o /ui:$accountName /config:Config_AppsAndSettings.xml /i:MigUser.xml /i:MigChrome.xml /c"
Invoke-Expression -Command $expression



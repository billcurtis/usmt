

$accountName = "domaina0\wcurtis"
$newAcctName = "domainb0\wcurtis"
$usmtPath = "C:\USMT"
$profileSavePath = "C:\tempProfile"

Set-Location -LiteralPath $usmtPath | Out-Null



if (!(Test-Path $profileSavePath)) {

New-Item -Path $profileSavePath -ItemType Directory -Force -Confirm:$false | Out-Null

}

$scanStatePath = (Get-ChildItem -Path $usmtPath -Recurse | Where-Object {$_.Name -eq "scanstate.exe"}).FullName
$loadStatePath = (Get-ChildItem -Path $usmtPath -Recurse | Where-Object {$_.Name -eq "loadstate.exe"}).FullName


$expression = "$loadStatePath $profileSavePath /ue:$newAcctName /i:migdocs.xml /i:migapp.xml /mu:$($accountName):$($newAcctName)  /i:MigUser.xml /i:MigChrome.xml"
Invoke-Expression -Command $expression



$firstOccurance=""
$latestOccurance =$null
Clear-Content  .\output.txt
Get-ChildItem -Path .\logs | 
ForEach-Object{
$content = Get-content $_.FullName
$out =""
$count=0
$currentDateTime = $null
$content | ForEach-Object {
    
    if($_ -match '(?<LogDatetime>\d+-\d+-\d+ \d+:\d+:\d+.\d+)'){
        $currentDateTime = $Matches.LogDateTime
    }
    if($_ -match "MobileLabs.DeviceConnect.Framework.IO.PortableNetwork.PortableNetworkException" ){
        if($count -eq 0 -and $firstOccurance -eq ""){
            $firstOccurance = $currentDateTime;
        }else{
            $currentDate = Get-Date $currentDateTime
            if(-Not [string]::IsNullOrEmpty($latestOccurance)){
                $lastOccuranceDate = Get-Date $latestOccurance
                if($lastOccuranceDate -lt $currentDate){
                    $latestOccurance = $Matches.LogDatetime
                }
            }else{
                $latestOccurance = $currentDateTime
            }
      
        }
        $count++
     }

    }
    
    $out = Write-Output $_.Name  $count
    $out | Out-File -Append .\output.txt
}
"First Occurance: " + $firstOccurance | Out-File -Append .\output.txt
"Latest Occurance: " + $latestOccurance |  Out-File -Append .\output.txt


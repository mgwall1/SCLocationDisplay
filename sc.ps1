Write-Host "Star Citizen Getting Closer To Something"
Write-Host "Moving Away" -ForegroundColor red 
Write-Host "Getting Closer" -ForegroundColor green
Write-Host "Really Close" -ForegroundColor Yellow

#where I want to go
$x = 20196776410.415634
$y = 33456387485.680557
$z = 2896115.502795

#set currents to a value because math
$curx = 0
$cury = 0
$curz = 0

#note that the first display may be weird
Write-Host "First display doesn't have enough info, so ignore it and I'll take it out later"
Write-Host "Also uses live data in your clib board, so if you copy something while multitasking, data will be weird"

#get into the endless loop (I doubt I'll actually get right on the point)
do {
Write-Host (Get-Date)
#where I was
$lastx = $curx
$lasty = $cury
$lastz = $curz

#where I am
$array = (Get-Clipboard).split(":").Split(" ")
$curx = $array[3]
$cury = $array[5]
$curz = $array[7]

#is X closer?
$diffcurx = $x - $curx
if ($diffcurx -lt 0) {$diffcurx = $diffcurx * -1}
$difflastx = $x - $lastx
if ($difflastx -lt 0) {$difflastx = $difflastx * -1}
if ($diffcurx -lt 11) {Write-Host "X = $curx      $diffcurx away" -ForegroundColor yellow}elseif ($diffcurx -gt $difflastx) {Write-Host "X = $curx      $diffcurx away" -ForegroundColor red} else{Write-Host "X = $curx      $diffcurx away" -ForegroundColor green}

#is Y closer?
$diffcury = $y - $cury
if ($diffcury -lt 0) {$diffcury = $diffcury * -1}
$difflasty = $y - $lasty
if ($difflasty -lt 0) {$difflasty = $difflasty * -1}
if ($diffcury -lt 11) {Write-Host "Y = $cury      $diffcury away" -ForegroundColor yellow}elseif ($diffcury -gt $difflasty) {Write-Host "Y = $cury      $diffcury away" -ForegroundColor red}else{Write-Host "Y = $cury      $diffcury away" -ForegroundColor green}


#is Z closer?
$diffcurz = $z - $curz
if ($diffcurz -lt 0) {$diffcurz = $diffcurz * -1}
$difflastz = $z - $lastz
if ($difflastz -lt 0) {$difflastz = $difflastz * -1}
if ($diffcurz -lt 11) {Write-Host "Z = $curz          $diffcurz away" -ForegroundColor yellow}elseif($diffcurz -gt $difflastz){Write-Host "Z = $curz          $diffcurz away" -ForegroundColor red}else{Write-Host "Z = $curz          $diffcurz away" -ForegroundColor green}


#This loop makes it only update the screen when new data is in the clipboard
do {Start-Sleep 1
    $checkclip = (Get-Clipboard).split(":").Split(" ")
} while ($array[7] -eq $checkclip[7] -and $array[3] -eq $checkclip[3] -and $array[5] -eq $checkclip[5])
} while ($curx -ne $x -and $cury -ne $y -and $curz -ne $z)

#Probably won't happen
Write-Host "Done you area at $curx $cury $curz"
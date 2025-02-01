$credit = @"
=====================================================================
By Behzad Seyfi 2025
You can find me at github.com/BSeyfi
Made with love to make the world a little simpler and more beautiful.

repo: https://github.com/BSeyfi/RemoveAnnoyingWindowsKeyboardLayouts
=====================================================================
"@
echo $credit

$LanguageTagToRemove = "fa"
#all layouts should be defined under the $LanguageTagToRemove (eg all would be fa farsi)
$KeyboardsToRemove = @("0429:00000429", "0429:B0020429", "0429:00050429")


Set-ExecutionPolicy Bypass -Scope Process -Force

#First, add the annoying layouts
$LanguageList = Get-WinUserLanguageList
 foreach ($kb in $KeyboardsToRemove)
 {
	$LanguageList[0].InputMethodTips.Add($kb) 
	Write-Host "Added: $kb"
 }
 
Set-WinUserLanguageList $LanguageList -Force


#Next, remove the annoying layouts
$LanguageList = Get-WinUserLanguageList

for ($i = 0; $i -lt $LanguageList.Count; $i++) {
    if ($LanguageList[$i].LanguageTag -eq $LanguageTagToRemove) {
        $LanguageIndex = $i
		break
    }
}

if ($null -ne $LanguageIndex) {
    foreach ($kb in $KeyboardsToRemove) {
        if ($LanguageList[$LanguageIndex].InputMethodTips.Contains($kb)) {
            $LanguageList[$LanguageIndex].InputMethodTips.Remove($kb) | Out-Null
            Write-Host "Removed: $kb"
        } else {
            Write-Host "Not found: $kb"
        }
    }

    Set-WinUserLanguageList $LanguageList -Force
} else {
    Write-Host "Persian (fa-IR) not found in the language list."
}

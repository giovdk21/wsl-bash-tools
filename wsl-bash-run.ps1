# This is meant to be used with bash.exe -c to allow parameters to be appended
# dinamically. It also tries to convert windows absolute paths 
# into Linux/WSL paths.
#
# Created to be used with Visual Studio Code.
# Use it at your own risk!

$args_str = ""
foreach ($arg in $args) {
    
    if ($arg -match '^[A-z]{1,1}:(?:\\{1,2}[^\\]+){2,2}') {
        $arg = $arg -replace '\\{1,2}', '/'
        $drv_letter = ($arg -replace '^([A-z]){1,1}:.*', '$1').ToLower()
        $arg = ("/mnt/$($drv_letter)/" + $arg.Substring(3))
    }
   
    $args_str += $arg + " "
}

if ($args_str.Length -gt 0) {
    & C:\Windows\System32\bash.exe -c "$args_str"
}

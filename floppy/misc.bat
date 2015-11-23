@echo off

title Setting power configuration. Please wait...

echo ==^> Setting power configuration to High Performance
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

echo ==^> Turning off monitor timeout
powercfg -Change -monitor-timeout-ac 0
powercfg -Change -monitor-timeout-dc 0

::Disable Hibernation
reg add HKLM\SYSTEM\CurrentControlSet\Control\Power\ /v HibernateFileSizePercent /t REG_DWORD /d 0 /f
reg add HKLM\SYSTEM\CurrentControlSet\Control\Power\ /v HibernateEnabled /t REG_DWORD /d 0 /f

title Disabling automatic machine account password changes. Please wait...

echo ==^> Disabling automatic machine account password changes
:: http://support.microsoft.com/kb/154501
reg add "HKLM\System\CurrentControlSet\Services\Netlogon\Parameters" /v DisablePasswordChange /t REG_DWORD /d 2 /f

title Disabling new network prompt. Please wait...

echo ==^> Disabling new network prompt
reg add "HKLM\System\CurrentControlSet\Control\Network\NewNetworkWindowOff"

title Setting time format. Please wait...

echo ==^> Setting time format to 24 hour time
reg add "HKCU\Control Panel\International" /f /v sShortTime /t REG_SZ /d "HH:mm"
reg add "HKCU\Control Panel\International" /f /v sTimeFormat /t REG_SZ /d "HH:mm:ss"

echo ==^> Show Run command in Start Menu
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ /v Start_ShowRun /t REG_DWORD /d 1 /f

echo ==^> Show Administrative Tools in Start Menu
reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ /v StartMenuAdminTools /t REG_DWORD /d 1 /f

title Setting folder options. Please wait...

echo ==^> Setting folder options
echo ==^> Show file extensions
:: Default is 1 - hide file extensions
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v HideFileExt /t REG_DWORD /d 0
echo ==^> Show hidden files and folders
:: Default is 2 - do not show hidden files and folders
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v Hidden /t REG_DWORD /d 1
echo ==^> Display Full path
:: Default FullPath 0 and FullPathAddress 0
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v FullPath /t REG_DWORD /d 1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /f /v FullPathAddress /t REG_DWORD /d 1

echo ==^> Enabling RDP on port 3389
netsh advfirewall firewall add rule name="Open Port 3389" dir=in action=allow protocol=TCP localport=3389
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

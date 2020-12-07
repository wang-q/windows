# Optional: OpenSSH Server

Microsoft ported OpenSSH to Windows after
[the 1809 release](https://docs.microsoft.com/zh-cn/windows-server/administration/openssh/openssh_install_firstuse),
but I got some errors while trying this approach.

So use the old way.

* [Ref 1](https://github.com/PowerShell/Win32-OpenSSH/wiki/Install-Win32-OpenSSH)
* [Ref 2](http://chrisarges.net/2019/07/16/openssh-install-on-windows.html)

```powershell
if (!(Test-Path OpenSSH-Win64.zip -PathType Leaf)) {
    Invoke-WebRequest 'https://github.com/PowerShell/Win32-OpenSSH/releases/download/v8.1.0.0p1-Beta/OpenSSH-Win64.zip' -OutFile 'OpenSSH-Win64.zip'
}
sudo Expand-Archive -Path OpenSSH-Win64.zip -DestinationPath 'C:\Program Files\'

cd 'C:\Program Files\OpenSSH-Win64\'
sudo .\install-sshd.ps1

# Firewall
sudo netsh advfirewall firewall add rule name=sshd dir=in action=allow protocol=TCP localport=22

# Start Service
sudo net start sshd
sudo Set-Service sshd -StartupType Automatic

```

There is a bug when transfer [large files](https://github.com/PowerShell/Win32-OpenSSH/issues/1395)
via sftp to Windows, be careful.

# Optional: ssh-copy-id


```powershell
ssh-keygen -f $env:USERPROFILE/.ssh/id_rsa

type $env:USERPROFILE/.ssh/id_rsa.pub | ssh wangq@202.119.37.251 "cat >> .ssh/authorized_keys"

```

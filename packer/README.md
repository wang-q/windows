# A Windows 7 base box

* Windows 7 Enterprise with Service Pack 1 (x64) - DVD (English)
* `ed2k://|file|en_windows_7_enterprise_with_sp1_x64_dvd_u_677651.iso|3182604288|E4D1A2A7BB46706F6545E713EA32A5F3|/`
* `en_windows_7_enterprise_with_sp1_x64_dvd_u_677651.iso`

Install
[Parallels Virtualization SDK](http://www.parallels.com/download/pvsdk/).

## Build

Put or symlink `en_windows_7_enterprise_with_sp1_x64_dvd_u_677651.iso` under `/prepare/resource/`.

```bash
cd ~/Scripts/windows/packer
bash packer.sh
```

## Up

```bash
vagrant box add windows-7 ~/Scripts/windows/vm/windows_7_parallels.box --force

cp ~/Scripts/windows/packer/vagrantfile-windows-7.tpl ~/Parallels/Vagrantfile

cd ~/Parallels
vagrant up --provider parallels
```

## Post processing

* Turn off system protection
* Turn on UAC
* Install Language Pack (lp.cab)
    * Win+R ==> lpksetup
* Change Language for non-unicode programs

## Other boxes

And codes also come from these repos.

* https://github.com/joefitzgerald/packer-windows
* https://github.com/boxcutter/windows

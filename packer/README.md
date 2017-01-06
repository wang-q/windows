# A Windows 7 base box

Install
[Parallels Virtualization SDK](http://www.parallels.com/download/pvsdk/).

## Build

```bash
ln -s /Volumes/Backup/software/OS/win7/en_windows_7_enterprise_with_sp1_x64_dvd_u_677651.iso \
    /prepare/resource/en_windows_7_enterprise_with_sp1_x64_dvd_u_677651.iso
```

```bash
cd ~/Scripts/windows/packer
bash packer.sh
```

## Up

```bash
cp ~/Scripts/egavm/packer-win/vagrantfile-windows-7.tpl ~/Parallels/Vagrantfile

cd ~/Parallels
vagrant up
```

## Post processing

* Turn off system protection
* Turn on UAC
* Install Language Pack (lp.cab)
    * Win+R ==> lpksetup
* Change Language for non-unicode programs
* Change DVD driver to E:, map Mac disk to D:
* Install 360
    * 360 zip
    * 360 sandbox
    * flash player
    * adobe reader
    * directX
    * freeime
    * splayer
    * .Net 4.5
* office 2010 sp1 iso
    * than sp2
* Windows and Office Patches
* Microsoft Toolkit
* CorelDraw X5
* Tools
    * TotalCmd
    * ConEmu
    * bin/
* Strawberry Perl
* Python 2.7
* R

## Other boxes

And codes also come from these repos.

* https://github.com/joefitzgerald/packer-windows
* https://github.com/boxcutter/windows

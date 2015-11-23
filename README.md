# A Windows 7 base box

## Build

```bash
cd ~/Scripts/egavm/packer-win
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
    * 360 yunpan
    * 360 zip
    * 360 sandbox
    * flash player
    * adobe reader
    * directX
    * freeime
    * splayer
    * .Net 4.5
* office 2010 sp1
    * sp2
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

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
* Change Language for non-unicode programs
* Install Language Pack (lp.cab)
    * Win+R ==> lpksetup
* Change DVD driver to E:, map Mac disk to D:
* Install 360
* Patches
* .Net 4.5
* office 2010 sp1
    * sp2
* Microsoft Toolkit
* CorelDraw X5
* Strawberry Perl

## Other boxes

And codes also come from these repos.

* https://github.com/joefitzgerald/packer-windows
* https://github.com/boxcutter/windows

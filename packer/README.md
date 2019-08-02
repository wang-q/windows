# A Windows 10 base box

A Packer build to make a vanilla Windows 10 x64 box for Parallels.

The building steps contain:

* Install [Parallels Virtualization SDK](http://www.parallels.com/download/pvsdk/).
* Download a Windows 10 x64 Enterprise trial ISO
* Enable WinRM for packer/vagrant communicate to the VM
* Create a `vagrant:vagrant` user:password with
* Install VM guest additions
* Compact disks

## ISO

* Windows 10 Enterprise 19h1 (x64)
* `18362.30.190401-1528.19h1_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso`

```bash
cd ~/Scripts/windows/packer

wget -N -P iso https://software-download.microsoft.com/download/pr/18362.30.190401-1528.19h1_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso

openssl sha1 iso/*.iso

wget -N -P iso http://www.7-zip.org/a/7z920-x64.msi
wget -N -P iso http://downloads.sourceforge.net/project/ultradefrag/stable-release/6.1.0/ultradefrag-portable-6.1.0.bin.amd64.zip
wget -N -P iso http://download.sysinternals.com/files/SDelete.zip

```

## Build

```bash
cd ~/Scripts/windows/packer

packer build -only=parallels-iso windows_10.json

mv windows_10_parallels.box ../vm

```

## Up

```bash
vagrant box add windows-10 ~/Scripts/windows/vm/windows_10_parallels.box --force

cp ~/Scripts/windows/packer/vagrantfile-windows-10.tpl ~/Parallels/Vagrantfile

cd ~/Parallels
# vagrant plugin install vagrant-parallels
vagrant up --provider parallels

```

## Other boxes

And codes also come from these repos.

* https://github.com/joefitzgerald/packer-windows
* https://github.com/boxcutter/windows
* https://github.com/luciusbono/Packer-Windows10

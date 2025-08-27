# archinstall prep.

$ lsblk

$ cfdisk /dev/nvme0n1

$ gdisk /dev/nvme0n1
$  o
$  n
$   <default>
$   <default>
$   +2024M
$   ef00
%  n
$   <default>
$   <default>
$   <default>
$   <default>
%  n
$   <default>
$   <default>
$   <default>
$   <default>
$  n
$   <default>
$   <default>
$   +1024M
$   0c01
$  n
$   <default>
$   <default>
$   <default>
$   0700
$  w

$ mkfs.fat -F32 -n EFI /dev/nvme0n1p1

$ mkfs.btrfs -f -L ARC -d raid0 -m raid1 /dev/nvme0n1p2 /dev/nvme0n1p3

S mkfs.ntfs -L WIN /dev/nvme0n1p5

$ mount LABEL=ARC /mnt

$ btrfs su cr /mnt/@

$ btrfs su cr /mnt/@home

$ btrfs su cr /mnt/@log

$ btrfs su cr /mnt/@pkg

$ btrfs su cr /mnt/@snapshots

$ umount /mnt

$ mount -o noatime,compress=zstd,subvol=@ LABEL=ARC /mnt

$ mkdir -p /mnt/{boot,home,var/log,var/cache/pacman/pkg.snapshots}

$ mount -o noatime,compress=zstd,subvol=@home LABEL=ARC /mnt/home

$ mount -o noatime,nodatacow,subvol=@log LABEL=ARC /mnt/var/log

$ mount -o noatime,nodatacow,subvol=@pkg LABEL=ARC /mnt/var/cache/pacman/pkg

$ mount -o noatime,compress=zstd,subvol=@snapshots LABEL=ARC /mnt/.snapshots

$ mount /dev/nvme0n1p1 /mnt/boot

$ lsblk

$ archinstall

$ sudo nano /etc/fstab

$ sudo pacman -Syu

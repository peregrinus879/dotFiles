# archinstall prep.

$ lsblk

$ cfdisk /dev/nvme0n1
$ cfdisk /dev/nvme1n1
$ cfdisk /dev/nvme2n1

$ gdisk /dev/nvme0n1
$  o
$  n
$   <default>
$   <default>
$   +2048M
$   ef00
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

$ gdisk /dev/nvme1n1
$  o
%  n
$   <default>
$   <default>
$   <default>
$   <default>
$  w

$ gdisk /dev/nvme2n1
$  o
$  n
$   <default>
$   <default>
$   <default>
$   <default>
$  w

$ mkfs.fat -F32 -n EFI /dev/nvme0n1p1

S mkfs.ntfs -Q -L WIN /dev/nvme0n1p4

$ mkfs.btrfs -L ARC -d raid0 -m raid1 /dev/nvme1n1p1 /dev/nvme2n1p1

$ mount LABEL=ARC /mnt

$ btrfs su cr /mnt/@

$ btrfs su cr /mnt/@home

$ btrfs su cr /mnt/@snapshots

$ btrfs su cr /mnt/@var_log

$ umount /mnt

$ mount -o noatime,compress=zstd,subvol=@ LABEL=ARC /mnt

$ mkdir -p /mnt/{boot,home,.snapshots,var/log}

$ mount -o noatime,compress=zstd,subvol=@home LABEL=ARC /mnt/home

$ mount -o noatime,compress=zstd,subvol=@snapshots LABEL=ARC /mnt/.snapshots

$ mount -o noatime,nodatacow,subvol=@var_log LABEL=ARC /mnt/var/log

$ mount /dev/nvme0n1p1 /mnt/boot

$ lsblk

$ archinstall

$ sudo nano /etc/fstab

$ sudo pacman -Syu

$ sudo pacman -S firefox hypridle hyprlock hyprpaper neovim stow tree waybar

$ sudo pacman -S bridge-utils dnsmasq iptables-nft qemu-base swtpm virt-manager virt-viewer

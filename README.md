# archinstall prep.

$ lsblk

$ cfdisk /dev/nvme0n1
$  <delete>
$  <write>
$  <quit>

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
$   +1048576[+1024]M
$   0700
$  n
$   <default>
$   <default>
$   <default>
$   <default>
$  w

$ mkfs.fat -F32 -n EFI /dev/nvme0n1p1

S mkfs.ntfs -Q -L WIN /dev/nvme0n1p3

$ mkfs.btrfs -f -L ARC /dev/nvme0n1p4

$ mount /dev/nvme0n1p4 /mnt

$ btrfs su cr /mnt/@

$ btrfs su cr /mnt/@home

$ btrfs su cr /mnt/@snapshots

$ btrfs su cr /mnt/@swap

$ btrfs su cr /mnt/@log

$ btrfs su cr /mnt/@pkg

$ umount /mnt

$ mount -o noatime,compress=zstd,subvol=@ /dev/nvme0n1p4 /mnt

$ mkdir -p /mnt/{boot,home,.snapshots,kvm,var/log,var/cache/pacman/pkg,swap}

$ mount -o noatime,compress=zstd,subvol=@home /dev/nvme0n1p4 /mnt/home

$ mount -o noatime,compress=zstd,subvol=@snapshots /dev/nvme0n1p4 /mnt/.snapshots

$ mount -o noatime,compress=zstd,subvol=@kvm /dev/nvme0n1p4 /mnt/kvm

$ mount -o noatime,nodatacow,subvol=@log /dev/nvme0n1p4 /mnt/var/log

$ mount -o noatime,nodatacow,subvol=@pkg /dev/nvme0n1p4 /mnt/var/cache/pacman/pkg

$ mount -o noatime,nodatacow,subvol=@swap /dev/nvme0n1p4 /mnt/swap

$ btrfs filesystem mkswapfile --size 32768M /mnt/swap/swapfile

$ swapon /mnt/swap/swapfile

$ mount /dev/nvme0n1p1 /mnt/boot

$ lsblk

$ archinstall

$ sudo nano /etc/fstab

$ sudo pacman -Syu

$ sudo pacman -S firefox hypridle hyprlock hyprpaper neovim stow tree waybar

$ sudo pacman -S --needed gcc make git ripgrep fd unzip

$ git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

$ sudo pacman -S bridge-utils dnsmasq iptables-nft qemu-base swtpm virt-manager virt-viewer

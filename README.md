# archinstall prep.

$ lsblk

$ gdisk /dev/nvme0n1
$ o
$ n
$  <default>
$  <default>
$  +2048M
$  ef00
$ n
$  <default>
$  <default>
$  <default>
$  <default>
$ w

$ mkfs.fat -F32 -n EFI /dev/nvme0n1p1

$ mkfs.btrfs -L GNU /dev/nvme0n1p2

$ mount /dev/nvme0n1p2 /mnt

$ btrfs su cr /mnt/@

$ btrfs su cr /mnt/@home

$ btrfs su cr /mnt/@snapshots

$ btrfs su cr /mnt/@swap

$ btrfs su cr /mnt/@var_log

$ umount /mnt

$ mount -o noatime,compress=zstd,subvol=@ /dev/nvme0n1p2 /mnt

$ mkdir -p /mnt/{boot,home,.snapshots,swap,var/log}

$ mount -o noatime,compress=zstd,subvol=@home /dev/nvme0n1p2 /mnt/home

$ mount -o noatime,compress=zstd,subvol=@snapshots /dev/nvme0n1p2 /mnt/.snapshots

$ mount -o noatime,nodatacow,subvol=@swap /dev/nvme0n1p2 /mnt/swap

$ mount -o noatime,nodatacow,subvol=@var_log /dev/nvme0n1p2 /mnt/var/log

$ btrfs filesystem mkswapfile --size 30720M /mnt/swap/swapfile

$ swapon /mnt/swap/swapfile

$ mount /dev/nvme0n1p1 /mnt/boot

$ lsblk

$ archinstall

$ sudo pacman -Syu

$ sudo pacman -S firefox hypridle hyprlock hyprpaper stow tree waybar

$ sudo pacman -S --needed gcc make git ripgrep fd unzip neovim

$ git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

$ sudo pacman -S bridge-utils dnsmasq iptables-nft qemu-base swtpm virt-manager virt-viewer

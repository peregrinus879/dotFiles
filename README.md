# Dual boot Windows & ArchLinux

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
$  +1024G
$  0700
$ n
$  <default>
$  <default>
$  <default>
$  <default>
$ w

$ mkfs.fat -F32 -n EFI /dev/nvme0n1p1

$ mkfs.ntfs -L WIN /dev/nvme0n1p2

$ mkfs.btrfs -L ARC /dev/nvme0n1p3

$ mount /dev/nvme0n1p3 /mnt

$ btrfs su cr /mnt/@

$ btrfs su cr /mnt/@home

$ btrfs su cr /mnt/@snapshots

$ btrfs su cr /mnt/@swap

$ umount /mnt

$ mount -o noatime,compress-zstd,subvol=@ /dev/nvme0n1p3 /mnt

$ mkdir -p /mnt/{boot,home,.snapshots,.swap}

$ mount -o subvol=@home /dev/nvme0n1p3 /mnt/home

$ mount -o noatime,compress=zstd,subvol=@snapshots /dev/nvme0n1p3 /mnt/archinstall/.snapshots

$ mount -o noatime,compress=zstd,subvol=@swap /dev/nvme0n1p3 /mnt/archinstall/.swap

$ mount /dev/nvme0n1p1 /mnt/boot

$ btrfs filesystem mkswapfile --size 30720M /mnt/.swap/swapfile

$ swapon /mnt/.swap/swapfile

$ lsblk

$ archinstall

$ sudo pacman -Syu

$ sudo pacman -S firefox firewalld gcc gimp git hypridle hyprlock hyprpaper make neovim sbctl stow transmission-cli transmission-qt tree unzip waybar

$ sudo pacman -S bridge-utils dnsmasq iptables-nft qemu-base swtpm virt-manager virt-viewer

$ sudo pacman -S --needed base-devel && git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si

$ paru -Syu

$ paru -S appimagelauncher brave-bin

$ git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

$ git@github.com:peregrinus879/dotFiles.git

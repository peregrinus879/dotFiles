# archinstall
// pre-installation reference: www.youtube.com/@Ja.KooLit

$ lsblk

$ fdisk /dev/nvme0n1
$ g
$ n
$  <default>
$  <default>
$  +2048M
$  Y
$ n
$  <default>
$  <default>
$  +32768M
$  Y
$ n
$  <default>
$  <default>
$  <default>
$  Y
$ t
$  1
$  1
$ t
$  2
$  82
$ w

$ mkfs.vfat -F 32 /dev/nvme0n1p1
$ mkswap /dev/nvme0n1p2
$ mkfs.btrfs /dev/nvme0n1p3

$ mount /dev/nvme0n1p3 /mnt
$ btrfs su cr /mnt/@
$ btrfs su cr /mnt/@home
$ btrfs su cr /mnt/@pkg
$ btrfs su cr /mnt/@log
$ btrfs su cr /mnt/@snapshots
$ umount /mnt

$ mkdir -p /mnt/archinstall
$ mount -o subvol=@ /dev/nvme0n1p3 /dev/archinstall

$ mkdir -p /mnt/archinstall/home
$ mkdir -p /mnt/archinstall/var/cache/pacman/pkg
$ mkdir -p /mnt/archinstall/var/log
$ mkdir -p /mnt/archinstall/.snapshots

$ mount -o subvol=@home /dev/nvme0n1p3 /dev/archinstall/home
$ mount -o subvol=@pkg /dev/nvme0n1p3 /dev/archinstall/var/cache/pacman/pkg
$ mount -o subvol=@log /dev/nvme0n1p3 /dev/archinstall/var/log
$ mount -o subvol=@snapshots /dev/nvme0n1p3 /dev/archinstall/.snapshots

$ mkdir -p /mnt/archinstall/boot
$ mount /dev/nvme0n1p1 /mnt/archinstall/boot
$ swapon /dev/nvme0n1p2

$ lsblk

$ archinstall

$ sudo pacman -Syu

$ sudo pacman -S firefox firewalld gimp git hypridle hyprlock hyprpaper neovim sbctl stow transmission-cli transmission-qt tree unzip waybar

$ sudo pacman -S bridge-utils dnsmasq iptables-nft qemu-base swtpm virt-manager virt-viewer

$ sudo pacman -S --needed base-devel && git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si

$ paru -Syu

$ paru -S appimagelauncher brave-bin

$ git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

$ git@github.com:peregrinus879/dotFiles.git

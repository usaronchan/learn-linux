sudo -i

# 从bios进入启动盘
# 通过archinstall安装系统盘到硬盘里
# 重启并进入系统

## Arch Linux install by CLI

# 设置键盘和字体
# 查看可选用的键盘
localectl list-keymaps
# 选择使用的键盘。默认us键盘
loadkeys us
loadkeys colemak


setfont ter-132b

# 连接到互联网
iwctl
device list


# 检测能否联网
ping baidu.com

# 设置同步上海时间
timedatectl set-timezone Asia/Shanghai

fdisk -l

cfdisk /dev/sda


# EFI (boot): 1GB
# / (root): 剩下的
# swap: At least 4GB

# 分卷
mkfs.ext4 /dev/root
mkfs.fat -F 32 /dev/efi
mkswap /dev/swap

# 挂载
mount /dev/root /mnt
mount --mkdir /dev/efi /mnt/boot
swapon /dev/swap


echo 'Server = https://mirrors.aliyun.com/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist && cat /etc/pacman.d/mirrorlist

# 最好加上sudo, vim
pacstrap -K /mnt base linux linux-firmware sudo vim

genfstab -U /mnt > /mnt/etc/fstab
# 进入已安装好的系统
arch-chroot /mnt


ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc


# pacman -S vim
# vim /etc/locale.gen

exit
vim /mnt/etc/locale.gen
# 找到 en_US.UTF-8 UTF-8
# 去掉注释
arch-chroot /mnt
locale-gen

exit
touch /mnt/etc/locale.conf && echo "LANG=en_US.UTF-8" > /mnt/etc/locale.conf
touch /mnt/etc/hostname && echo "arch" > /mnt/etc/hostname

arch-chroot /mnt
# root设置密码
passwd

pacman -S grub efibootmgr amd-ucode os-prober

mkdir /boot/grub && grub-mkconfig -o /boot/grub/grub.cfg


uname -m
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-install --target=x86_64-pc /dev/sda


pacman -S iwctl dhcpcd

grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg


umount -R /mnt
reboot

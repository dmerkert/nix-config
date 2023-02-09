# Hardware

## Invidia - Raspberry Pi 3B

* RAM: 1 GB
* CPU: Quad Core 1.2GHz Broadcom BCM2837 64bit
* Wifi: BCM43438
* Bluetooth: Bluetooth Low Energy (BLE)
* Ethernet: 100 Base Ethernet
* Ports:
  * 40-pin extended GPIO
  * 4 USB 2 ports
  * 4 Pole stereo output and composite video port
  * Full size HDMI
* Power requirements: 5V / 2.5A

## Ira - ODROID C4
Centrino Advanced-N 6200
* RAM: 4 GB LPDDR4 RAM
* CPU: Amlogic S905X3 Prozessor (2,0 GHz Cortex-A55 (ARM v8) Quad-Core-CPU)
* GPU: Mali-G31 MP2 GPU mit 4 x Execution Engines (650Mhz)
* Ethernet: 10/100/1000
* Ports:
  * HDMI 4K (4096 × 2048 Pixel), Codierung H.265 mit 60 FPS, H.264 mit 30 FPS
  * 40+7-Pin (GPIO, UART, I2C, I2S, ADC), Micro-SD- & eMMC-Steckplatz, IR-Empfänger
* Power requirements: 12 V / 2 A (über Hohlbuchse 5,5 mm außen und 2,1 mm innen)

## Luxuria - Lenovo ThinkPad T410

* RAM: 4 GB
* CPU: Intel Core i5 2.40 GHz
* GPU: VGA Intel Core Processor Integrated Graphics Controller
* Ethernet: 82577LM Gigabit Network Connection
* Bluetooth: Broadcom Bluetooth Device
* Wifi: Intel Centrino Advanced-N 6200
* Intenso Interne 2,5" SSD SATA III Top, 256 GB

# How to deploy NixOS

## Intel / AMD

### Preparations

* Download the appropriate ISO file from https://nixos.org/download.html#nixos-iso, e.g. via
```Shell
  wget https://channels.nixos.org/nixos-22.11/latest-nixos-gnome-x86_64-linux.iso -O nixos.iso
```

* Write the ISO file to an empty USB stick `sudo cp nixos.iso /dev/sdb`

* Boot from the USB device

* Install NixOS as intended on the target system. The **user name** must be `user`!

### Prepare NixOS

Edit the configuration `sudo nano /etc/nixos/configuration.nix`, replace
```
  # vim
  # wget
```
by
```
  vim
  git
  wget
```
and apply the configuration with `sudo nixos-rebuild switch`

### Copy / generate keys

* Generate user ssh key
```Shell
  ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -P ""
```

* Register the generated ssh key with Github for the repository https://github.com/dmerkert/nix-config

* Generate age-keys for nix-sops
```
  mkdir -p ~/.config/sops/age
  nix-shell -p ssh-to-age --run "ssh-to-age -private-key -i ~/.ssh/id_ed25519 > ~/.config/sops/age/keys.txt"
```

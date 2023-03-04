# Hardware

## Naming schema
A name of a hardware consists of 3 parts:
<use><model><number>

* <use> is a 3 letter identifier and is one of the following:
  * "lap" for laptop
  * "srv" for server
* <model> is a 3 letter identifier and is for example:
  * "ltp" for Lenovo ThinkPad T410
  * "rpi" for Raspberry Pi 3B
* <number> is a running 2 digit number, starting at 01

## srvrpi01 - Raspberry Pi 1B

## srvrpi02 - Raspberry Pi 3B

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

## srvodr01 - ODROID C4
Centrino Advanced-N 6200
* RAM: 4 GB LPDDR4 RAM
* CPU: Amlogic S905X3 Prozessor (2,0 GHz Cortex-A55 (ARM v8) Quad-Core-CPU)
* GPU: Mali-G31 MP2 GPU mit 4 x Execution Engines (650Mhz)
* Ethernet: 10/100/1000
* Ports:
  * HDMI 4K (4096 × 2048 Pixel), Codierung H.265 mit 60 FPS, H.264 mit 30 FPS
  * 40+7-Pin (GPIO, UART, I2C, I2S, ADC), Micro-SD- & eMMC-Steckplatz, IR-Empfänger
* Power requirements: 12 V / 2 A (über Hohlbuchse 5,5 mm außen und 2,1 mm innen)

## lapltp01 - Lenovo ThinkPad T410

* RAM: 4 GB
* CPU: Intel Core i5 2.40 GHz
* GPU: VGA Intel Core Processor Integrated Graphics Controller
* Ethernet: 82577LM Gigabit Network Connection
* Bluetooth: Broadcom Bluetooth Device
* Wifi: Intel Centrino Advanced-N 6200
* Intenso Interne 2,5" SSD SATA III Top, 256 GB

## lapasu01 - Asus Laptop

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


### Copy / generate keys

* Generate keys
```Shell
  sh deploy/1-generate-keys.sh
```
* Follow the instructions in the generated deploy/public_keys.txt
* Register the generated ssh key with Github for the repository https://github.com/dmerkert/nix-config

* Recode the sops secrets on a working system using
```Shell
  nix develop
  sops updatekeys secrets/common.yaml
```
* Push/pull secrets to the target machine



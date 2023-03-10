{ lib, config, ... }:
let
  hostname = config.networking.hostName;
  wipeScript = ''
    mkdir -p /btrfs
    mount -o subvol=/ /dev/disk/by-uuid/456059af-fdee-4d04-9c81-351b41501042 /btrfs

    if [ -e "/btrfs/root/dontwipe" ]; then
      echo "Not wiping root"
    else
      echo "Cleaning subvolume"
      btrfs subvolume list -o /btrfs/root | cut -f9 -d ' ' |
      while read subvolume; do
        btrfs subvolume delete "/btrfs/$subvolume"
      done && btrfs subvolume delete /btrfs/root

      echo "Restoring blank subvolume"
      btrfs subvolume snapshot /btrfs/root-blank /btrfs/root
    fi

    umount /btrfs
    rm /btrfs
  '';
in
{
  boot.initrd.supportedFilesystems = [ "btrfs" ];

  # Use postDeviceCommands if on old phase 1
  boot.initrd.postDeviceCommands = lib.mkBefore wipeScript;
  fileSystems."/boot" =
    { device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-label/swap"; }
    ];

  fileSystems."/" =
    { device = "/dev/disk/by-label/${hostname}";
      fsType = "btrfs";
      options = [ "subvol=root" "compress=zstd" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-label/${hostname}";
      fsType = "btrfs";
      options = [ "subvol=nix" "noatime" "compress=zstd" ];
    };

  fileSystems."/persist" =
    { device = "/dev/disk/by-label/${hostname}";
      fsType = "btrfs";
      options = [ "subvol=persist" "compress=zstd" ];
      neededForBoot = true;
    };

}

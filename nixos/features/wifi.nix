{config, ...}:
{
  #Home
  networking.wireless = {
    enable = true;
    interfaces = [ "wlan0" ];
    environmentFile = config.sops.secrets.wifi.path;
    networks = {
      "@home_ssid@" = {
        psk = "@home_psk@";
      };
    };
  };

    sops.secrets.wifi = {
      sopsFile = ../../secrets/common.yaml;
    };
}

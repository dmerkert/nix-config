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
      "@schilling_ssid@" = {
        psk = "@schilling_psk@";
      };
      "@haacke_ssid@" = {
        psk = "@haacke_psk@";
      };
      "@mapa_ssid@" = {
        psk = "@mapa_psk@";
      };
      "@sabrina_ssid@" = {
        psk = "@sabrina_psk@";
      };
    };
  };

    sops.secrets.wifi = {
      sopsFile = ../../secrets/common.yaml;
    };

    #TODO: persist
}

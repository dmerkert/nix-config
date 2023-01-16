{config, ...}:
{
  services.vdirsyncer = {
    enable = true;
    jobs.icloud_icloud = {
      enable = true;
      user = "root";
      group = "root";
      forceDiscover = true;
      config = {
        pairs = {
          cal_icloud_icloud = {
            a = "cal_icloud_icloud_dennis";
            b = "cal_icloud_icloud_jessika";
            collections = [ "from b" ];
            conflict_resolution = "b wins";
            metadata = [ "color" "displayname" ];
          };
        };
        storages = {
          cal_icloud_icloud_dennis = {
            type = "caldav";
            url = "https://caldav.icloud.com/";
            username = "info@dmerkert.de";
            "password.fetch" = [ "command" "cat" config.sops.secrets.icloud_dennis.path ];
          };

          cal_icloud_icloud_jessika = {
            type = "caldav";
            url = "https://caldav.icloud.com/";
            username = "geib.jessika@gmx.net";
            read_only = true;
            "password.fetch" = [ "command" "cat" config.sops.secrets.icloud_jessika.path ];
          };
        };

      };
    };
  };

  sops.secrets.icloud_dennis = {
    sopsFile = ../../secrets/common.yaml;
  };

  sops.secrets.icloud_jessika = {
    sopsFile = ../../secrets/common.yaml;
  };
}

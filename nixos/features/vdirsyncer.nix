{config, system, lib, ...}:
{
  services.vdirsyncer = {
    enable = false;

    ############
    # CALENDAR #
    ############

    jobs.icloud_icloud = {
      enable = false;
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
            metadata = [ "color" "displayname" "description" "order" ]; #Color and order are Apple specific
          };
        };
        storages = {
          cal_icloud_icloud_dennis = {
            type = "caldav";
            url = "https://caldav.icloud.com/";
            username = "info@dmerkert.de";
            read_only = false;
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

    ############
    # CONTACTS #
    ############

    jobs.contacts_icloud_dennis = {
      enable = true;
      user = "root";
      group = "root";
      forceDiscover = true;
      config = {
        pairs = {
          contacts_icloud_dennis = {
            a = "storage_icloud_dennis";
            b = "local";
            collections = [["contacts" "card" null]];
            conflict_resolution = "a wins";
            metadata = [ "description" "displayname" ];
          };
        };
        storages = {
          storage_icloud_dennis = {
            type = "carddav";
            url = "https://contacts.icloud.com/";
            username = "info@dmerkert.de";
            read_only = false;
            "password.fetch" = [ "command" "cat" config.sops.secrets.icloud_dennis.path ];
          };

          local = {
            type = "filesystem";
            path = "/var/lib/vdirsyncer/local_contacts";
            fileext = ".vcf";
          };

          #card_mailbox_dennis = {
          #  type = "carddav";
          #  url = "https://dav.mailbox.org/caldav/";
          #  username = "dmerkert@mailbox.org";
          #  read_only = false;
          #  "password.fetch" = [ "command" "cat" config.sops.secrets.mailbox_dennis.path ];
          #};
        };

      };
    };

  };

  #Create folders upon activation
  system.activationScripts.make_vdirsyncer_local_contacts = lib.stringAfter["var"] ''
    mkdir -p /var/lib/vdirsyncer/local_contacts
    '';

  sops.secrets.icloud_dennis = {
    sopsFile = ../../secrets/common.yaml;
  };

  sops.secrets.icloud_jessika = {
    sopsFile = ../../secrets/common.yaml;
  };

  sops.secrets.mailbox_dennis = {
    sopsFile = ../../secrets/common.yaml;
  };

  #TODO: persist
}

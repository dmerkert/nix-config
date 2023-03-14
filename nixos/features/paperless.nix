{config, ...}:
{
  services.paperless = {
    enable = true;
    address = "0.0.0.0";
    port = 58080;
 #   extraConfig = {
 #     PAPERLESS_TIME_ZONE = "Europe/Berlin";
 #     PAPERLESS_CONSUMER_DELETE_DUPLICATES = true;
 #     PAPERLESS_IGNORE_DATES = "1989-12-02,1992-01-19,2019-12-14,2022-01-04";
 #     PAPERLESS_OCR_LANGUAGE = "deu+eng";

 #     PAPERLESS_DBUSER = "paperless";
 #     PAPERLESS_DBNAME = "paperless";

 #   };
 #   passwordFile = config.sops.secrets.paperless_admin.path;
  };

   # Set-up database
 #  services.postgresql = {
 #    enable = true;
 #    ensureDatabases = [ "paperless" ];
 #    ensureUsers = [
 #      {
 #        name = "paperless";
 #        ensurePermissions."DATABASE paperless" = "ALL PRIVILEGES";
 #      }
 #    ];
 #  };

   sops.secrets.paperless_admin = {
     sopsFile = ../../secrets/common.yaml;
   };
   #TODO: persist
 }

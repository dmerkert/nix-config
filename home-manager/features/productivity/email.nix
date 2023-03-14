{config, pkgs, ...}:

let
  notmuch = "${pkgs.notmuch}/bin/notmuch";
  pass = "${config.programs.password-store.package}/bin/pass";
  mbsync = "${config.programs.mbsync.package}/bin/mbsync";
in
  {
    programs.mbsync.enable = true;
    programs.msmtp.enable = true;
    programs.notmuch = {
      enable = true;
      hooks = {
        preNew = "${mbsync} --all";
      };
    };
    programs.alot.enable = true;

    accounts.email.accounts.mailbox = {
      address = "info@dmerkert.de";
      aliases = [
        "allgemein@dennis-merkert.de"
        "privat@dennis-merkert.de"
      ];
      userName = "dmerkert@mailbox.org";
      imap.host = "imap.mailbox.org";
      smtp.host = "smtp.mailbox.org";
      smtp.tls.enable = true;
      primary = true;
      realName = "Dennis Merkert";
      passwordCommand = "${pass} smtp.mailbox.org/info@dmerkert.de";
      mbsync = {
        enable = true;
        create = "maildir";
      };
      msmtp.enable = true;
      notmuch.enable = true;
    };


    systemd.user.services.notmuch = {
      Unit = { Description = "notmuch synchronization"; };
      Service =
        {
          Type = "oneshot";
          ExecStart = "${notmuch} new";
        };
      };
      systemd.user.timers.notmuch = {
        Unit = { Description = "Automatic notmuch synchronization"; };
        Timer = {
          OnBootSec = "30";
          OnUnitActiveSec = "5m";
        };
        Install = { WantedBy = [ "timers.target" ]; };
      };

      home.persistence = {
        "/persist/home/user".directories = [
          "Maildir"
        ];
      };


    }

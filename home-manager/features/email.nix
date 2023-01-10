{config, ...}:

let
    pass = "${config.programs.password-store.package}/bin/pass";
in
{
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
    aerc = {
      enable = true;
      extraAccounts = {
        default = "INBOX";
        copy-to = "Sent";
      };
    };
  };

  programs.aerc = {
    enable = true;
    extraConfig = {
      general = {
        unsafe-accounts-conf = true;
      };
      ui = {
        mouse-enabled = true;
      };
    };
  };
}

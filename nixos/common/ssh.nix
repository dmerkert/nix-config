let
  prefix = "/persist";
in
{
  services.openssh = {
    enable = true;
    
    #Harden
    settings = {
      passwordAuthentication = false;
      permitRootLogin = "no";
    };

    hostKeys = [{
      path = "{$prefix}/etc/ssh/ssh_host_ed25519_key";
      type = "ed25519";

    }];
  };

  # Passwordless sudo when SSH'ing with keys
  security.pam.enableSSHAgentAuth = true;

  # Mosh
  programs.mosh.enable = true;
}

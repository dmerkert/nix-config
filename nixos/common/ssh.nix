{
  services.openssh = {
    enable = true;
    
    #Harden
    settings = {
      passwordAuthentication = false;
      permitRootLogin = "no";
    };
  };

  # Passwordless sudo when SSH'ing with keys
  security.pam.enableSSHAgentAuth = true;

  # Mosh
  programs.mosh.enable = true;
}

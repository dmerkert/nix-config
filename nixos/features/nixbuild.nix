{
  programs.ssh.extraConfig = ''
  Host eu.nixbuild.net
    PubkeyAcceptedKeyTypes ssh-ed25519
    IdentityFile /home/user/.ssh/id_ed25519_nixbuild
'';

programs.ssh.knownHosts = {
  nixbuild = {
    hostNames = [ "eu.nixbuild.net" ];
    publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPIQCZc54poJ8vqawd8TraNryQeJnvH1eLpIDgbiqymM";
  };
};

nix = {
  distributedBuilds = true;
  buildMachines = [
    { hostName = "eu.nixbuild.net";
      system = "aarch64-linux";
      maxJobs = 100;
      supportedFeatures = [ "benchmark" "big-parallel" ];
    }
  ];
};
}

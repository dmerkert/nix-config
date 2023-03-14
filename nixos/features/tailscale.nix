{pkgs, ...}:
{
  services.tailscale.enable = true;
  environment.systemPackages = [ pkgs.tailscale ];

  environment.persistence = {
    "/persist".directories = [ "/var/lib/tailscale" ];
  };
}

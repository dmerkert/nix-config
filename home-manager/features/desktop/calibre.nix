{pkgs, ...}:
{

  home = {
    packages = [ pkgs.calibre ];
    persistence = {
      "/persist/home/user".directories = [
        "buecher"
        ".config/calibre"
      ];
    };
  };
  
}

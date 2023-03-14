{pkgs, ...}:
{
  home.packages = [ pkgs.standardnotes ];

  home = {
    persistence = {
      "/persist/home/user".directories = [
        ".config/Standard Notes"
      ];
    };
  };

}

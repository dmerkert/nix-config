{pkgs, ...}:
{
  home.packages = [
    pkgs.libreoffice
    pkgs.hunspell
    pkgs.hunspellDicts.de_DE
    pkgs.hunspellDicts.en_US
  ];

  #TODO: persist
}

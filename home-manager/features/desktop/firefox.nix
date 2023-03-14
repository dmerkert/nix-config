{ pkgs, lib, inputs, ... }:
let
  addons = inputs.firefox-addons.packages.${pkgs.system};
in
{
  programs.firefox = {
    enable = true;
    extensions = with addons; [
      bitwarden
      ublock-origin
      #bypass-paywalls-clean
    ];
    profiles.default = {
      id = 0;
      name = "Default";
      isDefault = true;

      bookmarks = { };
      settings = {
        "browser.download.useDownloadDir" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.shell.defaultBrowserCheckCount" = 1;
        "browser.startup.homepage" = "https://www.google.de";
        "dom.security.https_first" = true;
        "identity.fxaccounts.enabled" = false;
        "privacy.trackingprotection.enabled" = true;
        "signon.rememberSignons" = false;
        "browser.startup.page" = 3;
      };
    };
  };

  home = {
    sessionVariables.BROWSER = "firefox";
    persistence = {
      "/persist/home/user".directories = [
        ".mozilla/firefox"
      ];
    };
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = [ "firefox.desktop" ];
    "text/xml" = [ "firefox.desktop" ];
    "x-scheme-handler/http" = [ "firefox.desktop" ];
    "x-scheme-handler/https" = [ "firefox.desktop" ];
  };
}

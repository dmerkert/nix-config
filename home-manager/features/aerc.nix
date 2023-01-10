{
  programs.aerc = {
    enable = true;
    extraConfig = {
      general = {
        unsafe-accounts-conf = true;
      };
      ui = {
        mouse-enabled = true;
      };
      filters = {
        "text/plain" = "sed 's/^>\\+.*/\\x1b[36m&\\x1b[0m/'";
        "text/html" = "/home/user/.nix-profile/share/aerc/filters/html";
      };
    };
    extraBinds = {
      messages = {
        q = ":quit<Enter>";

        j = ":next<Enter>";
        "<Down>" = ":next<Enter>";
        "<C-d>" = ":next 50%<Enter>";
        "<C-f>" = ":next 100%<Enter>";
        "<PgDn>" = ":next 100%<Enter>";

        k = ":prev<Enter>";
        "<Up>" = ":prev<Enter>";
        "<C-u>" = ":prev 50%<Enter>";
        "<C-b>" = ":prev 100%<Enter>";
        "<PgUp>" = ":prev 100%<Enter>";

        g = ":select 0<Enter>";
        G = ":select -1<Enter>";

        J = ":next-folder<Enter>";
        K = ":prev-folder<Enter>";
        H = ":collapse-folder<Enter>";
        L = ":expand-folder<Enter>";

        v = ":mark -t<Enter>";
        V = ":mark -v<Enter>";

        T = ":toggle-threads<Enter>";

        "<Enter>" = ":view<Enter>";
        d = ":prompt 'Really delete this message?' 'delete-message'<Enter>";
        D = ":delete<Enter>";
        A = ":archive flat<Enter>";

        C = ":compose<Enter>";

        rr = ":reply -a<Enter>";
        rq = ":reply -aq<Enter>";
        Rr = ":reply<Enter>";
        Rq = ":reply -q<Enter>";

        c = ":cf<space>";
        "$" = ":term<space>";
        "!" = ":term<space>";
        "|" = ":pipe<space>";

        "/" = ":search<space>";
        "\\" = ":filter<space>";
        n = ":next-result<Enter>";
        N = ":prev-result<Enter>";
        "<Esc>" = ":clear<Enter>";

      };
      "messages:folder=Drafts" = {
        "<Enter>" = ":recall<Enter>";
      };
      view = {
        "/" = ":toggle-key-passthrough<Enter>/";
        q = ":close<Enter>";
        O = ":open<Enter>";
        S = ":save<space>";
        "|" = ":pipe<space>";
        D = ":delete<Enter>";
        A = ":archive flat<Enter>";

        "<C-l>" = ":open-link <space>";

        f = ":forward<Enter>";
        rr = ":reply -a<Enter>";
        rq = ":reply -aq<Enter>";
        Rr = ":reply<Enter>";
        Rq = ":reply -q<Enter>";

        H = ":toggle-headers<Enter>";
        "<C-k>" = ":prev-part<Enter>";
        "<C-j>" = ":next-part<Enter>";
        J = ":next<Enter>";
        K = ":prev<Enter>";

      };
      "view::passthrough" = {
        "$noinherit" = true;
        "$ex" = "<C-x>";
        "<Esc>" = ":toggle-key-passthrough<Enter>";
      };

      compose = {
        # Keybindings used when the embedded terminal is not selected in the compose
        # view
        "$ex" = "<C-x>";
        "<C-k>" = ":prev-field<Enter>";
        "<C-j>" = ":next-field<Enter>";
        "<tab>" = ":next-field<Enter>";
      };

      "compose::editor" = {
        "$noinherit" = true;
        "$ex" = "<C-x>";
        "<C-k>" = ":prev-field<Enter>";
        "<C-j>" = ":next-field<Enter>";
        "<C-p>" = ":prev-tab<Enter>";
        "<C-n>" = ":next-tab<Enter>";
      };

      "compose::review" = {
        # Keybindings used when reviewing a message to be sent
        y = ":send<Enter>";
        n = ":abort<Enter>";
        p = ":postpone<Enter>";
        q = ":choose -o d discard abort -o p postpone postpone<Enter>";
        e = ":edit<Enter>";
        a = ":attach<space>";
        d = ":detach<space>";
      };

      terminal = {
        "$noinherit" = true;
        "$ex" = "<C-x>";

        "<C-p>" = ":prev-tab<Enter>";
        "<C-n>" = ":next-tab<Enter>";
      };

    };

  };
}

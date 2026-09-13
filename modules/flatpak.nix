{ pkgs, lib, ... }:
let

  # aplicaciones a instalar
  flatpakApps = [
    "com.github.tchx84.Flatseal" # Flatseal, gui de permisos de flatpaks
    # "im.vencord.Vesktop"
  ];

  installScript = pkgs.writeShellScript "install-flatpaks" ''
    set -e
    flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

    ${lib.concatMapStringsSep "\n" (app: ''
      flatpak install --user --noninteractive --or-update flathub ${app}
    '') flatpakApps}
  '';
in
{
  home.activation.installFlatpaks = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    run ${installScript}
  '';
}

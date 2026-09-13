{ pkgs, lib, ... }:
let
  flatpakApps = [
    "com.github.tchx84.Flatseal"
    # "im.vencord.Vesktop"
  ];

  flatpakBin = "${pkgs.flatpak}/bin/flatpak";

  installScript = pkgs.writeShellScript "install-flatpaks" ''
    set -e
    ${flatpakBin} remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

    ${lib.concatMapStringsSep "\n" (app: ''
      ${flatpakBin} install --user --noninteractive --or-update flathub ${app}
    '') flatpakApps}
  '';
in
{
  home.activation.installFlatpaks = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    run ${installScript}
  '';
}

{ pkgs, lib }:

pkgs.waybar.overrideAttrs (old: {
  version = "git-master";
  src = pkgs.fetchFromGitHub {
    owner = "Alexays";
    repo = "Waybar";
    rev = "master";
    hash = "sha256-G6AcGuevhkYflQHhJq9GnLhEMgcI51Y6MYKBQvdRPDc=";
  };
  buildInputs = (old.buildInputs or []) ++ [ pkgs.modemmanager ];
  mesonFlags = (lib.lists.remove "-Dcava=enabled" old.mesonFlags) ++ [ "-Dcava=disabled" ];
  doInstallCheck = false;
})

{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.jq
    pkgs.nmap
    pkgs.tcpdump
    pkgs.curlie
  ];
}

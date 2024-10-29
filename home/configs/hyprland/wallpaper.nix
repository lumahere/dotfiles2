{pkgs, lib, ...}:
let 
    wall = pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/D3Ext/aesthetic-wallpapers/main/images/nord-shanghai.png";
        sha256 = "HyVjU7fVA99LXtuxMtJrlUhW0oepb2wqTeyXlJBh6fk=";
    };
in 
{
    home.file.".wall/primary.jpg".source = wall;
}
{pkgs, config, ...}:
{
    imports = [
	./plugins.nix
	./keymaps.nix
	./cmp.nix
	./extraplugs
    ];
    programs.nixvim.enable = true;
    programs.nixvim = {
     colorschemes.tokyonight.enable = true; 
	opts = {
            relativenumber = true;
            shiftwidth = 4;
        };
	globals.mapleader = " ";
        globals.maplocalleader = " ";


    };
}

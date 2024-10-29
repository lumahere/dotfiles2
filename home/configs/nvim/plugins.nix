{pkgs, config, ...}:
{


    programs.nixvim.plugins = {
	  lualine.enable = true;
	  bufferline.enable = true;
	  nvim-tree.enable = true;
	  telescope.enable = true;
	  luasnip.enable = true;
	  cmp.enable = true;
	  nvim-colorizer.enable = true;
    };

    programs.nixvim.plugins.lsp = {
	enable = true;
	servers = {
	    rust-analyzer = {enable = true; installCargo = false; installRustc = false;};
	    clangd.enable = true;
	    html.enable = true;
	    cssls.enable = true;
	};

    };


    programs.nixvim.extraPlugins = with pkgs.vimPlugins; [
	{
	    plugin = nvim-autopairs;
            config = ''lua require("nvim-autopairs").setup {}'';
	}
    ];





}

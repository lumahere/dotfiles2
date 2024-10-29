{pkgs, config, ...}:
{
programs.nixvim = {
    plugins.cmp.settings.autoEnableSources = true;
    plugins.cmp.settings.completion.autocomplete = [ "TextChanged" ];
    plugins.cmp.settings.snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
    plugins.cmp.settings.sources = [{name = "nvim_lsp"; }{ name = "luasnip"; }{ name = "path";}{ name = "buffer";option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
 }];
    plugins.cmp.settings.mapping = {
	"<C-Space>" = "cmp.mapping.complete()";
	"<C-d>" = "cmp.mapping.scroll_docs(-4)";
	"<C-e>" = "cmp.mapping.close()";
	"<C-f>" = "cmp.mapping.scroll_docs(4)";
	"<CR>" = "cmp.mapping.confirm({ select = true })";
	"<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
	"<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
	    
	};
    };
}


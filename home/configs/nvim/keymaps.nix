{pkgs, config, ...}:
{
   programs.nixvim.keymaps = [
	{
	    key = "<leader>e";
	    action = "<cmd>NvimTreeToggle<CR>";
	}
	{
	    key = "<c-s>";
	    action = "<cmd>w<CR>";
	}
	{
	    key = "<c-q>";
	    action = "<cmd>q<CR>";
	}
	{
	    key = "<c-ESC>";
	    action = "<cmd>nohl<CR>";
	}

   ];

   programs.nixvim.plugins.lsp.onAttach = ''
	local bufmap = function(keys, func)
	    vim.keymap.set('n', keys, func, { buffer = bufnr })
	    end
	bufmap('<leader>r', vim.lsp.buf.rename)
	bufmap('<leader>a', vim.lsp.buf.code_action)

	bufmap('gd', vim.lsp.buf.definition)
	bufmap('gD', vim.lsp.buf.declaration)
	bufmap('gI', vim.lsp.buf.implementation)
	bufmap('<leader>D', vim.lsp.buf.type_definition)

	bufmap('gr', require('telescope.builtin').lsp_references)
	bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols)
	bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols)
	bufmap('K', vim.lsp.ruf.hover)
	bufmap('<leader>k', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
   '';
}

return {
	-- none-ls is fork of null-ls - a tool that wraps formatters and linters
	-- into a lsp-like server, which makes managing them much easier
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
                -- Warning: those are not installed automatically by Mason
                -- need to do it maually with :Mason
                -- Mason relies on different host apps like: pip, venv, npm etc.
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.clang_format,
                -- for linters it goes like this:
                -- null_ls.builtins.diagnostics.eslint_d,
			},
		})
	end,
}

return {
	"nvim-tree/nvim-tree.lua", 
	requires = {
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup()

		vim.keymap.set('n', '<leader>e', ":NvimTreeFocus<CR>");
	end,
}


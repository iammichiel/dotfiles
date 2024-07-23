return {
    "ntpeters/vim-better-whitespace",
    config = function()
        vim.keymap.set('n', '<leader>ss', ":StripWhiteSpace<CR>")
    end
}

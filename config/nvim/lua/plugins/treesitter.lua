return {
   "nvim-treesitter/nvim-treesitter",
   dependencies = {
       "windwp/nvim-ts-autotag"
   },
    build = ":TSUpdate",
    config = function()
        local treesitter = require("nvim-treesitter.configs")
        -- enable syntax highlighting
        treesitter.setup({
            highlight = {
                enable = true,
            },
            -- enable indentation
            indent = { enable = true },
            -- enable autotagging (w/ nvim-ts-autotag plugin)
            autotag = { enable = true },
            -- ensure these language parsers are installed
            ensure_installed = {
                "json",
                "javascript",
                "typescript",
                "tsx",
                "yaml",
                "elm",
                "html",
                "css",
                "markdown",
                "svelte",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
                "terraform"
            },
            -- auto install above language parsers
            auto_install = true,
        })

    end
}

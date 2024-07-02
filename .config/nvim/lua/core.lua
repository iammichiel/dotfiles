-- for conciseness
local opt = vim.opt

-- Show relative line numbers and current line number
opt.relativenumber = true
opt.number = true

-- Indentation
opt.tabstop = 4       -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 4    -- 2 spaces for indent width
opt.expandtab = true  -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- Using system clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

opt.iskeyword:append("-")           -- consider string-string as whole word


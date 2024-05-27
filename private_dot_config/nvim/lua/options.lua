require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

local opt = vim.opt
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

opt.wrap = false
opt.smartcase = true

opt.cursorline = true

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

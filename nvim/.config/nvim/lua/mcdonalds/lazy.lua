local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")

local plugins = {
    { import = "mcdonalds/plugins" },
    { import = "mcdonalds/plugins/lsp" },
    { import = "mcdonalds/plugins/themes" },
    { import = "mcdonalds/plugins/dap" },
}

local options = {
    change_detection = {
        enabled = true,
        notify = false
    }
}

lazy.setup(plugins, options)

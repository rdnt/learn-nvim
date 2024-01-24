-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
    {
        "catppuccin",
        lazy = false,
        opts = {
            flavour = "mocha",
            transparent_background = true,
        },
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin",
        },
    },

    {
        "echasnovski/mini.indentscope",
        opts = {
            delay = 0,
            draw = { animation = require("mini.indentscope").gen_animation.none() },
        },
    },

    { "stevearc/conform.nvim", enabled = false },
    { "nvimdev/dashboard-nvim", enabled = false },
    { "stevearc/dressing.nvim", enabled = false },
    { "folke/noice.nvim", enabled = false },
    { "rcarriga/nvim-notify", enabled = false },

}

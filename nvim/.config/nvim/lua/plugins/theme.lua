return {
    "morhetz/gruvbox",
    priority = 1000,
    config = function()
        vim.g.gruvbox_contrast_dark = "medium"
        vim.cmd.colorscheme 'gruvbox'
    end,
}

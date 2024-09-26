return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    version = "v0.9.2",
    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "css",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "python",
                "typescript",
                "vue",
                "dockerfile",
                "svelte"
            },
            sync_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            auto_install = false,
        })
    end
}

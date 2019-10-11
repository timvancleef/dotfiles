return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "javascript",
                "json",
                "lua",
                -- "terraform",
                "typescript",
                -- "vim",
                "html",
                "css",
            },
            sync_install = true,
            highlight = { enable = true },
            indent = { enable = true },  
            auto_install = true,
        })
    end
}

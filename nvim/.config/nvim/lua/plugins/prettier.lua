return {
    "prettier/vim-prettier",
    build = "npx yarn install --frozen-lockfile --production",
    version = "1.0.0",
    config = function ()
        vim.g["prettier#exec_cmd_async"] = 0
        vim.g["prettier#config#config_precedence"] = "prefer-file"
    end
}

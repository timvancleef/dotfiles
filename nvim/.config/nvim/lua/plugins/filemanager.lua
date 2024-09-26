return {
    "luukvbaal/nnn.nvim",
    config = function()
        local builtin = require("nnn").builtin

        require("nnn").setup {
            explorer = {
                cmd = "nnn -oAH",
                width = 40
            },
            picker = {
                cmd = "nnn -oAH",
                style = {
                    width = 0.6,
                    height = 0.8,
                    xoffset = 0.5,
                    yoffset = 0.5,
                },
            },
            replace_netrw = "picker",
            windownav = {
                right = "<leader>l"
            },
            mappings = {
                { "<C-h>", builtin.open_in_split }, -- open file(s) in split
                { "<C-v>", builtin.open_in_vsplit }, -- open file(s) in vertical split
                { "<C-p>", builtin.open_in_preview }, -- open file in preview split keeping nnn focused
            }
        }
    end
}

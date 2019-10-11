return {
    "luukvbaal/nnn.nvim",
    config = function()
        require("nnn").setup {
            picker = {
                style = {
                    width = 0.6,
                    height = 0.7,
                    xoffset = 0.9,
                    yoffset = 0.5,
                },
            },
            replace_netrw = "picker",
        }
    end
}

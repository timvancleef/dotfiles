return {
    "luukvbaal/nnn.nvim",
    config = function()
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
            }
        }
    end
}

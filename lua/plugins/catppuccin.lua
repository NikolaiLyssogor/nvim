return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = {
        color_overrides = {
            latte = {
                green = "#1a8c00",
                lavender = "#4561ff",
                peach = "#eb5d0c",
                sky = "#049cd9",
                yellow = "#d6830e",
                -- base = "#d6dae1",
            },
        },
    },
    config = function(_, opts)
        require("catppuccin").setup(opts)
        vim.cmd.colorscheme("catppuccin-mocha")
        -- latte, mocha, frappe macchiato
    end,
}

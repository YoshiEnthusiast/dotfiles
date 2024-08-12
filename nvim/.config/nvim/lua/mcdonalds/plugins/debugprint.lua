return {
    "andrewferrier/debugprint.nvim",
    dependencies = {
        "echasnovski/mini.nvim"
    },
    opts = {
        keymaps = {
            normal = {
                plain_below = "go",
                plain_above = "gO",
                variable_below = "gp"
            },
            visual = {
                variable_below = "gp"
            }
        }
    }
}


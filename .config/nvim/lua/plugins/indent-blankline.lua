return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        config = function()
            local highlight = { "RainbowGreen" }

            local hooks = require "ibl.hooks"
            -- create the highlight groups in the highlight setup hook, so they are reset
            -- every time the colorscheme changes
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
            end)

            require("ibl").setup({
                scope = {
                    enabled = true,
                    highlight = highlight
                }
            })
        end
    }
}

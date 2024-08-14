local keymap = {
    q = {':bd<CR>', 'Quit tab'},
    r = {
        name = 'run',
        p = {':!python %', 'run python'}
    }
}

return {
    {
        "folke/which-key.nvim",
        config = function()
            local wk = require("which-key")
            wk.setup()
            wk.register('leader', keymap)
            -- wk.register(
            --     {
            --         ["<leader>"] = {
            --             f = { name = "File" },
            --             d = { name = "Delete/Close" },
            --             q = { name = "Quit" },
            --             s = { name = "Search" },
            --             l = { name = "LSP" },
            --             u = { name = "UI" },
            --             b = { name = "Debugging" },
            --             g = { name = "Git" },
            --         }
            --     }
            -- )
        end
    }
}

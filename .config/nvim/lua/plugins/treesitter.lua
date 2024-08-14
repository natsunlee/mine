return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = {
                    "python",
                    "lua",
                    "javascript",
                    "typescript",
                    "yaml"
                },
                sync_install = false,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = true
                }
            }
        end
    }
}

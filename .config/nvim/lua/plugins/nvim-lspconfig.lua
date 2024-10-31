local utils = require("core.utils")

return {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim"
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason = require("mason")
      mason.setup()

      -- RUST
      lspconfig.rust_analyzer.setup({})

      -- GOLANG
      lspconfig.gopls.setup({
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
          },
        },
      })

      -- PYTHON
      lspconfig.pyright.setup({
        -- Add ability for pyright to discover the correct virtualenv. Works with global setting in Poetry for
        -- `virtualenvs.in-project = true`.
        before_init = function(initialize_params, config)
            local python_path = utils.find_python()
            config.settings.python.pythonPath = python_path
            utils.ensure_tables(initialize_params.initializationOptions, "settings", "python")
            initialize_params.initializationOptions.settings.python.pythonPath = python_path
          end,
        update_in_insert = true
      })

    end,
  }

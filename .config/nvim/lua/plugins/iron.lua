return {
  "hkupty/iron.nvim",
  config = function(plugins, opts)
    local iron = require("iron.core")

    iron.setup({
      config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Your repl definitions come here
        repl_definition = {
          python = {
            -- Can be a table or a function that
            -- returns a table (see below)
            command = { "smart_python" },
          },
        },
        -- How the repl window will be displayed
        -- See below for more information
        repl_open_cmd = require("iron.view").right(120),
      },
      -- Iron doesn't set keymaps by default anymore.
      -- You can set them here or manually add keymaps to the functions in iron.core
      keymaps = {
        send_motion = ",rc",
        visual_send = ",rc",
        send_file = ",rf",
        send_line = ",rl",
        send_mark = ",rm",
        send_paragraph = ',sp',
        mark_motion = ",rmc",
        mark_visual = ",rmc",
        remove_mark = ",rmd",
        cr = ",r<cr>",
        interrupt = ",r,",
        exit = ",rq",
        clear = ",rx",
      },
      -- If the highlight is on, you can change how it looks
      -- For the available options, check nvim_set_hl
      highlight = {
        italic = true,
      },
      ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
    })

    -- iron also has a list of commands, see :h iron-commands for all available commands
    vim.keymap.set("n", ",rs", "<cmd>IronRepl<cr>")
    vim.keymap.set("n", ",rr", "<cmd>IronRestart<cr>")
    vim.keymap.set("n", ",rF", "<cmd>IronFocus<cr>")
    vim.keymap.set("n", ",rh", "<cmd>IronHide<cr>")
  end,
}

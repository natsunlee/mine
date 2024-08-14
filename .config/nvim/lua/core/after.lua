-- Need to wait until plugins load for colors to be available
vim.cmd.colorscheme('catppuccin-frappe')

-- Must come after colorscheme is set
local hl_groups = { 'DiagnosticUnderlineError' }
for _, hl in ipairs(hl_groups) do
  vim.cmd.highlight(hl .. ' gui=undercurl')
end

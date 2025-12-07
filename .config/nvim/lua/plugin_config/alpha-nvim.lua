local alpha = require'alpha'
local dashboard = require'alpha.themes.dashboard'
local catppuccin = require'catppuccin'

dashboard.section.header.val = {
  [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
  [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
  [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
  [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
  [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
  [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
}

dashboard.section.buttons.val = {
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "  Find file", ":cd $HOME | Telescope find_files<CR>"),
  dashboard.button("r", "  Recently used files", ":Telescope oldfiles<CR>"),
  dashboard.button("s", "  Settings", ":e $MYVIMRC<CR>"),
  dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

dashboard.section.footer.val = "Welcome to Neovim"

alpha.setup(dashboard.opts)

local colors = require("catppuccin.palettes").get_palette()
vim.cmd("highlight AlphaHeader guifg=" .. colors.sky)
vim.cmd("highlight AlphaButtons guifg=" .. colors.lavender)
vim.cmd("highlight AlphaFooter guifg=" .. colors.rosewater)

vim.api.nvim_set_hl(0, 'AlphaHeader', { fg = colors.sky })
vim.api.nvim_set_hl(0, 'AlphaButtons', { fg = colors.lavender })
vim.api.nvim_set_hl(0, 'AlphaFooter', { fg = colors.rosewater })


local builtin = require('telescope.builtin')

vim.keymap.set('n', '<Space>ff', builtin.find_files, {})
vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
vim.keymap.set("n", "<Space>fb", ":Telescope file_browser path=%:p:h<CR>", { desc = "File Browser" })

-- vim.keymap.set('n', '<Space>fb', builtin.help_tags, {})
-- vim.keymap.set("n", "<Space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require'nvim-tree'.setup {
  git = {
    ignore = false,
  },
  filters = {
    custom = function(node)
      return node:match("%.o$")
    end
  }
}

vim.keymap.set('n', '<leader>t', ':NvimTreeFindFileToggle<CR>')

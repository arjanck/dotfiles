require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c", "lua", "rust", "ruby", "vim", "python", "bash"},

  autotag = { enable = true },
  sync_install = false,
  auto_install = false,
  highlight = {
    enabled = true
  },
  indent = { enable = true },
  ensure_installed = {
    "json",
    "javascript",
    "typescript",
    "tsx",
    "yaml",
    "html",
    "css",
    "markdown",
    "markdown_inline",
    "svelte",
    "graphql",
    "bash",
    "lua",
    "vim",
    "dockerfile",
    "gitignore",
  },
}

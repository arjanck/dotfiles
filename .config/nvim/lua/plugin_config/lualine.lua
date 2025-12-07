require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'catppuccin',
  },
  sections = {
    lualine_a = {
      {
        'filename',
        file_status = true,
        newfile_status = false,
        path = 1,
        shorting_target = 40,
        symbols = {
          modified = '[+]',
          readonly = '[-]',
          unnamed = '[No Name]',
          newfile = '[New]',
        }
      }
    }
  }
}

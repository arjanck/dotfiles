local bufferline = require('bufferline')

for i = 1, 9 do
    vim.keymap.set(
        'n',
        '<C-' .. i .. '>',
        function() bufferline.go_to_buffer(i, true) end,
        { noremap = true, silent = true }
    )
end

bufferline.setup {
    options = {
    mode = "buffers",
    numbers = "none",
    close_command = "bdelete! %d",
    right_mouse_command = "bdelete! %d",
    left_mouse_command = "buffer %d",
    buffer_close_icon = "",
    modified_icon = "●",
    close_icon = "",
    show_close_icon = false,
    show_buffer_close_icons = true,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
    end,
    color_icons = true,
    show_tab_indicators = true,
    show_duplicate_prefix = true,
    separator_style = "slant",
    enforce_regular_tabs = false,
    always_show_bufferline = true,

    offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "center",
        }
    },

    hover = {
        enabled = true,
        delay = 200,
        reveal = { 'close' }
      }
    },
}

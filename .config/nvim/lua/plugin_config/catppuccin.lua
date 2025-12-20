vim.o.termguicolors = true
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

local custom_highlights = function(colors)
    return {
        BufferLineInfo               = { fg = colors.surface0 },
        BufferLineInfoDiagnostic     = { fg = colors.surface2 },
        BufferLineHint               = { fg = colors.surface2 },
        BufferLineHintDiagnostic     = { fg = colors.surface2 },
        BufferLineWarning            = { fg = colors.surface2 },
        BufferLineWarningDiagnostic  = { fg = colors.surface2 },
        BufferLineError              = { fg = colors.surface2 },
        BufferLineErrorDiagnostic    = { fg = colors.surface2 },
        BufferLineFill               = { bg = colors.base },

        BufferLineSeparator          = { fg = colors.base, bg = colors.base },
        BufferLineSeparatorVisible   = { fg = colors.base, bg = colors.base },
        BufferLineSeparatorSelected  = { fg = colors.base, bg = colors.base },

        BufferLineTab                = { fg = colors.overlay0 },
        BufferLineTabSeparator       = { fg = colors.base, bg = colors.base },
        BufferLineTabSeparatorSelected = { fg = colors.base, bg = colors.base },

        BufferLineIndicatorSelected  = { fg = colors.pink },
        BufferLineIndicator          = { fg = colors.base },
    }
end

require("catppuccin").setup({
    flavour = "macchiato",
    integrations = {
        bufferline = true,
    },
    custom_highlights = custom_highlights,
})

vim.cmd([[colorscheme catppuccin]])


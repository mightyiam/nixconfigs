local winbar = {
  lualine_a = {
    'encoding',
    'fileformat',
  },
  lualine_b = {
    'filetype',
  },
  lualine_c = {
    {
      'filename',
      path = 1,
      shorting_target = 0,
    },
  },
  lualine_x = {
    'diff',
  },
  lualine_y = {
    'location',
  },
  lualine_z = {
    'progress',
  }
}

require('lualine').setup({
  options = {
    globalstatus = true,
    section_separators = "",
    component_separators = "",

    disabled_filetypes = {
      winbar = {
        'nerdtree',
        'Trouble',
      },
    },

    ignore_focus = {
        'nerdtree',
        'Trouble',
    },
  },

  extensions = {
    'nerdtree',
    'trouble',
  },

  winbar = winbar,
  inactive_winbar = winbar,

  sections = {
    lualine_a = {
      'mode',
    },
    lualine_b = {
      {
        'diagnostics',
        sources = { 'nvim_lsp' },
      },
    },
    lualine_c = {
    },
    lualine_x = {
    },
    lualine_y = {
    },
    lualine_z = {
      'branch',
    },
  },
})


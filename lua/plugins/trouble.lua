return {
  'folke/trouble.nvim',
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  config = function()
    require('trouble').setup()
  end,
  cmd = 'Trouble',
  keys = {
    {
      '<leader>tx',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>tX',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>cs',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = 'Document Symbols',
    },
    {
      '<leader>tt',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Quickfix List',
    },
  },
}

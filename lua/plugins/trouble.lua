return {
  'folke/trouble.nvim',
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  config = function()
    require('trouble').setup()
  end,
  cmd = 'Trouble',
  keys = {
    {
      '<leader>xx',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics',
    },
    {
      '<leader>xX',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer Diagnostics',
    },
    {
      '<leader>cs',
      '<cmd>Trouble symbols toggle focus=false<cr>',
      desc = 'Document Symbols',
    },
    {
      '<leader>xt',
      '<cmd>TodoTrouble<cr>',
      desc = 'TODOs list',
    },
    {
      '<leader>xT',
      '<cmd>TodoTrouble filter.buf=0<cr>',
      desc = 'Buffer TODOs list',
    },
  },
}

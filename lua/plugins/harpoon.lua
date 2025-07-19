local harpoon_mod
local telescope_mod
local telescope_finders
local telescope_pickers
local telescope_config_values

local function toggle_telescope(harpoon_files)
  telescope_pickers = telescope_pickers or require 'telescope.pickers'
  telescope_finders = telescope_finders or require 'telescope.finders'
  telescope_config_values = telescope_config_values or require('telescope.config').values

  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  telescope_pickers
    .new({}, {
      prompt_title = 'Harpoon',
      finder = telescope_finders.new_table {
        results = file_paths,
      },
      previewer = telescope_config_values.file_previewer {},
      sorter = telescope_config_values.generic_sorter {},
    })
    :find()
end

return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    harpoon_mod = require 'harpoon'
    harpoon_mod:setup {
      -- You can configure your default list here if needed, e.g.:
      -- default_file = vim.fn.stdpath("data") .. "/harpoon.json",
    }
    telescope_mod = require 'telescope'
    telescope_config_values = require('telescope.config').values
    telescope_finders = require 'telescope.finders'
    telescope_pickers = require 'telescope.pickers'
  end,
  keys = {
    {
      '<leader>ha',
      function()
        harpoon_mod:list():add()
      end,
      desc = 'Add file to Harpoon list',
    },
    {
      '<leader>hl',
      function()
        harpoon_mod.ui:toggle_quick_menu(harpoon_mod:list())
      end,
      desc = 'Toggle Harpoon Quick Menu',
    },
    {
      '<leader>h1',
      function()
        harpoon_mod:list():select(1)
      end,
      desc = 'Go to Harpoon file 1',
    },
    {
      '<leader>h2',
      function()
        harpoon_mod:list():select(2)
      end,
      desc = 'Go to Harpoon file 2',
    },
    {
      '<leader>h3',
      function()
        harpoon_mod:list():select(3)
      end,
      desc = 'Go to Harpoon file 3',
    },
    {
      '<leader>h4',
      function()
        harpoon_mod:list():select(4)
      end,
      desc = 'Go to Harpoon file 4',
    },
    {
      '<leader>hp',
      function()
        harpoon_mod:list():prev()
      end,
      desc = 'Go to previous Harpoon buffer',
    },
    {
      '<leader>hn',
      function()
        harpoon_mod:list():next()
      end,
      desc = 'Go to next Harpoon buffer',
    },
    {
      '<leader>hh',
      function()
        toggle_telescope(harpoon_mod:list())
      end,
      desc = 'Open Telescope Harpoon window',
    },
  },
}

return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = function(term)
        if term.direction == 'horizontal' then
          return vim.o.lines * 0.5
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.5
        end
      end,
      start_in_insert = true,
      close_on_exit = true,
      persist_size = true,
      winbar = { enabled = false },
      terminal_mappings = true,
      direction = 'horizontal',
      shade_terminals = false,
    }

    local Terminal = require('toggleterm.terminal').Terminal

    local horizontal_term = Terminal:new {
      count = 1,
      direction = 'horizontal',
      display_name = 'Horizontal',
    }

    local vertical_term = Terminal:new {
      count = 2,
      direction = 'vertical',
      display_name = 'Vertical',
    }

    vim.keymap.set('n', '<leader>tj', function() horizontal_term:toggle() end, { desc = '[T]oggle Horizontal terminal ([J])' })
    vim.keymap.set('n', '<leader>tl', function() vertical_term:toggle() end, { desc = '[T]oggle [L]Vertical terminal' })
  end,
}

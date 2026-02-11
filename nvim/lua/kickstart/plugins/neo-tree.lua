-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    {
      '<leader>e',
      function()
        local git_root = vim.fn.systemlist('git -C ' .. vim.fn.expand('%:p:h') .. ' rev-parse --show-toplevel')[1]
        if vim.v.shell_error == 0 and git_root then
          vim.cmd('Neotree toggle reveal dir=' .. git_root)
        else
          vim.cmd('Neotree toggle reveal')
        end
      end,
      desc = '[E]xplore NeoTree (git root)',
      silent = true,
    },
    { '<leader>e', ':Neotree toggle reveal<CR>', desc = '[E]xplore NeoTree', silent = true, ft = 'neo-tree' },
  },
  opts = {
    filesystem = {
      hijack_netrw_behavior = "disabled",
      follow_current_file = {
        enabled = false,
      },
      use_libuv_file_watcher = true,
      window = {
            position = "right",
        mappings = {
          ['<esc>'] = 'close_window',
        },
      },
    },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)
    -- Open neo-tree at the directory where nvim was started
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        -- Only open if we're in a directory
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree.command").execute({
            action = "focus",
            source = "filesystem",
        position = "right",
            dir = vim.fn.argv(0),
          })
        end
      end,
    })
  end,
}

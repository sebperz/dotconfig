-- [[ Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', ';', ':')

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { nowait = true })
vim.keymap.set('i', 'jk', '<Esc>', { nowait = true })
vim.keymap.set('i', 'kj', '<Esc>', { nowait = true })

-- Diagnostic Config & Keymaps
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
    update_in_insert = false,
    severity_sort = true,
    float = { border = 'rounded', source = 'if_many' },
    underline = { severity = vim.diagnostic.severity.ERROR },

    -- Can switch between these as you prefer
    virtual_text = true, -- Text shows up at the end of the line
    virtual_lines = false, -- Teest shows up underneath the line, with virtual lines

    -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
    jump = { float = true },
}

vim.keymap.set(
    'n',
    '<leader>q',
    vim.diagnostic.setloclist,
    { desc = 'Open diagnostic [Q]uickfix list' }
)

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set(
    'n',
    '<C-h>',
    '<C-w><C-h>',
    { desc = 'Move focus to the left window' }
)
vim.keymap.set(
    'n',
    '<C-l>',
    '<C-w><C-l>',
    { desc = 'Move focus to the right window' }
)
vim.keymap.set(
    'n',
    '<C-j>',
    '<C-w><C-j>',
    { desc = 'Move focus to the lower window' }
)
vim.keymap.set(
    'n',
    '<C-k>',
    '<C-w><C-k>',
    { desc = 'Move focus to the upper window' }
)

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
vim.keymap.set('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
vim.keymap.set('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
vim.keymap.set('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
vim.keymap.set('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })

vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- Close current buffer
vim.keymap.set(
    'n',
    '<leader>x',
    ':bdelete<CR>',
    { desc = 'Close [X] buffer', silent = true }
)

-- Terminal mode window navigation
vim.keymap.set(
    't',
    '<C-h>',
    '<C-\\><C-n><C-w>h',
    { desc = 'Move focus to the left window' }
)
vim.keymap.set(
    't',
    '<C-j>',
    '<C-\\><C-n><C-w>j',
    { desc = 'Move focus to the lower window' }
)
vim.keymap.set(
    't',
    '<C-k>',
    '<C-\\><C-n><C-w>k',
    { desc = 'Move focus to the upper window' }
)
vim.keymap.set(
    't',
    '<C-l>',
    '<C-\\><C-n><C-w>l',
    { desc = 'Move focus to the right window' }
)

-- Leap.nvim - Helix-style "goto word" motion
vim.keymap.set(
    { 'n', 'x', 'o' },
    'gw',
    '<Plug>(leap)',
    { desc = '[G]o to [W]ord' }
)

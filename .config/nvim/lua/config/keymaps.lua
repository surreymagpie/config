-- Open Neotree
vim.keymap.set('n', '<leader>e', '<cmd>:Neotree toggle reveal left<CR>')

-- Show list characters
vim.keymap.set('n', '<leader>l', '<cmd>set list!<CR>')

-- Set up Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>',      builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

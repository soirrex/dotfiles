return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')

    -- Map `<leader>ff` to find files in the current project
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

    -- Map `<leader>fw` to live grep (search text) in project files
    vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})

    -- Map `<leader>fb` to list open buffers for easy switching
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

    -- Map `<leader>fh` to show available help tags in documentation
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

    -- Map `<leader>gb` to list Git branches in the current repository
    vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})

    -- Map `<leader>gc` to show Git commit history in the repository
    vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})

    -- Map `<leader>gs` to display the current Git status (modified and added files)
    vim.keymap.set('n', '<leader>gs', builtin.git_status, {})

    -- Map `<leader>ls` to list document symbols provided by LSP
    vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, {})

    -- Map `gr` to find and show references to a symbol using LSP
    vim.keymap.set('n', '<leader>gr', builtin.lsp_references, { noremap = true, silent = true })

    -- Map `gd` to go to the definition of a symbol using LSP
    vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, { noremap = true, silent = true })
  end
}

return
{
    'nvim-telescope/telescope.nvim',
    -- tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        {'<leader>ff', '<CMD>Telescope find_files<CR>', desc = 'Files'},
        {'<leader>fh', '<CMD>Telescope help_tags<CR>',  desc = 'Help'},
        {'<leader>fG', '<CMD>Telescope live_grep<CR>',  desc = 'Grep'},
        {'<leader>fb', '<CMD>Telescope buffers<CR>',    desc = 'Buffers'},
        {'<leader>fk', '<CMD>Telescope keymaps<CR>',    desc = 'Keymaps'},
        {'<leader>fg', '<CMD>Telescope git_files<CR>',  desc = 'Git files'},
        {'<leader>fs', '<CMD>Telescope lsp_document_symbols<CR>', desc = 'Document symbols' },
        {'<leader>fS', '<CMD>Telescope lsp_dynamic_workspace_symbols<CR>', desc = 'Workspace symbols' },
    },
    config = function()
        local actions = require('telescope.actions')
        local action_state = require("telescope.actions.state")

        local function create_file(prompt_bufnr)
            local prompt = action_state.get_current_line()
            actions.close(prompt_bufnr)
            vim.cmd('edit ' .. prompt)
        end

        require('telescope').setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-e>"] = create_file,

                    }
                },
            }
        })
    end
}

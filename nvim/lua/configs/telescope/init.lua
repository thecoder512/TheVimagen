-- Enable telescope extensions, if they are installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')
local trouble = require("trouble.providers.telescope")
require('configs.telescope.keymaps')
local live_grep_git_root = require('configs.telescope.functions').live_grep_git_root


require('telescope').setup {
    -- You can put your default mappings / updates / etc. in here
    --  All the info you're looking for is in `:help telescope.setup()`
    --
    defaults = {
        mappings = {
            i = { ["<C-enter>"] = trouble.open_with_trouble },
            n = { ["<leader>s"] = trouble.open_with_trouble },
            -- i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        },
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
        ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
        },
    },
}

vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

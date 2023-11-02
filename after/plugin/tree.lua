vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_disable_netrw = 1

vim.opt.termguicolors = true

require("nvim-tree").setup({
    filters = {
        dotfiles = false,
        git_ignored = false
    },
    actions = {
        open_file = { quit_on_open = true }
    }
})

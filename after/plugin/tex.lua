--So it is the same as <leader> instead of \
vim.g.vimtex_compiler_method = "latexmk"
vim.g.maplocalleader = " "
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_compiler_latexmk = {
    options = {
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
        '-shell-escape',
    },
}

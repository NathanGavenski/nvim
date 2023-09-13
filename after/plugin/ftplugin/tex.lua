local group = vim.api.nvim_create_augroup("Tex Wrap Settings", { clear = true })


vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.tex",
	group = group,
    command = 'setlocal wrap'
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.bib",
	group = group,
    command = 'setlocal wrap'
})

vim.api.nvim_create_autocmd("BufLeave", {
	pattern = "*",
    group = group,
    command = 'setlocal nowrap'
})

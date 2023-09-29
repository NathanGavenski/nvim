
local group = vim.api.nvim_create_augroup("Markdown Wrap Settings", { clear = true })


vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.txt",
	group = group,
    command = 'setlocal wrap'
})

vim.api.nvim_create_autocmd("BufLeave", {
	pattern = "*",
    group = group,
    command = 'setlocal nowrap'
})

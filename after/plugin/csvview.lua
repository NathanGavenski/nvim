local csv = require("csvview")

csv.setup({
    parser = {
        async_chunksize = 50,
    },
    view = {
        min_column_width = 5,
        spacing = 2,
        display_mode = "highlight",
    },
})

vim.keymap.set("n", "<leader>t", function() csv.toggle() end)



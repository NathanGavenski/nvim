local config = {
    colorcolumn = "100",
    disabled_filetypes = { "help", "text", "markdown", "tex", "netrw" },
    custom_colorcolumn = { python = { "80", "100" } }
}

require("smartcolumn").setup(config)


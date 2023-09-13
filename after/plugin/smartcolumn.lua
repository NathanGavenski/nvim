local config = {
    colorcolumn = "100",
    disable_filetypes = { "help", "text", "markdown" },
    custom_colorcolumn = { tex = "0", python = { "80", "100" }, netrw = "0" }
}

require("smartcolumn").setup(config)


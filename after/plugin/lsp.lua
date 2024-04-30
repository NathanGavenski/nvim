local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.nvim_lua_ls()
lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<lead r>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<Enter>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp_action.tab_complete(),
    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    ['<C-Space>'] = cmp.mapping.complete(),
})

cmp.setup({
  mapping = cmp_mappings,
  keyword_length = 0,
  automcomplete = true,
  preselect = "item",
  completion = {
      completeopt = "menu,menuone,noinsert"
  }
})


vim.diagnostic.config({
    virtual_text = true
})

require('mason').setup({
    ensure_installed = {"pylint", "debugpy", "autopep8", "ltex"}
})
require('mason-lspconfig').setup({
  ensure_installed = {"pylsp", "texlab"},
  handlers = {
    lsp.default_setup,
  }
})
require('lspconfig').ltex.setup({
  settings = {
    ltex = { language = "en-GB" }
  }
})


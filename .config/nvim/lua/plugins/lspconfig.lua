return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    vim.lsp.config("ts_ls", {})
    vim.lsp.config("lua_ls", {})
    vim.lsp.config("pyright", {})
    vim.lsp.config("rust_analyzer", {})
    vim.lsp.config("bashls", {})
    vim.lsp.config("cssls", {})
    --vim.lsp.config("vue_ls", {})

    lspconfig.arduino_language_server.setup {
      cmd = {
        "arduino-language-server",
        "-cli-config", vim.fn.expand("/home/kolya/.arduino15/arduino-cli.yaml"),
        "-fqbn", "arduino:avr:uno",
      },
    }


    lspconfig.vuels.setup({})

    vim.lsp.enable({
      "ts_ls",
      "lua_ls",
      "bashls",
      "cssls",
      "pyright",
      "rust_analyzer",
      --"vue_ls",
    })
  end,
}

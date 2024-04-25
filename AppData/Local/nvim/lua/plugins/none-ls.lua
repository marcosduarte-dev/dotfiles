return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.biome,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.pyink,
        null_ls.builtins.formatting.rustywind,
        null_ls.builtins.formatting.sqlfmt,
        --null_ls.builtins.diagnostics.eslint_d,
        --null_ls.builtins.diagnostics.jsonlint,
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "angularls", "clangd", "cssls", "dockerls", "eslint", "gopls", "html", "jsonls", "jdtls", "biome", "pyre", "rust_analyzer", "sqlls", "vuels" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")

      local util = require 'lspconfig/util'

      local function get_probe_dir(root_dir)
        local project_root = util.find_node_modules_ancestor(root_dir)

        return project_root and (project_root .. '/node_modules') or ''
      end

      local default_probe_dir = get_probe_dir(vim.fn.getcwd())

      local cmd = {"ngserver", "--stdio", "--tsProbeLocations", default_probe_dir, "--ngProbeLocations", default_probe_dir}

      lspconfig.lua_ls.setup({
        capabilities = capabilities 
      })
      lspconfig.angularls.setup({
        capabilities = capabilities,
        cmd = cmd,
        on_new_config = function(new_config,new_root_dir)
          new_config.cmd = cmd
        end,
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
      lspconfig.dockerls.setup({
        capabilities = capabilities,
      })
      lspconfig.eslint.setup({
        capabilities = capabilities,
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.jsonls.setup({
        capabilities = capabilities,
      })
      lspconfig.jdtls.setup({
        capabilities = capabilities,
      })
      lspconfig.biome.setup({
        capabilities = capabilities,
      })
      lspconfig.pyre.setup({
        capabilities = capabilities,
      })
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
      })
      lspconfig.sqlls.setup({
        capabilities = capabilities,
      })
      lspconfig.vuels.setup({
        capabilities = capabilities,
      })
      
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}

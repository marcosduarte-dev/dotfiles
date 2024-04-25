return {
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate", 
  config = function()
      local tree = require("nvim-treesitter.configs")
      tree.setup({
        --ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", "angular", "css", "dockerfile", "go", "java", "json", "python", "sql", "typescript", "vue", "rust" },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },  
      }) 
  end
}


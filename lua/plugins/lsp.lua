return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")

      mason.setup()
      mason_lspconfig.setup({
        ensure_installed = { "pyright", "lua_ls", "html", "cssls", "ts_ls" },
        automatic_installation = true,
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
      end

      -- Use new Neovim API instead of deprecated lspconfig
      local default_config = {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      -- Setup each installed server dynamically
      for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
        local ok, conf = pcall(require, "lspconfig.configs." .. server)
        if not ok then
          vim.lsp.start({
            name = server,
            cmd = vim.lsp.rpc.connect("127.0.0.1", 0), -- placeholder fallback
            root_dir = vim.fn.getcwd(),
            settings = {},
            on_attach = on_attach,
            capabilities = capabilities,
          })
        else
          vim.lsp.config(server, vim.tbl_deep_extend("force", default_config, conf))
        end
      end
    end,
  },
}


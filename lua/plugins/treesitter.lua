return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects", -- optional but useful later
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        -- Parsers to install
        ensure_installed = {
          "bash",
          "c",        -- useful if you touch native modules
          "html",
          "css",
          "javascript",
          "typescript",
          "tsx",
          "json",
          "lua",
          "python",
          "markdown",
          "markdown_inline",
          "yaml",
          "toml",
        },
        sync_install = false,    -- don't block Neovim during install
        auto_install = true,     -- install missing parsers when entering buffer
        highlight = {
          enable = true,         -- false will disable the whole extension
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
	autotage = { 
	    enable = true 
	},
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",       -- start selection
            node_incremental = "grn",     -- expand to next node
            scope_incremental = "grc",    -- expand to scope
            node_decremental = "grm",     -- shrink selection
          },
        },

        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]m"] = "@function.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
            },
          },
        },
      })

      -- Use treesitter for folding
      vim.o.foldmethod = "expr"
      vim.o.foldexpr   = "nvim_treesitter#foldexpr()"
      -- Start with all folds open
      vim.o.foldlevel = 99
    end,
  },
}


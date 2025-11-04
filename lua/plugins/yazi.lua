return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  config = function()
    require("yazi").setup({
      open_for_directories = true,
      keymaps = {
        open_in_split = "<C-s>",
        open_in_vsplit = "<C-v>",
        open_in_tab = "<C-t>",
      },
    })
  end,
}


-- setting up leader key
vim.g.mapleader = " "
vim.keymap.set("n","<leader>cd",vim.cmd.Ex)

-- Neotree
vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
vim.keymap.set("n", "<leader>e", ":Neotree reveal<CR>", { desc = "Reveal file in Neo-tree" })

--Yazi
vim.keymap.set("n","<leader>yy", ":Yazi <CR>", { desc = "Lauch Yazi"})

--Custom Keybinds


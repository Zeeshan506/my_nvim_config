-- setting up leader key
vim.g.mapleader = " "

--Yazi
vim.keymap.set("n", "<leader>yy", ":Yazi <CR>", { desc = "Lauch Yazi" })

--Custom Keys and All Others Will Be Moving Them Here Soon. for clear mapping.
vim.keymap.set("n", "<leader>th", ":Themery <CR>", { desc = "Open theme picker" })

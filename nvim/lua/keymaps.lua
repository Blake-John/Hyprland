-- print ("load keymaps.lua")

local map = vim.api.nvim_set_keymap

-- map ( <mode>, <key>, <cmd/reflection>, opts)

map ("n", "<C-CR>", "<cmd>help keyword<CR>", { desc = "Open help documents" })

-- set the keymaps for the cursor movement
map ("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map ("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map ("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map ("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
map ("n", "j", "gj", { noremap = true, desc = "Down" })
map ("n", "k", "gk", { noremap = true, desc = "Up" })

map ("i", "<C-h>", "<esc><C-w>h", { desc = "Go to left window" })
map ("i", "<C-j>", "<esc><C-w>j", { desc = "Go to lower window" })
map ("i", "<C-k>", "<esc><C-w>k", { desc = "Go to upper window" })
map ("i", "<C-l>", "<esc><C-w>l", { desc = "Go to right window" })

-- set the keymaps for the windows resize
map ("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
map ("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
map ("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })
map ("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })

-- set the keymaps for the line movement
map ("n", "<A-Down>", "<cmd>m .+1<CR>==", { desc = "Move Down" })
map ("n", "<A-Up>", "<cmd>m .-2<CR>==", { desc = "Move Up" })
map ("i", "<A-Down>", "<esc><cmd>m .+1<CR>==gi", { desc = "Move Down" })
map ("i", "<A-Up>", "<esc><cmd>m .-2<CR>==gi", { desc = "Move Up" })
map ("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move Down" })
map ("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move Up" })

-- Clear search with <esc>
map ("n", "<esc>", ":noh<CR>", { desc = "Escape and clear hlsearch" })

-- Add undo break-points
map ("i", ",", ",<c-g>u", {})
map ("i", ".", ".<c-g>u", {})
map ("i", ";", ";<c-g>u", {})
map ("i", ":", ":<c-g>u", {})
map ("i", "\n", "\n<c-g>u", {})
map ("i", "<CR>", "<CR><c-g>u", {})

-- Add exit key
map ("i", "jk", "<ESC>", { desc = "Esc" })

-- better indenting
map ("v", "<tab>", ">gv", { desc = "Indent Right" })
map ("v", "<S-tab>", "<gv", { desc = "Indent Left" })
-- map ("i", "<tab>", "<esc><S-v>>i", {})
-- map ("i", "<S-tab>", "<esc><S-v><i", {})
map ("n", "<tab>", "<esc><S-v>><esc>", { desc = "Indent Right" })
map ("n", "<S-tab>", "<esc><S-v><<esc>", { desc = "Indent Left" })

-- split the windows
map ("n", "<leader>\\", "<c-w>v", { desc = "Split window Right" })
map ("n", "<leader>-", "<c-w>s", { desc = "Split window Bellow" })
map ("n", "<leader>q", "<c-w>q", {desc = "Quit a window" })

-- the buffer change
map ("n", "<C-]>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map ("n", "<C-[>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
map ("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })


-- terminal
map ("n", "<C-`>", ":sp | terminal<CR>", { desc = "Terminal Bellow"})
map ("n", "<C-\\>", ":vsp | terminal<CR>", { desc = "Terminal Right"})

-- -- comment
-- map ("n", "<C-/>", "gcc", { desc = "Toggle Comment" })
-- map ("i", "<C-/>", "gcc", { desc = "Toggle Comment" })
-- map ("v", "<C-/>", "gc", { desc = "Toggle Comment" })

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap

local function optsWithDesc(desc)
  return { noremap = true, silent = true, desc = desc }
end

local opts = { noremap = true, silent = true }

-- Map movement
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("i", "kj", "<Esc>l", opts)
keymap.set("v", "q", "<Esc>", opts)
keymap.set("i", "jk", "<Esc>", opts)
-- keymap.set("n", "<C-d>", "<C-d>zz")
-- keymap.set("n", "<C-u>", "<C-u>zz")
-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Paste without replacing the register
keymap.set("n", "p", "P", opts)
keymap.set("v", "p", "P", opts)

-- Map depete
keymap.set("n", "d", '"_d', opts)
keymap.set("v", "d", '"_d', opts)
keymap.set("n", "dd", '"_dd', opts)
keymap.set("v", "dd", '"_dd', opts)
keymap.set("n", "x", '"_x', opts)
keymap.set("v", "x", '"_x', opts)
keymap.set("n", "c", "x", opts)
keymap.set("v", "c", "x", opts)

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit ", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<S-tab>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "vs", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sl", "<C-w>l")
keymap.set("n", "sj", "<C-w>j")

-- Resize window
keymap.set("n", "<C-Up>", "<cmd>resize +5<cr>", { desc = "Increase Window Height" })
keymap.set("n", "<C-Down>", "<cmd>resize -5<cr>", { desc = "Decrease Window Height" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -5<cr>", { desc = "Decrease Window Width" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +5<cr>", { desc = "Increase Window Width" })

-- Diagnostics
-- keymap.set("n", "<C-j>", function()
--   vim.diagnostic.goto_next()
-- end, opts)

-- Undotree
keymap.set("n", "<localleader>u", vim.cmd.UndotreeToggle, optsWithDesc("Undotree Toggle"))

-- -- Lspsaga
-- keymap.set("n", "<C-t>", "<cmd>Lspsaga term_toggle <CR>")
-- keymap.set("t", "<C-t>", "<cmd>Lspsaga term_toggle <CR>")
-- keymap.set("n", "<C-i>", "<cmd>Lspsaga code_action <CR>")
-- keymap.set("n", "K", "<cmd>Lspsaga hover_doc <CR>")

-- Terminal
keymap.set("t", "<C-[>", "<C-\\><C-n>", opts)
keymap.set("n", "vt", ":vsplit<Return>:terminal<Return>a", opts)

-- Cody
-- keymap.set("n", "<leader>tp", function()
--   vim.lsp.buf.execute_command({ command = "tinymist.pinMain", arguments = { vim.api.nvim_buf_get_name(0) } })
-- end)
-- keymap.set("n", "<leader>tup", function()
--   vim.lsp.buf.execute_command({ command = "tinymist.pinMain", arguments = { nil } })
-- end)

keymap.set("n", "<localleader>ce", "<cmd>CommentREPLExecute<CR>", optsWithDesc("Comment REPL Execute"))
keymap.set("n", "<localleader>cl", "<cmd>CommentREPLLog<CR>", optsWithDesc("CommentREPLLog"))

-- Diagnostics
-- keymap.set("n", "<C-j>", function()
--   vim.diagnostic.goto_next()
-- end, opts)
-- keymap.set("n", "<C-k", function()
--   vim.diagnostic.goto_prev()
-- end, opts)
keymap.set("i", "`", "^", opts)

-- Ultilities
keymap.set("n", "<localleader>cw", function()
  print(vim.fn.getcwd())
  vim.fn.setreg("+", vim.fn.getcwd())
end, optsWithDesc("Current working directory"))

-- buffer location
keymap.set("n", "<localleader>fl", function()
  print(vim.api.nvim_buf_get_name(0))
  vim.fn.setreg("+", vim.api.nvim_buf_get_name(0))
end, optsWithDesc("File location"))

-- change working directory to current buffer
keymap.set("n", "<localleader>cd", function()
  local current_file = vim.api.nvim_buf_get_name(0)
  local file_dir = vim.fn.fnamemodify(current_file, ":h")
  vim.api.nvim_set_current_dir(file_dir)
  print("Changed directory to: " .. file_dir)
end, optsWithDesc("Change to current buffer's directory"))

-- change working directory to a directory pass via argument
keymap.set("n", "<localleader>cD", function()
  local dir = vim.fn.input("Enter directory: ", "", "dir")
  if dir ~= "" then
    vim.api.nvim_set_current_dir(dir)
    print("Changed directory to: " .. dir)
  end
end, optsWithDesc("Change to specified directory"))

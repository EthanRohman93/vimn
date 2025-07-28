-- Set leader key first
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General settings
vim.opt.syntax = "on"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.cursorline = true
vim.opt.visualbell = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.textwidth = 100
vim.opt.colorcolumn = "80,105"
vim.opt.mouse = "a"
vim.opt.signcolumn = "yes"
vim.opt.hidden = true
vim.opt.cmdheight = 1
vim.opt.showmode = false

-- Filetype-specific settings
vim.api.nvim_create_augroup("FiletypeSettings", { clear = true })
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  group = "FiletypeSettings",
  pattern = {"*.py", "*.c", "*.zig", "*.sh", "*.conf"},
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.expandtab = true
    vim.bo.smartindent = true
  end,
})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  group = "FiletypeSettings",
  pattern = {"*.md", "*.tex"},
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
    vim.bo.textwidth = 80
  end,
})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  group = "FiletypeSettings",
  pattern = {"*.html", "*.json", "*.yml", "*.yaml", "*.sql", "*.css", "*.jsx", "*.scss", "*.tf"},
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
    vim.bo.smartindent = true
  end,
})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  group = "FiletypeSettings",
  pattern = {"*.rs", "*.java"},
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.expandtab = true
    vim.bo.smartindent = true
  end,
})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  group = "FiletypeSettings",
  pattern = {"*.js", "*.ts", "*.tsx"},
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.expandtab = true
    vim.bo.smartindent = true
  end,
})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  group = "FiletypeSettings",
  pattern = {"*.go"},
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.expandtab = false
  end,
})
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  group = "FiletypeSettings",
  pattern = {"Makefile"},
  callback = function()
    vim.bo.expandtab = false
    vim.bo.tabstop = 8
    vim.bo.softtabstop = 0
    vim.bo.shiftwidth = 8
  end,
})

-- Colorscheme
if not vim.fn.has("gui_running") then
  vim.opt.t_co = 256
end
vim.opt.background = "dark"
vim.cmd.colorscheme("torte")
vim.api.nvim_set_hl(0, "Normal", { ctermbg = "NONE", bg = "NONE" })
vim.api.nvim_set_hl(0, "NonText", { ctermbg = "NONE", bg = "NONE" })
vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = "DarkGreen", bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLine", { ctermbg = "NONE", bg = "NONE", underline = true })
vim.api.nvim_set_hl(0, "StatusLine", { ctermbg = "DarkGreen", bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLineNC", { ctermbg = "NONE", bg = "NONE" })

-- Key mappings
local function set_keymap(mode, lhs, rhs, opts)
  local success, err = pcall(vim.keymap.set, mode, lhs, rhs, opts)
  if not success then
    vim.api.nvim_echo({{ "Failed to set keymap: " .. lhs .. " - " .. tostring(err), "ErrorMsg" }}, true, {})
  end
end

set_keymap("n", "<CR>", ":noh<CR><CR>:<bs>", { noremap = true })
set_keymap("", "S", ":%s//g<Left><Left>", { noremap = true })
set_keymap("n", "<leader>,", ":w<CR>:so %<CR>", { noremap = true })
set_keymap("n", "<leader>d", ":Ex<CR>", { noremap = true })
set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })
set_keymap("n", "J", "mzJ`z", { noremap = true })
set_keymap("n", "N", "Nzzzv", { noremap = true })
set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true })
set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.opt.laststatus = 2

-- WSL yank support
if vim.fn.executable("/mnt/c/Windows/System32/clip.exe") == 1 then
  vim.api.nvim_create_augroup("WSLYank", { clear = true })
  vim.api.nvim_create_autocmd("TextYankPost", {
    group = "WSLYank",
    callback = function()
      if vim.v.event.operator == "y" then
        vim.fn.system("/mnt/c/Windows/System32/clip.exe", vim.fn.getreg("0"))
      end
    end,
  })
end

-- Initialize vim-plug
vim.cmd [[
  call plug#begin('~/.local/share/nvim/plugged')
  Plug 'nvim-lua/plenary.nvim'
  Plug 'ThePrimeagen/harpoon', { 'branch': 'harpoon2' }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': './install --bin' }
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  call plug#end()
]]

-- Harpoon configuration
local function setup_harpoon()
  local ok, harpoon = pcall(require, "harpoon")
  if not ok then
    vim.api.nvim_echo({{ "Failed to load harpoon: " .. tostring(harpoon), "ErrorMsg" }}, true, {})
    return
  end
  harpoon:setup()
  set_keymap("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon: Add file" })
  set_keymap("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: Toggle menu" })
  set_keymap("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Harpoon: Go to file 1" })
  set_keymap("n", "<C-t>", function() harpoon:list():select(2) end, { desc = "Harpoon: Go to file 2" })
  set_keymap("n", "<C-n>", function() harpoon:list():select(3) end, { desc = "Harpoon: Go to file 3" })
  set_keymap("n", "<C-s>", function() harpoon:list():select(4) end, { desc = "Harpoon: Go to file 4" })
end

-- FZF configuration

local function setup_fzf()
  if vim.fn.executable("fzf") == 0 then
    vim.api.nvim_echo({{ "fzf.vim: fzf binary not found in $PATH", "ErrorMsg" }}, true, {})
    return
  end
  -- No need to `require('fzf')` ΓÇö fzf.vim is a Vimscript plugin
  vim.g.fzf_command_prefix = "Fzf"
  vim.g.fzf_layout = { down = "~80%" }
  vim.g.fzf_vim = { preview_window = { "hidden,right,50%,<70(up,75%)" } }
  set_keymap("n", "<leader>fv", ":FzfFiles<CR>", { desc = "FZF: Files" })
  set_keymap("n", "<leader>fb", ":FzfBuffers<CR>", { desc = "FZF: Buffers" })
  set_keymap("n", "<leader>h", ":FzfHistory<CR>", { desc = "FZF: History" })
  set_keymap("n", "<leader>fs", ":FzfRg<CR>", { desc = "FZF: Rg" })
  set_keymap("n", "<leader>fg", ":FzfGFiles?<CR>", { desc = "FZF: Git files" })
  set_keymap("n", "<leader>fG", ":FzfGFiles<CR>", { desc = "FZF: All files" })
end


-- Coc.nvim configuration
local function setup_coc()
  if vim.fn.executable("node") == 0 then
    vim.api.nvim_echo({{ "coc.nvim: node binary not found in $PATH", "ErrorMsg" }}, true, {})
    return
  end
  local ok, _ = pcall(vim.fn["coc#util#version"])
  if not ok then
    vim.api.nvim_echo({{ "Failed to load coc.nvim: " .. tostring(_), "ErrorMsg" }}, true, {})
    return
  end
  set_keymap("i", "<C-@>", function() return vim.fn["coc#refresh"]() end, { silent = true, expr = true })
  set_keymap("n", "gd", "<Plug>(coc-definition)", { silent = true })
  set_keymap("n", "gr", "<Plug>(coc-references)", { silent = true })
  set_keymap("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })
  set_keymap("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true })
  set_keymap("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true })
  set_keymap({"x", "n"}, "<leader>f", "<Plug>(coc-format-selected)", { silent = true })
  set_keymap("n", "K", function()
    if vim.fn["CocAction"]("hasProvider", "hover") then
      vim.fn["CocActionAsync"]("doHover")
    else
      vim.fn.feedkeys("K", "in")
    end
  end, { silent = true })
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
      vim.api.nvim_set_hl(0, "CocUnusedHighlight", { undercurl = true, fg = "#808080" })
    end,
  })
end

-- Setup plugins
setup_harpoon()
setup_fzf()
setup_coc()

-- Debug leader key
vim.api.nvim_create_user_command("CheckLeader", function()
  vim.api.nvim_echo({{ "Leader key is: " .. vim.g.mapleader, "Normal" }}, true, {})
end, {})

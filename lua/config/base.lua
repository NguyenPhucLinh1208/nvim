-- sync clipboard
vim.opt.clipboard = "unnamedplus"

-- leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Thay đổi encoding mặc định của file thành utf-8
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Hiển thị số dòng trong file
vim.opt.nu = true
vim.opt.rnu = true

-- Cài đặt thụt dòng mặc định là 4
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Thụt dòng tự động khi ấn enter
vim.opt.ai = false
vim.opt.si = true

-- Không tự động xuống dòng nếu kí tự trên dòng đó quá dài
vim.opt.hlsearch = true
vim.opt.wrap = false

vim.cmd("filetype plugin indent on")

-- Set indentation
vim.opt.smartindent = true

-- highlight cursor line
vim.opt.cursorline = true

-- color term
vim.opt.termguicolors = true

-- Khi tìm kiếm, không phân biệt chữ hoa, chữ thường
-- Ex: name NaME namE
vim.o.ignorecase = true
vim.o.smartcase = true

-- Tự động bỏ chế độ chỉ đọc khi mở file
vim.api.nvim_create_autocmd({"BufReadPost", "BufEnter"}, {
  pattern = "*",
  callback = function()
    if vim.bo.readonly then
      vim.cmd("set noreadonly")
    end
  end,
})
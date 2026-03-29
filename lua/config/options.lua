local opt = vim.opt

-- line number
opt.relativenumber = true
opt.number = true

-- indent
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- warp
opt.wrap = false;

-- enable mouse
opt.mouse:append("a")

-- clipboard
opt.clipboard:append("unnamedplus")

-- default new buffer
opt.splitright = true
opt.splitbelow = true

-- search
opt.ignorecase = true
opt.smartcase = true

-- encoding
vim.o.encoding = "utf-8"
vim.o.fileencodings = "utf-8,gbk,big5,cp936,gb18030,euc-jp,euc-kr,latin1,ucs-bom,ucs"


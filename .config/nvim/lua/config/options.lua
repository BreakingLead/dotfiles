-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
--
vim.o.clipboard = "unnamedplus"

if os.execute("wl-copy") then
  vim.g.clipboard = "wl-copy"
end

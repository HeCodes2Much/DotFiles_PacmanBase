vim.cmd([[
try
  colorscheme minimalmistakes
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]])

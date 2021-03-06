" MIT license. Copyright (c) 2013 
if &cp || v:version < 702 || (exists('g:loaded_verilog_testbench') && g:loaded_verilog_testbench)
  finish
endif
let g:loaded_verilog_testbench = 1

function! s:check_defined(variable, default)
  if !exists(a:variable)
    let {a:variable} = a:default
  endif
endfunction

call s:check_defined('g:vimrc_email', 'email@email.com')
call s:check_defined('g:vimrc_author', 'author')
call s:check_defined('g:testbench_load_header', 1)
call s:check_defined('g:testbench_clk_name', 'clk')
call s:check_defined('g:testbench_suffix', 'Tb')
call s:check_defined('g:testbench_bracket_width', '12')

if maparg(',tb', 'n') == ''
    nmap    ,tb     <esc>:TestBench<cr>
endif

if maparg(',in', 'n') == ''
    nmap    ,in     <esc>:Instance<cr>
endif

if maparg('<M-i>', 'i') == ''
    imap    <M-i>   <esc>:InsertPort<cr>
endif

command! -nargs=0 TestBench call testbench#generate()
command! -nargs=0 Instance  call instance#generate()
command! -nargs=0 InsertPort call testbench#insert()


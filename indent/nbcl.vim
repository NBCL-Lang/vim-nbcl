if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=NbclIndent()
setlocal indentkeys+=0},0{

function! NbclIndent()
  let prev_lnum = prevnonblank(v:lnum - 1)
  let prev_line = getline(prev_lnum)
  let cur_line  = getline(v:lnum)

  let indent = indent(prev_lnum)

  " Increase indent after opening {
  if prev_line =~ '{\s*$'
    let indent += shiftwidth()
  endif

  " Decrease indent for closing }
  if cur_line =~ '^\s*}'
    let indent -= shiftwidth()
  endif

  return indent
endfunction

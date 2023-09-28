" Configuration of global vimtex settings

" Turn off VimTeX indentation
let g:vimtex_indent_enabled = 0

" Disable default mappings; I'll define my own
let g:vimtex_mappings_enabled = 0

" Disable insert mode mappings (in favor of a dedicated snippet engine)
let g:vimtex_imaps_enabled = 0

" Disable completion
" let g:vimtex_complete_enabled = 0

" Disable syntax conceal
let g:vimtex_syntax_conceal_disable = 1  

" Default is 500 lines and gave me lags on missed key presses
let g:vimtex_delim_stopline = 50

" VimTeX toggle delimeter configuration
let g:vimtex_delim_toggle_mod_list = [
  \ ['\left', '\right'],
  \ ['\big', '\big'],
  \]

" Don't open quickfix for warning messages if no errors are present
let g:vimtex_quickfix_open_on_warning = 0  

" Disable some compilation warning messages
let g:vimtex_quickfix_ignore_filters = [
      \ 'LaTeX hooks Warning',
      \ 'Underfull \\hbox',
      \ 'Overfull \\hbox',
      \ 'LaTeX Warning: .\+ float specifier changed to',
      \ 'Package siunitx Warning: Detected the "physics" package:',
      \ 'Package hyperref Warning: Token not allowed in a PDF string',
      \ 'Fatal error occurred, no output PDF file produced!',
      \]

let g:vimtex_view_method = 'skim' " only for macos

" Don't automatically open PDF viewer after first compilation
let g:vimtex_view_automatic = 0

" Disable continuous compilation
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 0,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}


" Show syntax highlighting groups for word under cursor

" check for synstack function capability
if !exists('*synstack')
    finish
endif

" expose <plug>(SynStack)
" eg: nmap <leader>p <plug>(SynStack)
nnoremap <expr> <plug>(SynStack) ':call synstack#'..(get(g:,'synstack_popup')?'popup':'echo')..'()<cr>'

command! -nargs=0 -bar SynAuto     call synstack#toggleAuto()
command! -nargs=0 -bar SynAutoOff  call synstack#enableAuto()
command! -nargs=0 -bar SynAutoOn   call synstack#disableAuto()

command! -nargs=0 -bar SynPopup    let g:synstack_popup = !get(g:, 'synstack_popup')
command! -nargs=0 -bar SynPopupOff let g:synstack_popup = 0
command! -nargs=0 -bar SynPopupOn  let g:synstack_popup = 1

" map to <c-p> if <c-p> not already mapped
" don't map if g:no_plugin_maps or g:no_synstack_maps is 0
if !get(g:, 'no_plugin_maps') && !get(g:, 'no_synstack_maps')
    " don't map if aleady mapped or <c-p> (our default) is mapped
    if !hasmapto('<plug>(SynStack)') && empty(maparg('<c-p>'))
        nmap <c-p> <plug>(SynStack)
    endif
endif


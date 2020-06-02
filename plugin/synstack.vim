
" Show syntax highlighting groups for word under cursor

" check for synstack function capability
if !exists('*synstack')
    finish
endif

" expose <plug>(SynStack)
" eg: nmap <leader>p <plug>(SynStack)
nnoremap <plug>(SynStack) :call synstack#echo()<cr>

" map to <c-p> if <c-p> not already mapped
" don't map if g:no_plugin_maps or g:no_synstack_maps is 0
if get(g:, 'no_plugin_maps', 1) && get(g:, 'no_synstack_maps', 1)
    " don't map if aleady mapped or <c-p> (our default) is mapped
    if !hasmapto('<plug>(SynStack)') && empty(maparg('<c-p>'))
        nmap <c-p> <plug>(SynStack)
    endif
endif


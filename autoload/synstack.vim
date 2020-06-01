
" echo hl chain (and resolutions) synstack with color
" eg: "vimString [String] <- vimFuncBody"
" This above example shows that "vimString" is the top group, and what is shown
" The square brackes after show that "vimString" eventually resolves to "String"
" vimFuncBody is a parent group that contains the vimString
function! synstack#echo()
    let l:first = 1
    for l:id in reverse(synstack(line('.'), col('.')))
        if l:first
            let l:first = 0
        else
            echon ' <- '
        endif
        let l:syn = synIDattr(l:id, 'name')
        let l:transId = synIDtrans(l:id)
        execute 'echohl '.l:syn
        echon l:syn
        if l:id !=# l:transId
            echon ' ['.synIDattr(l:transId, 'name').']'
        endif
        echohl NONE
    endfor
    echohl NONE
    if l:first
        echon 'No syntax groups under cursor'
    endif
endfunction


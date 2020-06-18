
" echo hl chain (and resolutions) synstack with color
" eg: "vimString [String] <- vimFuncBody"
" This above example shows that "vimString" is the top group, and what is shown
" The square brackes after show that "vimString" eventually resolves to "String"
" vimFuncBody is a parent group that contains the vimString
function! synstack#echo()
    let first = 1
    unsilent echon "\r"
    for id in reverse(synstack(line('.'), col('.')))
        if first
            let first = 0
        else
            unsilent echon ' <- '
        endif
        let syn = synIDattr(id, 'name')
        let transId = synIDtrans(id)
        execute 'echohl ' syn
        unsilent echon syn
        if id !=# transId
            unsilent echon ' [' synIDattr(transId, 'name') ']'
        endif
        echohl NONE
    endfor
    echohl NONE
    if first
        unsilent echon 'No syntax groups under cursor'
    endif
endfunction

function! synstack#enableAuto()
    augroup SynstackAuto
        autocmd!
        autocmd CursorMoved * silent execute "normal \<plug>(SynStack)"
    augroup end
    let s:auto = v:true
endfunction

function! synstack#disableAuto()
    autocmd! SynstackAuto
    let s:auto = v:false
endfunction

function! synstack#toggleAuto()
    if get(s:, 'auto')
        call synstack#disableAuto()
    else
        call synstack#enableAuto()
    endif
endfunction

function! synstack#popup()
    let first = 1
    let out = ''
    let s:props = []
    let byt = 1
    for id in reverse(synstack(line('.'), col('.')))
        if first
            let first = 0
        else
            let s = ' <- '
            let len = strlen(s)
            let out ..= s
            let byt += len
        endif
        let syn = synIDattr(id, 'name')
        let transId = synIDtrans(id)
        let s = syn
        if id !=# transId
            let s ..= ' ['..synIDattr(transId, 'name')..']'
        endif
        let len = strlen(s)
        let proptype = 'synstackhl_'..syn
        sil! call prop_type_add(proptype, #{highlight:syn, start_incl:1, end_incl:1})
        call add(s:props, #{col:byt, length:len, type:proptype})
        let out ..= s
        let byt += len
    endfor
    if first
        return
    endif
    call popup_atcursor([#{text:out, props:s:props}], #{moved:'any', pos:'topleft'})
endfunction


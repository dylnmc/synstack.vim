SynStack.vim
============

![SynStack Screenshot with Explanation](https://raw.githubusercontent.com/dylnmc/i/master/synstack.png)

## Usage

`<plug>(SynStack)` is exposed.

Map it with `:nmap <leader>p <plug>(SynStack)`, for example.

If you don't create a map to `<plug>(SynStack)` and you have nothing mapped to `<c-p>`, then `<c-p>` will be mapped by default.

This plugin respects `:let g:no_plugin_maps = 0` as well as the plugin-specific `:let g:no_synstack_maps = 0`.

## Explanation

When run, you will see the highlight groups under the cursor `echo`ed to the command-line area with appropriate coloration.

The left-most group is the "highest" and the one that will overwrite any "lower" groups under it. The arrows point from right to left denoting that the left-most group is the this.

Square brackets denote what the group eventually resolves to if it is linked.

In the example at the top, `vimString` is the "highest" group, and thus is displayed first. Since `String` is in square brackets after `String`, we know that `vimString` is linked directly to the `String` hl-group.

*Note* that if there were more links (eg, `vimString` -> `vimCoolString` -> `magicString` -> `String`), then the output would still just be `vimString [String]`. Also, note that `vimEcho` and `vimFuncBody` are the parent groups and are not linked to anything.


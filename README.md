# SynStack.vim

![SynStack Screenshot with Explanation][synstack_screenshot]

## Usage

Install it, move the cursor, press `<c-p>`, and be amazed.

### Usage Details

If you do not like the default, `<c-p>`, then please `:nmap <leader>p
<plug>(SynStack)`, for example.

If you do not  create a map to `<plug>(SynStack)` or `<c-p>` is already mapped,
then this plugin will not map `<c-p>` by default.

If you `:let g:no_plugin_maps = 0` or `:let g:no_synstack_maps = 0`
(plugin-specific), then no maps will be created. However, this makes makes it
hard to use this plugin, since only `<plug>(SynStack)` is exposed.

## Explanation

When `<plug>(SynStack)` is called, all of the highlight groups under the cursor
are displayed from "highest" to "lowest" with the proper coloration. Since
"higher" highlight groups overwrite "lower" highlight groups, the arrows point
from right to left and the "highest" and most important group is on the left. In
the above picture, `vimString` is the highest highlight group and, therefore,
determines the foreground color for the group under the cursor.

Square brackets denote what the highlight group eventually resolves to **if** it
is linked. In the above picture, `vimString` is linked to `String`.

[synstack_screenshot]:https://raw.githubusercontent.com/dylnmc/i/master/synstack.png


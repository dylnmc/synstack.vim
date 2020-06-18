# SynStack.vim

![SynStack Animated gif][synstack_gif]

## Usage

Install it, move the cursor, press `<c-p>`, and be amazed.

Use `:SynAuto` to toggle *Auto Mode* and `:SynPopup` to toggle *Popup Mode*.

### Usage Details

If you do not like the default, `<c-p>`, then please `:nmap <leader>p
<plug>(SynStack)`, for example.

If you do not  create a map to `<plug>(SynStack)` or `<c-p>` is already mapped,
then this plugin will not map `<c-p>` by default.

If you `:let g:no_plugin_maps = 0` or `:let g:no_synstack_maps = 0`
(plugin-specific), then no maps will be created. However, this makes makes it
hard to use this plugin, since only `<plug>(SynStack)` is exposed.

### Auto Mode

When *Auto Mode* is enabled, every time the cursor is moved, `<plug>(SynStack)`
is called automatically.

The commands `:SynAuto`, `:SynAutoOn`, and `:SynAutoOff` will toggle, enable, or
disable *Auto Mode*, respectively. They're wrapper commands that call the
functions `synstack#toggleAuto()`, `synstack#enableAuto()`, and
`synstack#disableAuto()`, respectively.

### Popup Mode

*Popup Mode* makes use of the new **+popup** feature in vim. Don't enable it if
you don't **+popup** in `:version`. No version checking or checking of any other
kind is performed.

To enable *Popup Mode*, you need to `let g:synstack_popup = 1`.

Convenience commands are provided to to quickly toggle, enable, or disable
*Popup Mode*. Respectively, they are `:SynPopup`, `:SynPopupOn`, and
`:SynPopupOff`.

## Explanation

![SynStack Screenshot with Explanation][synstack_screenshot]

When `<plug>(SynStack)` is called, all of the highlight groups under the cursor
are displayed from "highest" to "lowest" with the proper coloration. Since
"higher" highlight groups overwrite "lower" highlight groups, the arrows point
from right to left and the "highest" and most important group is on the left. In
the above picture, `vimString` is the highest highlight group and, therefore,
determines the foreground color for the group under the cursor.

Square brackets denote what the highlight group eventually resolves to **if** it
is linked. In the above picture, `vimString` is linked to `String`.

[synstack_gif]:https://raw.githubusercontent.com/dylnmc/i/master/synstack.gif
[synstack_screenshot]:https://raw.githubusercontent.com/dylnmc/i/master/synstack.png


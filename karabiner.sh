#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set remap.mouse_keys_mode_holding_m 1
/bin/echo -n .
$cli set repeat.initial_wait 100
/bin/echo -n .
$cli set remap.simultaneouskeypresses_mouse_keys_mode_df 1
/bin/echo -n .
$cli set private.vim_keybind_apps_esc_with_eisuu 1
/bin/echo -n .
$cli set repeat.consumer_initial_wait 200
/bin/echo -n .
$cli set remap.jis_command2eisuukana_prefer_command 1
/bin/echo -n .
$cli set option.vimode_control_hjkl 1
/bin/echo -n .
$cli set repeat.wait 10
/bin/echo -n .
$cli set repeat.consumer_wait 20
/bin/echo -n .
$cli set option.mousekeys_mode_wer2click 1
/bin/echo -n .
/bin/echo

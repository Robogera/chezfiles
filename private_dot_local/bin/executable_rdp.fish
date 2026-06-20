#!/bin/fish

argparse 'c/credentials=' 'u/url=' -- $argv or exit 1

set data "$(pass show $_flag_credentials)"

function get_field
  echo $argv[1] | grep $argv[2] | head -n1 | sed -nre 's/.*=(.*)/\1/p'
end

echo $_flag_url

nohup xfreerdp3 /u:$(get_field $data user) /d:$(get_field $data domain) /p:$(get_field $data password) /tls:seclevel:0 /pwidth:518 /pheight:324 /mouse:relative:on,grab:off -wallpaper +window-drag +auto-reconnect -decorations +dynamic-resolution +home-drive /v:$_flag_url &


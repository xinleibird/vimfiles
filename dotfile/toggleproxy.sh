#!/bin/bash

# Toggle Proxy
export {http,https,ftp}_proxy='http://127.0.0.1:8087'
export shell_proxy_sign='☻ '
function toggleproxy() {
if [ -z "$http_proxy" ]
then
    export {http,https,ftp}_proxy='http://127.0.0.1:8087'
    export shell_proxy_sign='☻ '
    echo -e "shell proxy \033[01;32mON\033[0m!"
else
    unset {http,https,ftp}_proxy
    export shell_proxy_sign='☹ '
    echo -e "shell proxy \033[01;31mOFF\033[0m!"
fi
}
function stopgoagent() {
    ps -ef | grep proxy.py | grep -v sudo | grep -v grep | awk '{print $2} {print $3}' | xargs -i echo {}
}

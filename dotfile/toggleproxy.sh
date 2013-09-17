#!/bin/bash

# Toggle Proxy
export {http,https,ftp}_proxy='http://127.0.0.1:8087'
export shell_proxy_sign='☻ '


export goagent_loaded=$(ps -ef | grep proxy.py | grep -v grep)
if [[ -z "$goagent_loaded" ]]; then
    export goagent_sign='↯ '
else
    export goagent_sign='⇵ '
fi

function toggleproxy() {
if [[ -z "$http_proxy" ]]
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
ps -ef | grep proxy.py | grep -v sudo | grep -v grep | awk '{print $2} {print $3}' | xargs -i kill {}
export goagent_sign='↯ '
}
function startgoagent() {
nohup /home/xinlei/.local/bin/goagent.sh >/dev/null 2>&1 &
export goagent_sign='⇵ '
}

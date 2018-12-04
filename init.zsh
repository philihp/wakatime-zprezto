# wakatime for zsh
# from https://github.com/wbingli/zsh-wakatime/
# adapted through comments in https://github.com/wbingli/zsh-wakatime/issues/12

# hook function to send wakatime a tick
send_wakatime_heartbeat() {
    entity=$(waka_filename);
    if [ "$entity" ]; then
        (wakatime --write --plugin "zsh-wakatime/0.0.1" --entity-type app --project Terminal --entity "$entity"> /dev/null 2>&1 &)
    fi
}

# generate text to report as "filename" to the wakatime API
waka_filename() {
    if [ "x$WAKATIME_USE_DIRNAME" = "xtrue" ]; then
        # just use the current working directory
        echo "$PWD"
    else
        # only command without arguments to avoid senstive information
        echo "$history[$((HISTCMD-1))]" | cut -d ' ' -f1
    fi
}

add-zsh-hook precmd send_wakatime_heartbeat

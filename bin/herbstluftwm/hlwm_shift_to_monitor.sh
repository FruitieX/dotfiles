hc() {
	herbstclient "$@"
}

mon_count=$(hc list_monitors | wc -l - | cut -d' ' -f1,1)
cur_mon=$(hc attr monitors.focus.index)

# wrap around monitors
target_mon=$((($cur_mon $1) % $mon_count))
if [[ $target_mon -lt 0 ]]; then
    target_mon=$(($target_mon+$mon_count))
fi

hc shift_to_monitor $target_mon
hc focus_monitor $target_mon


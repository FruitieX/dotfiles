hc() {
	herbstclient "$@"
}

hc shift_to_monitor $1
hc cycle_monitor $1

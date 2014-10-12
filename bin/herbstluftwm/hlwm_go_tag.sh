hc() {
	herbstclient "$@"
}

hc focus_monitor $(hc get_attr monitors.by-name.monitor${1}.index)

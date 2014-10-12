# focus monitor with name ${1}

hc() {
	herbstclient "$@"
}

hc focus_monitor $(hc get_attr monitors.by-name.${1}.index)

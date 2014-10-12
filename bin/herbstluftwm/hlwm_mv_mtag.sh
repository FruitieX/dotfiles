hc() {
	herbstclient "$@"
}

target_tag=$(hc get_attr monitors.by-name.monitor${1}.tag)
if [[ $? != 0 ]]; then
    echo Error: invalid monitor id, quitting
    exit 1
fi

echo $target_tag
hc move $target_tag

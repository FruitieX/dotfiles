hc() {
	herbstclient "$@"
}

read -a tags <<< $(hc tag_status)

for i in ${!tags[@]}; do
    tag=${tags[$i]}
    if [[ ${tag:0:1} == "." ]]; then
        hc use ${tag:1}
        exit 0
    fi
done

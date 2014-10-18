# find next empty (no clients) tag, move active client to tag and switch to it

hc() {
	herbstclient "$@"
}

read -a tags <<< $(hc tag_status)

for i in ${!tags[@]}; do
    tag=${tags[$i]}
    if [[ ${tag:0:1} == "." ]]; then
        hc move ${tag:1}
        hc use ${tag:1}
        exit 0
    fi
done

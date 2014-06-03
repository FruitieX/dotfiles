hc() {
	herbstclient "$@"
}

read -a tags <<< $(hc tag_status)

active_tag=$(hc get_attr tags.focus.index)

if [[ $1 -gt 0 ]]; then
	for (( i = $active_tag + 1 ; i < $active_tag + ${#tags[@]} ; i += $1 )) do
		current_tag=$((i % ${#tags[@]}))
		name=${tags[$current_tag]}
		if [[ $name == !* || $name == :* ]]; then
			hc use ${name:1}
			break;
		fi
	done
else
	for (( i = $active_tag - 1 ; i > $active_tag - ${#tags[@]} ; i += $1 )) do
		echo $i
		current_tag=$((i % ${#tags[@]}))
		name=${tags[$current_tag]}
		if [[ $name == !* || $name == :* ]]; then
			hc use ${name:1}
			break;
		fi
	done
fi

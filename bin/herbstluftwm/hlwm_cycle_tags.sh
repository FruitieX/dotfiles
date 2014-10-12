# cycles to next invisible (not visible on any monitor) tag

hc() {
	herbstclient "$@"
}

read -a tags <<< $(hc tag_status)

active_tag=$(hc get_attr tags.focus.index)

if [[ $1 -gt 0 ]]; then
	for (( i = $active_tag + 1 ; i < $active_tag + ${#tags[@]} ; i += $1 )) do
		current_tag=$((i % ${#tags[@]}))
		name=${tags[$current_tag]}
		hc stack | grep "Monitor .* with tag \"${name:1}\"" > /dev/null
		ret=$?
		if [[ $ret == 0 ]]; then
			continue;
		fi
		if [[ $name == !* || $name == :* ]]; then
			hc use ${name:1}
			break;
		fi
	done
else
	for (( i = $active_tag - 1 ; i > $active_tag - ${#tags[@]} ; i += $1 )) do
		current_tag=$((i % ${#tags[@]}))
		name=${tags[$current_tag]}
		hc stack | grep "Monitor .* with tag \"${name:1}\"" > /dev/null
		ret=$?
		if [[ $ret == 0 ]]; then
			continue;
		fi
		if [[ $name == !* || $name == :* ]]; then
			hc use ${name:1}
			break;
		fi
	done
fi

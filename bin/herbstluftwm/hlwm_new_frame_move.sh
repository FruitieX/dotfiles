hc() {
	herbstclient "$@"
}

# first arg specifies dir, "bottom" or "right"
# second arg is a float specifying ratio
hc split $1 $2

if [[ $1 == "bottom" ]]; then
	dir="down"
else
	dir="right"
fi

hc shift $dir

hc() {
	herbstclient "$@"
}

# first arg specifies dir, "bottom" or "right"
# second arg is a float specifying ratio
hc split $1 $2
hc shift $1

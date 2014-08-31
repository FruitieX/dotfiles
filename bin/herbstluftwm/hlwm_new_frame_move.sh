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

cur_frame=$(hc layout | grep -n '0x.*FOCUS' | cut -d: -f1)
if [ -z $cur_frame ]; then
    #echo "DEBUG: empty frame focused, exiting"
    exit 1
fi

while [[ $(hc layout | grep -n '0x.*FOCUS' | cut -d: -f1) == $cur_frame ]]; do
    hc shift $dir
done

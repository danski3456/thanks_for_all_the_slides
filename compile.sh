#!/bin/sh

[ ! -f "$1" ] && echo "Needs an existing file" && exit 1

name=$(basename $1)
name="${name%%.*}"
path=$(dirname $1)


# output="${path}/out"
# mkdir -p "$output"

# export OUTPUT_FOLDER="$output"
# output="$output/$name.html"
output="$name.html"

pandoc \
	-d params.yaml \
	-s \
	-o "$output" \
	-V revealjs-url=./reveal.js \
	--mathjax \
	"$1" \

## Show all lists one by one
sed -i "" \
    -E "s/(class=\"fragment)/\1 fade-in-then-semi-out/g" \
    "$output"

# rm -rf mermaid-images/

## Full screen

# extra_params="\
#     width: '100%',\
#     height: '100%',"
    

# sed -i "" -E "/Reveal.initialize\(\{/a ${extra_params}" "$basename".html

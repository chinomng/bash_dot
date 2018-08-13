#!/bin/sh
case "$1" in
    "class" )
        count=`xdotool search --limit 1 --class "$2" | wc -l`
        i3wm_criteria="class";;
    "instance" )
        count=`xdotool search --limit 1 --classname "$2" | wc -l`
        i3wm_criteria="instance";;
    "name" )
        count=`xdotool search --limit 1 --name "$2" | wc -l`
        i3wm_criteria="title";;
esac
if [ "$count" -eq 0 ]; then
    $3
fi

i3-msg "[$i3wm_criteria=(?i)$2] focus"

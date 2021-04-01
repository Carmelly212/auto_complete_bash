#!/bin/bash

function exclude (){
    local nums=("$1")
    local user=("$2")
    local add_num=
    local remaining=
    for x in $nums; do
        add_num="$x "
        for u in $user; do
            if [ $x = $u ]; then
            add_num=
            break
            fi
        done
        echo $add_num
        # if [ -n $add_num ];then
        # remaining+="$add_num " 
        # fi
        # echo $remaining
    done

}
numbers="one two three four"
result=$(exclude "${numbers}" "$*")
echo $result

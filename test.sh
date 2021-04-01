#TEST TSET TEST

#!/bin/bash
function arr_exclude() {
    local all_words=( "$1" )
    local exclude_words=( "$2" )
    local remaining
    local add_word
    # echo "what is $* "
    for word in ${all_words[@]}; do
        add_word="${word}"
        for exclude in ${exclude_words[@]}; do
            if [ "${word}" == "${exclude}" ]; then
                add_word=
                break
            fi
        done
        if [ -n "${add_word}" ]; then
            remaining+="${add_word} "
        fi
    done
    echo "${remaining}"
}
opts="--serial --makefile --gen --target"
out_list=$( arr_exclude "${opts}" "$*" )
echo ${out_list}


 #!/bin/bash

# def_opts=("--serial" "--makefile" "--gen" "--target")
# remaining=()
# function _disclude() {
#     arr=( "$@" )

#     for opt in ${def_opts[@]};
#     do
#         if [[ ${arr[@]} == *"${opt}"* ]]; then
#             :
#         else
#             remaining+="${opt} "
#         fi
#     done



# }
# _disclude "$@"
# echo ${remaining[@]}

# echo ${remaining[@]}


# def_opts=("--serial" "--makefile" "--gen" "--target")
# function _disclude(){
#     result=()
#     enterd=()
#     arr=( "$@" )
#     for mod in ${def_opts[@]};
#     do
#         for x in ${arr[@]};
#         do
#             if [[ ${mod} = ${x} ]]; then
#                 enterd+=($mod)
#             fi
#         done
#     done
#     for op in ${def_opts[@]};
#     do
#         if [[ ${enterd[@]} == *"${op}"* ]]; then
#             :
#         else
#             result+=(${op})
#         fi
#     done
#     echo ${result[@]}
# }


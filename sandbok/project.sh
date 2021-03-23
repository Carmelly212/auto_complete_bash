#!/usr/bin/env bash

modules="mfc llvm cafe"
def_opts="--manifest --makefile"

if [ "$1" == "complete" ]; then
    shift 3 # complete ./project.sh
    if [ $# == 0 ]; then
        echo "git module tree list utest"
    elif [ $# == 1 ]; then
        case $1 in
            git) echo "sync push reset status diff" ;;
            module) echo "build cmake" ;;
            tree) echo "gen cmake build install" ;;
            list) echo "all cmake dev" ;;
            utest) echo "all dev" ;;
            *) echo "git module tree list utest" ;;
        esac
        exit 0
    else
        case $1 in
            git)
                case $2 in
                    sync) op="git_sync" ;;
                    push) op="git_push" ;;
                    reset) op="git_reset" ;;
                    status) op="git_status" ;;
                    diff) op="git_diff" ;;
                    *) echo "sync push reset status diff" ;;
                esac
                ;;
            module)
                case $2 in
                    build) op="module_build" ;;
                    cmake) op="module_cmake" ;;
                    *) echo "build cmake" ;;
                esac
                ;;
            tree)
                case $2 in
                    gen) op="tree_gen" ;;
                    cmake) op="tree_cmake" ;;
                    build) op="tree_build" ;;
                    install) op="tree_install" ;;
                    *) echo "gen cmake build install" ;;
                esac
                ;;
            list)
                case $2 in
                    all) op="list_all" ;;
                    cmake) op="list_cmake" ;;
                    dev) op="list_dev" ;;
                    *) echo "all cmake dev" ;;
                esac
                ;;
            *) exit 0 ;;
            utest)
                case $2 in
                    all) op="utest_all" ;;
                    dev) op="utest_dev" ;;
                    *) echo "all dev" ;;
                esac
                ;;
            *) exit 0 ;;
        esac

        case "$op" in
            git_sync) echo ${modules} ${def_opts} "--serial --schema" ;;
            git_push) echo ${modules} ${def_opts} "--serial --schema" ;;
            git_reset ) echo ${modules} ${def_opts} "--schema" ;;
            git_status ) echo ${modules} ${def_opts} "--schema" ;;
            git_diff ) echo ${modules} ${def_opts} "--schema" ;;
             
            module_build ) echo ${modules} ${def_opts} "--serial --schema --gen --target" ;;
            
            # case $op in
            #     cafe) echo "make ninja";;
            #     # *) ${def_opts} "--serial --schema --gen --target";;
            # esac ;;
        
            module_cmake ) echo "not implemented yet";;

            tree_gen ) echo ${modules} ;;
            tree_cmake ) gen="tree_cmake_gen" ; echo "--gen -g";;
                
             


                
            # tree_cmake ) tree_cmake_handler  "$@" ;;
            # tree_build ) tree_build_handler "$@" ;;
            # tree_install ) tree_install_handler "$@" ;;
            # list_all ) list_all_handler "$@" ;;
            # list_cmake ) list_cmake_handler  "$@" ;;
            # list_dev ) list_dev_handler "$@" ;;
            # utest_all ) utest_all_handler "$@" ;;
            # utest_dev ) utest_dev_handler "$@" ;;
            
        esac
        case $gen in
        tree_cmake_gen ) gen_type="ninja"; echo "make ninja";
        esac
        case $gen_type in
        ninja ) echo ${modules};;
        esac
        
        
    fi
fi


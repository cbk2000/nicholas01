#!/bin/bash

function main(){
    # Variables
    input_dir="$1"
    current_week="$2"

    check_week
}

function check_week(){
    cd "$input_dir"
    ls
}

main "$1" "$2"
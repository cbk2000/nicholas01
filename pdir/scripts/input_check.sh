#!/bin/bash

# Main function
function main(){
    # Variables
    input_dir=$1
    current_week=$2

    echo "input_check.sh: Checking the week directory..."
    check_week

    echo "input_check.sh: Input Validation Completed"
}

# Handle checking for week directory
function check_week(){
    if ls "$input_dir" | grep "$current_week" >/dev/null; then
        echo "input_check.sh: Directory $current_week Found..."
        echo "input_check.sh: Checking $current_week Directory Content..."
        check_content
    else
        echo "input_check.sh: $current_week Directory was not found, Creating default template..."
        create_missing
    fi
}

function check_content(){
    echo "input_check.sh: Check for absen Directory..."
    if ls "$input_dir/$current_week" | grep "absen" >/dev/null; then
        echo "input_check.sh: absen Directory Found"
    else
        echo "input_check.sh: absen Directory Missing, Creating..."
        mkdir -p "$input_dir/$current_week/absen"
    fi

    echo "input_check.sh: Check for quiz Directory..."
    if ls "$input_dir/$current_week" | grep "quiz" >/dev/null; then
        echo "input_check.sh: quiz Directory Found"
    else
        echo "input_check.sh: quiz Directory Missing, Creating..."
        mkdir -p "$input_dir/$current_week/quiz"
    fi
}

function create_missing(){
    echo "input_check.sh: Creating Week Directory..."
    mkdir -p "$input_dir/$current_week"
    echo "input_check.sh: Creating Absen Directory..."
    mkdir -p "$input_dir/$current_week/absen"
    echo "input_check.sh: Creating Quiz Directory..."
    mkdir -p "$input_dir/$current_week/quiz"
    echo "input_check.sh: Creation Process Completed..."
}

main "$1" "$2"
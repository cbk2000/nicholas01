#!/bin/bash

# The main functionality
function main(){
    # Variables
    output_dir=$1
    current_week=$2

    echo "output_check.sh: Checking the week directory..."
    check_week

    echo "output_check.sh: Output Validation Completed"
}

# Handle checking for week directory
function check_week(){
    if ls "$output_dir" | grep "$current_week" >/dev/null; then
        echo "output_check.sh: Directory $current_week Found..."
        echo "output_check.sh: Checking $current_week Directory Content..."
        check_content
    else
        echo "output_check.sh: $current_week Directory was not found, Creating default template..."
        create_missing
    fi
}

function check_content(){
    echo "output_check.sh: Check for absen Directory..."
    if ls "$output_dir/$current_week" | grep "absen" >/dev/null; then
        echo "output_check.sh: absen Directory Found"
    else
        echo "output_check.sh: absen Directory Missing, Creating..."
        mkdir -p "$output_dir/$current_week/absen"
    fi

    echo "output_check.sh: Check for quiz Directory..."
    if ls "$output_dir/$current_week" | grep "quiz" >/dev/null; then
        echo "output_check.sh: quiz Directory Found"
    else
        echo "output_check.sh: quiz Directory Missing, Creating..."
        mkdir -p "$output_dir/$current_week/quiz"
    fi
}

function create_missing(){
    echo "output_check.sh: Creating Week Directory..."
    mkdir -p "$output_dir/$current_week"
    echo "output_check.sh: Creating Absen Directory..."
    mkdir -p "$output_dir/$current_week/absen"
    echo "output_check.sh: Creating Quiz Directory..."
    mkdir -p "$output_dir/$current_week/quiz"
    echo "output_check.sh: Creation Process Completed..."
}

main "$1" "$2"
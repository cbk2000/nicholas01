#!/bin/bash

function main(){
    # Variables
    input_dir=$1
    current_week=$2
    output_dir=$3

    echo "absen_process.sh: Entering $current_week/absen directory..."
    check_file

    echo "absen_process.sh: absen Process Completed"
}

function check_file(){
    echo "absen_process.sh: Checking if absen file exist..."
    if ls "$input_dir/$current_week/absen" | grep "absen.txt" >/dev/null; then
        echo "absen_process.sh: absen file found, proceeding..."

        echo "absen_process.sh: Creating absen_output.txt file..."
        touch "$output_dir/$current_week/absen/absen_output.txt"

        echo "absen_process.sh: Reading input file and writting to output file..."
        # Note: This is a template, just output the content of the txt file on input directory
        while IFS= read -r line || [[ -n "$line" ]]
        do
            echo "$line" >> "$output_dir/$current_week/absen/absen_output.txt"
        done < "$input_dir/$current_week/absen/absen.txt"

	else
        echo "absen_process.sh: absen directory is empty, passing..."
	fi
}

main "$1" "$2" "$3"
#!/bin/bash

function main(){
    # Variables
    input_dir=$1
    current_week=$2
    output_dir=$3

    echo "quiz_process.sh: Entering $current_week/quiz directory..."
    check_file

    echo "quiz_process.sh: quiz Process Completed"
}

function check_file(){
    echo "quiz_process.sh: Checking if quiz file exist..."
    if ls "$input_dir/$current_week/quiz" | grep "quiz.txt" >/dev/null; then
        echo "quiz_process.sh: quiz file found, proceeding..."

        echo "quiz_process.sh: Check if there is already an quiz_output.txt file..."
        if ls "$output_dir/$current_week/quiz" | grep "quiz_output.txt" >/dev/null; then
           echo "quiz_process.sh: quiz_output.txt file found, deleting and generating a new one..." 
           rm "$output_dir/$current_week/quiz/quiz_output.txt"
        fi

        echo "quiz_process.sh: Creating quiz_output.txt file..."
        touch "$output_dir/$current_week/quiz/quiz_output.txt"

        echo "quiz_process.sh: Reading input file and writting to output file..."
        # Note: This is a template, just output the content of the txt file on input directory
        while IFS= read -r line || [[ -n "$line" ]]
        do
            echo "$line" >> "$output_dir/$current_week/quiz/quiz_output.txt"
        done < "$input_dir/$current_week/quiz/quiz.txt"

	else
        echo "quiz_process.sh: quiz directory is empty, passing..."
	fi
}

main "$1" "$2" "$3"
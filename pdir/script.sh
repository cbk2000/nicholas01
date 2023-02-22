#!/bin/bash

# The main functionality
function main(){
    # Variables
    working_dir=$(cd "$(dirname "$0")"; pwd)
    config="$working_dir/config.txt"
    input=""
    output=""
    week=""

    # Call the get_values function
    get_values

    echo "script.sh: Running Input Check"
    bash "$working_dir/scripts/input_check.sh" "$working_dir/$input" "$week"

}

# Read configuration and check for unset configs
function get_values(){

    echo "script.sh: Reading configuration file..."

    while IFS= read -r line || [[ -n "$line" ]]
    do
        if [[ $line == *"INPUT="* ]]; then
            echo "script.sh: Getting Input Path..."
            # Take the value
            input=${line#*=}
            # Clean the value from \r, \n, and extra space
            input=$(echo $input | sed 's/[[:space:]\r\n]//g')
            echo "script.sh: Input Path: $working_dir/$input"
        fi

        if [[ $line == *"OUTPUT="* ]]; then
            echo "script.sh: Getting Output Path..."
            # Take the value
            output=${line#*=}
            # Clean the value from \r, \n, and extra space
            output=$(echo $output | sed 's/[[:space:]\r\n]//g')
            echo "script.sh: Output Path: $working_dir/$output"
        fi

        if [[ $line == *"CURRENT_WEEK="* ]]; then
            echo "script.sh: Getting Current Week..."
            # Take the value
            week=${line#*=}
            # Clean the value from \r, \n, and extra space
            week=$(echo $week | sed 's/[[:space:]\r\n]//g')
            echo "script.sh: Week: $week"
        fi

    done < "$config"

    # Checking if any configuration was not set
    if [[ -z $input ]]; then
        echo "script.sh: Input directory is not set"
        exit 1
    fi

    if [[ -z $output ]]; then
        echo "script.sh: Output directory is not set"
        exit 1
    fi

    if [[ -z $week ]]; then
        echo "script.sh: The current week is not set"
        exit 1
    fi

    echo "script.sh: Variables are set successfully"
}

# Call the main function
main
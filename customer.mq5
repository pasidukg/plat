/////////////////////////* Customer *////////////////////////////

#!/bin/bash

while true; do
    read -p "Enter Phone Number (ex: 0123456789): " phoneNumber

    echo "1. Customer Details"
    echo "2. Continue"
    echo "3. Exit"

    read -p "Enter your option: " option

    case $option in
        1)
            echo "Enter Customer Details:"
            read -p "Customer Name: " customerName
            read -p "Age: " age
            read -p "User Name: " userName
            read -s -p "Password: " password
            echo
            read -s -p "Confirm Password: " confirmPassword
            echo

            if [ "$password" != "$confirmPassword" ]; then
                echo "Customer Passwords not Matched. Please try again."
                continue
            else
                echo "Customer Passwords Matched."
            fi

            echo "Phone Number: $phoneNumber" >> info_customer.log
            echo "Customer Name: $customerName" >> info_customer.log
            echo "Age: $age" >> info_customer.log
            echo "User Name: $userName" >> info_customer.log
            echo "Password: ***" >> info_customer.log
            echo "Confirm Password: ***" >> info_customer.log
            echo "" >> info_customer.log
            ;;

        2)
            echo "Continuing..."
            ;;

        3)
            echo "Exiting..."
            exit 0
            ;;

        *)
            echo "Invalid option! Try again."
            ;;
    esac
done


///////////////////////*marks*//////////////////////////////////////////////////////////////

#!/bin/bash

# Function to determine grade based on marks
grading() {
    if (( $1 >= 80 && $1 <= 100 )); then
        echo "A"
    elif (( $1 >= 60 && $1 <= 79 )); then
        echo "B"
    elif (( $1 >= 40 && $1 <= 59 )); then
        echo "C"
    elif (( $1 >= 20 && $1 <= 39 )); then
        echo "D"
    elif (( $1 >= 10 && $1 <= 19 )); then
        echo "E"
    else
        echo "Invalid"
    fi
}

# Function to calculate sum of valid marks
calculate_sum() {
    sum=0
    while read mark; do
        sum=$(( sum + mark ))
    done < mark-sheet
    echo "$sum"
}

# Function to calculate average of valid marks
calculate_average() {
    sum=$(calculate_sum)
    count=$(wc -l < mark-sheet)
    average=$(( sum / count ))
    echo "$average"
}

# Function to sort marks and find highest and least marks
sort_marks() {
    sort -n mark-sheet > mark-sheet-sorted
    highest=$(tail -n 1 mark-sheet-sorted)
    least=$(head -n 1 mark-sheet-sorted)
    echo "Highest Mark: $highest"
    echo "Least Mark: $least"
}

# Main program
while true; do
    read -p "Enter student's marks (0-100) or 'q' to quit: " input

    if [[ "$input" == "q" ]]; then
        break
    elif (( input >= 0 && input <= 100 )); then
        echo "$input" >> mark-sheet
        grade=$(grading "$input")
        echo "$grade" >> mark-Grades
    else
        echo "Enter a valid mark"
    fi
done

echo "Grades for each valid mark:"
cat mark-Grades

echo "Sum of all valid marks: $(calculate_sum)"
echo "Average of all valid marks: $(calculate_average)"
sort_marks

# Clean up temporary files
rm mark-sheet mark-Grades mark-sheet-sorted


//////////////////*student*/////////////////////////////////

#!/bin/bash

while true; do
    clear
    echo "===== Student Details Management ====="
    echo "1. Student Details"
    echo "2. Continue"
    echo "3. Exit"
    read -p "Enter your option: " option
    
    case $option in
        1)
            read -p "Enter student Index Number (ex: ICT001): " index
            read -p "Enter Last Name: " lastName
            read -p "Enter Registration Number: " regNumber
            read -p "Enter User Name: " userName
            read -sp "Enter Password: " password
            echo
            read -sp "Confirm Password: " confirmPassword
            echo
            
            if [ "$password" = "$confirmPassword" ]; then
                echo "Passwords Match."
            else
                echo "Passwords do not Match. Please try again."
                continue
            fi
            ;;
        2)
            continue
            ;;
        3)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option! Try again."
            ;;
    esac
done


////////////////////*modify student*//////////////////////////////////

#!/bin/bash

while true; do
    clear
    echo "===== Student Details Management ====="
    echo "1. Student Details"
    echo "2. Continue"
    echo "3. Exit"
    read -p "Enter your option: " option
    
    case $option in
        1)
            read -p "Enter student Index Number (ex: ICT001): " index
            read -p "Enter Last Name: " lastName
            read -p "Enter Registration Number: " regNumber
            read -p "Enter User Name: " userName
            read -sp "Enter Password: " password
            echo
            read -sp "Confirm Password: " confirmPassword
            echo
            
            if [ "$password" = "$confirmPassword" ]; then
                echo "Passwords Match."
                
                # Check if the studentinfo.log file exists
                if [ ! -e "studentinfo.log" ]; then
                    touch studentinfo.log
                    chmod +w studentinfo.log
                elif [ ! -w "studentinfo.log" ]; then
                    chmod +w studentinfo.log
                fi
                
                # Store student details in studentinfo.log
                echo "This is Student's details in file" >> studentinfo.log
                echo "The script was run by $USER on $(date +'%d/%m/%Y') at $(date +'%H:%M:%S')" >> studentinfo.log
                echo "The operating system is $(uname -a)" >> studentinfo.log
                echo "The working directory is $(pwd)" >> studentinfo.log
                echo "Shell Name is $SHELL" >> studentinfo.log
                echo "Details of the student: $index" >> studentinfo.log
                echo "Last Name: $lastName" >> studentinfo.log
                echo "Registration Number: $regNumber" >> studentinfo.log
            else
                echo "Passwords do not Match. Please try again."
                continue
            fi
            ;;
        2)
            continue
            ;;
        3)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option! Try again."
            ;;
    esac
done


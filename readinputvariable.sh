#!/bin/bash

# Prompt the user to enter their PIN silently
read -s -p "Please enter your PIN: " pin
echo  # Print a newline after input

# Get the length of the PIN
pin_length=${#pin}

# If PIN is 3 or fewer characters, don't mask anything
if [ "$pin_length" -le 3 ]; then
    echo "PIN: $pin"
else
    # Extract last 3 digits
    last3="${pin: -3}"

    # Create a mask for the first (length - 3) characters
    mask=$(printf '%*s' $((pin_length - 3)) '' | tr ' ' '*')

    # Show masked PIN
    echo "PIN: ${mask}${last3}"
fi

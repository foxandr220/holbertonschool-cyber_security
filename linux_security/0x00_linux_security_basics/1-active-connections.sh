#!/bin/bash

# Check if running as root or with sudo
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root or with sudo privileges" >&2
    exit 1
fi

# Check if ss command is available (part of iproute2)
if ! command -v ss &> /dev/null; then
    echo "ss command not found. Please install iproute2 package" >&2
    exit 1
fi

# Display TCP socket connections with all required options
ss -tlnp

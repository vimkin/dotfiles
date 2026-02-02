#!/bin/bash
# This utility script inserts the current date at the cursor position.

SUPPORTED_FORMATS="date datetime"
FORMAT="date"

while [[ $# -gt 0 ]]; do
    case $1 in
        -f|--format)
            FORMAT="$2"
            shift 2
            ;;
        -*)
            echo "Unknown option: $1" >&2
            exit 1
            ;;
        *)
            # Positional argument
            break
            ;;
    esac
done

# Format the date based on the specified format
case "$FORMAT" in
    date)
        wtype $(date +%Y%m%d)
        ;;
    datetime)
        wtype $(date +%Y%m%dT%H%M%S)
        ;;
    *)
        echo "Unknown format: $FORMAT" >&2
        echo "Supported formats: $SUPPORTED_FORMATS" >&2
        exit 1
        ;;
esac

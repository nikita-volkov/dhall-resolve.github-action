#!/bin/bash -e

output="/tmp/package.dhall"

dhall resolve --file "$file" > $output

echo "path=$output" >> "$GITHUB_OUTPUT"
echo "Set output path to: $output"

#!/bin/bash -e

output="resolved.dhall"

dhall resolve --file "$file" > "$output"

# Verify the frozen file was created and is not empty
if [ ! -s "$output" ]
then
  echo "Error: Frozen package file is empty or was not created"
  exit 1
fi

echo "✓ Successfully resolved Dhall package"
echo "Frozen file size: $(wc -c < "$output") bytes"

echo "path=$output" >> "$GITHUB_OUTPUT"
echo "Set output path to: $output"

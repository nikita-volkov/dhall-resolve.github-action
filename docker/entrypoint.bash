#!/bin/bash -e

output="resolved.dhall"

resolve_args=(--file "$file")

if [ "$cse" = "true" ]
then
  resolve_args=(--cse "${resolve_args[@]}")
fi

dhall resolve "${resolve_args[@]}" > "$output"

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

#!/usr/bin/env bash
for file in "${1:-.}"/bin/*; do
    ln -sf "$(realpath "$file")" "/usr/local/bin/$(basename "$file")"
done

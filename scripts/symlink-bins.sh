#!/usr/bin/env bash
for file in ./bin/*; do
    bin=$(basename "$file")
    ln -sf "$(pwd)/bin/$bin" "/usr/local/bin/$bin"
done

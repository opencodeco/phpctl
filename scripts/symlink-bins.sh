#!/usr/bin/env bash

local_bin_path="${2:-/usr/local/bin}"
# Add a trailing slash if it's missing
local_bin_path="${local_bin_path%/}/"

for file in "${1:-.}"/bin/*; do
    ln -sf "$(realpath "$file")" "${local_bin_path}$(basename "$file")"
done

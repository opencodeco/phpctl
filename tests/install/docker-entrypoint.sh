#!/usr/bin/env bash
neofetch
/bin/bash -c "$(curl -fsSL https://phpctl.dev/install.sh)"
echo ""
notty phpctl doctor
notty php --version
notty composer --version

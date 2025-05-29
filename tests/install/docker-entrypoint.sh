#!/usr/bin/env bash
neofetch
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/opencodeco/phpctl/refs/heads/main/docs/install.sh)"
echo ""
notty phpctl doctor
notty php --version
notty composer --version

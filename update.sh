#!/bin/bash

mkdir -p ~/.bin

install ./brawlhalla ~/.bin/brawlhalla
sudo cp brawlhalla-completion.bash /etc/bash_completion.d/brawlhalla-completion.bash
echo "Installation complete. Please restart your terminal or run the following command:"
echo ""
echo "> source ~/.bashrc"
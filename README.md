# Brawlhalla Bash Tool for WSL2

Bash automisation tool for Brawlhalla stuff. Currently supports switching skin profiles. You can use autocompletion with this tool. It is made to run on WSL2, with Brawlhalla installed on Windows.

## Installation

Just run `./update.sh`. This should also be run whenever you want to update this script.

### Preliminaries

You might need to install basic wsl stuff:

```text
sudo apt install wslu
```

Also, you need might need to add this to your `~/.profile`:

```text
if [ -d "$HOME/.bin" ] ; then
    PATH="$HOME/.bin:$PATH"
fi
```

## Usage

### Skin Profiles

Skin profiles are static. You can save your current skin profile and load it when back up when you changed any of the skins.

Example:

```text
(playing and saving skins...)
brawlhalla profiles save cool_skins
(playing and saving different skins...)
brawlhalla profiles load cool_skins
```

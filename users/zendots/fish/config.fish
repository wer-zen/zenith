# This block sets interactive and non-interactive status, but it's not needed as a separate block.
# Keeping it here for reference.
if status is-interactive
    # do nothing
end

# Environment variables
export OBSIDIAN_USE_WAYLAND=1
export ZENFLOW_QUICKSHELL="$ZENFLOW_QUICKSHELL:/home/zen/zenflow/quickshell"
export PATH="$PATH:/usr/lib/qt6/bin"

# Fish shell-specific settings
set -e QT_QPA_PLATFORMTHEME
set -x QS_NO_RELOAD_POPUP 1
set -x PATH "$HOME/.local/bin" $PATH
set -gx EDITOR nvim

# Initializing shell plugins and tools
zoxide init fish | source
oh-my-posh init fish --config /home/zen/.config/ompsh/theme.toml | source

# Function definitions
function fish_greeting
end

function gp
    git add .
    git commit -m $argv[1]
    git push
end

# Aliases and abbreviations
abbr --add cnix sudo nvim ~/zenflakes/hosts/default/configuration.nix
abbr --add rb sudo nixos-rebuild switch --flake ~/zenith/#phi
abbr --add c clear
abbr --add clr clear
abbr --add ff fastfetch
abbr --add v NVIM_APPNAME=kick nvim
abbr --add nvim NVIM_APPNAME=kick nvim
abbr --add ls exa --oneline --reverse --sort=type
abbr --add srcy z src
abbr --add astrov NVIM_APPNAME=astronvim_v5 nvim
abbr --add kick NVIM_APPNAME=kick nvim
abbr --add chad NVIM_APPNAME=nvChad nvim

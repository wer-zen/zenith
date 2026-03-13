# This block sets interactive and non-interactive status, but it's not needed as a separate block.
# Keeping it here for reference.
if status is-interactive
end

# Environment variables

fish_add_path /home/zen/.spicetify
export OBSIDIAN_USE_WAYLAND=1
export ZENFLOW_QUICKSHELL="$ZENFLOW_QUICKSHELL:/home/zen/zenflow/quickshell"
export ZENFLOW_QUICKSHELL="$ZENFLOW_QUICKSHELL:/home/zen/zenflow/quickshell"
export PATH="$PATH:/usr/lib/qt6/bin"
export QT_QPA_PLATFORMTHEME=gtk3
set -x QS_NO_RELOAD_POPUP 1
set -x PATH "$HOME/.local/bin" $PATH
set -gx EDITOR NVIM_APPNAME=kick nvim
set -gx PATH ~/.cargo/bin $PATH
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin
set -x GTK_FONT "Departure Mono 14"
set -x GTK_USE_PORTAL 1
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

function cri
    cargo build --release
    cargo install --path .
end

# Aliases and abbreviations
abbr --add cnix sudo nvim ~/zenflakes/hosts/default/configuration.nix
abbr --add rb sudo nixos-rebuild switch --flake ~/zenith/#phi
abbr --add c clear
abbr --add clr clear
abbr --add ff fastfetch
#abbr --add v NVIM_APPNAME=kick nvim
#abbr --add v nvim
abbr --add v hx

#abbr --add nvim NVIM_APPNAME=kick nvim
abbr --add ls exa --oneline --reverse --sort=type
abbr --add srcy z src
abbr --add astrov NVIM_APPNAME=astronvim_v5 nvim
abbr --add kick NVIM_APPNAME=kick nvim
abbr --add chad NVIM_APPNAME=nvChad nvim
abbr --add zf z flux q

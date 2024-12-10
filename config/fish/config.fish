set -l os (uname)


### PATH/EXPORT ###
# Clear Path too avoid fish slowing down
set -e fish_user_paths

# Set theme
set --export THEME gruvbox
# set --export THEME catppuccin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Dotnet Development
set --export ASPNETCORE_ENVIRONMENT Development
set --export ASPNETCORE_URLS "http://*:8080"

# Set path for user
set -U fish_user_paths $HOME/.local/bin $HOME/.nix-profile/bin /nix/var/nix/profiles/default/bin $HOME/.cargo/bin $HOME/.cargo/bin $HOME/go/bin $fish_user_paths
### PATH END ###

### SET OPTIONS ###
# Check if env variable EZA_L_OPTIONS exists
if set -q EZA_L_OPTIONS
    # If it does, set the EZA_LL_OPTIONS variable
else
    # If it doesn't, setup eza
    emit fish-eza_install
end
# Supresses fish's intro message
set fish_greeting

#Set term color
set TERM xterm-256color

#Set default Editor
set EDITOR nvim

# Set manpager
set -x MANPAGER "nvim -c 'set ft=man'"
### SET OPTIONS END



### SET KEYBIND MODE ###
function fish_user_key_bindings
    #fish_default_key_bindings
    fish_vi_key_bindings
end
### SET KEYBIND MODE END ###


pfetch
zoxide init fish | source
starship init fish | source

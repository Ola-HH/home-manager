{ config, pkgs, ... }:
{
  home.username = "ola";
  home.homeDirectory = "/home/ola";

  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    # EDITOR = "emacs";
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # Add common programs for home
  home.packages = [
    # Shell
    pkgs.fish
    pkgs.zsh

    # Editors
    pkgs.neovim
    pkgs.helix

    # Dev tools
    # pkgs.insomnia
    pkgs.lazygit
    pkgs.lazydocker

    # Terminal candy
    pkgs.pfetch
    pkgs.starship

    # Terminal utils
    pkgs.tmux # terminal multiplexer
    pkgs.ripgrep # better grep
    pkgs.eza # better ls
    pkgs.fd
    pkgs.fzf # fuzzy finder
    pkgs.jq # json parser
    pkgs.zoxide # cd replacement
    pkgs.gh # github cli
    pkgs.unzip

    # Resource monitor
    pkgs.btop
    pkgs.bottom

    # Dev
    pkgs.uv # python project manager
    pkgs.go # go binary
    pkgs.rustup # rust toolchain manager
    pkgs.nodejs
    pkgs.dotnet-sdk_8

  ];

  programs = {
    git = {
      enable = true;
      userName = "OHH";
      userEmail = "ola@hagerupsen-hansen.no";
    };
  };

  home.file =
    {
      # Fish config
      ".config/fish/config.fish".source = ./config/fish/config.fish;
      ".config/fish/conf.d/aliases.fish".source = ./config/fish/conf.d/aliases.fish;
      ".config/fish/conf.d/nix.fish".source = ./config/fish/conf.d/nix.fish;
      ".config/fish/conf.d/eza.fish".source = ./config/fish/conf.d/eza.fish;
      ".config/fish/functions/eza_git.fish".source = ./config/fish/functions/eza_git.fish;

      # Neovim config
      ".config/nvim/lua".source = ./config/nvim/lua;
      ".config/nvim/init.lua".source = ./config/nvim/init.lua;
      ".config/nvim/LICENSE".source = ./config/nvim/LICENSE;
      ".config/nvim/stylua.toml".source = ./config/nvim/stylua.toml;
      ".config/nvim/.neoconf.json".source = ./config/nvim/.neoconf.json;
      ".config/helix".source = ./config/helix;

      # Wezterm
      ".config/wezterm/wezterm.lua".source = ./config/wezterm/wezterm.lua;
      ".config/wezterm/safe-keybindings-mac.lua".source = ./config/wezterm/safe-keybindings-mac.lua;

      # Other configs
      ".config/bottom".source = ./config/bottom;
      ".config/btop".source = ./config/btop;

      ".config/starship".source = ./config/starship;
      ".config/tmux".source = ./config/tmux;
      ".tmux.conf".source = ./config/tmux.conf;
      ".config/zellij".source = ./config/zellij;
    };
}

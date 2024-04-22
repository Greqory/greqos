{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "tmux-256color";
    historyLimit = 100000;
    baseIndex = 1;
    clock24 = true;
    mouse = true;
    prefix = "C-space";

    plugins = with pkgs;
      [
        tmuxPlugins.better-mouse-mode
        #tmuxPlugins.tmux-nvim
        tmuxPlugins.yank
        # must be before continuum edits right status bar
        { 
          plugin = tmuxPlugins.catppuccin;
          extraConfig = '' 
          set -g @catppuccin_flavour 'frappe'
          set -g @catppuccin_window_tabs_enabled on
          set -g @catppuccin_date_time "%H:%M"
          '';
        }
        {
          plugin = tmuxPlugins.resurrect;
          extraConfig = ''
          set -g @resurrect-strategy-vim 'session'
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'
          '';
        }
        {
          plugin = tmuxPlugins.continuum;
          extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-boot 'on'
          set -g @continuum-save-interval '2'
          '';
        }        
      ];

    extraConfig = ''
      
    '';
  };
}

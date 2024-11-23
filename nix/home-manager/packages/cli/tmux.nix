{
  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    extraConfig = ''
      # Enable tmux true color support
      set -sa terminal-features ",xterm-256color:RGB"

      # Avoid laggy escape key in nvim
      set -sg escape-time 0

      # Set the prefix to Ctrl+a
      set -g prefix C-a
      
      # Remove the old prefix
      unbind C-b
      
      # Send Ctrl+a to applications by pressing it twice
      bind C-a send-prefix
      
      bind-key k select-pane -U
      bind-key j select-pane -D
      bind-key h select-pane -L
      bind-key l select-pane -R
      
      bind-key C-k select-pane -U
      bind-key C-j select-pane -D
      bind-key C-h select-pane -L
      bind-key C-l select-pane -R
    '';
  };
}

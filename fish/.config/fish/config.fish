if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Configuration for plugin installed by fisher
set pure_separate_prompt_on_error true

# fish variables

# Use vi as EDITOR and unset other popular variables
# to always fallback to $EDITOR
set -e VISUAL
set -e SUDO_EDITOR
set EDITOR '/usr/bin/vim'

# add cargo/bin to path, so we can run rusty awesomeness
set -a PATH "/home/fzuellich/.cargo/bin"
set -a PATH "/usr/share"
set -a PATH "/home/fzuellich/bin"
set -a PATH (go env GOPATH)"/bin"

set TTY1 (tty)
if test -z "$DISPLAY"; and test $TTY1 = "/dev/tty1"
  exec sway -c /home/fzuellich/.config/sway/config
end

source $HOME/.config/fish/workonly.fish

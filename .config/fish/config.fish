if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

# Configuration for plugin installed by fisher
set pure_separate_prompt_on_error true

# fish variables

" Use vi as EDITOR
set EDITOR '/usr/bin/vim'

# add cargo/bin to path, so we can run rusty awesomeness
set -a PATH "/home/fzuellich/.cargo/bin"

## Set values
# Hide welcome message & ensure we are reporting fish as shell
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
set -x SHELL /usr/bin/fish

# Replace ls with eza
alias ls 'eza -al --color=always --group-directories-first --icons always' # preferred listing
alias lsz 'eza -al --color=always --total-size --group-directories-first --icons always' # include file size
alias la 'eza -a --color=always --group-directories-first --icons always'  # all files and dirs
alias ll 'eza -l --color=always --group-directories-first --icons always'  # long format
alias lt 'eza -aT --color=always --group-directories-first --icons always' # tree listing
alias l. 'eza -ald --color=always --group-directories-first --icons always .*' # show only dotfiles

# Common use
alias dir 'dir --color=auto'
alias egrep 'ugrep -E --color=auto'
alias fgrep 'ugrep -F --color=auto'
alias grep 'ugrep --color=auto'
alias ip 'ip -color'
alias jctl 'journalctl -p 3 -xb'

# Replace some more things with better alternatives
alias cat 'bat --style header --style snip --style changes --style header'

## Starship prompt
if status is-interactive
    set -x STARSHIP_CONFIG ~/.config/starship/starship.toml
    starship init fish | source
end

# Run larp on greeting
# if status is-interactive
#     nerdfetch
#     # fastfetch --config ~/.config/fastfetch/presets/ascii-art.jsonc
# end

# Goenv setup
status --is-interactive; and source (goenv init -|psub)

# Source base venv
source $HOME/.base/bin/activate.fish

# Only for Fedora
# Allow ctrl+backspace to only kill word instead the whole line with symbols and hypens
# bind alt-backspace backward-kill-word

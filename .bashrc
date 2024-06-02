# ----------
# ~/.bashrc
# ----------
#  __    __
# |  |  |  |
# |  |__|  |
# |        |
# |   __   |
# |  |  |  |
# |__|  |__|


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
# PS1='[\u@\h \W]\$ '
export PS1="\[\e[31m\]\u\[\e[m\]\[\e[32m\]@\[\e[m\]\[\e[34m\]\h\[\e[m\] \[\e[33m\]\w\[\e[m\]\n\[\e[36m\]\W\[\e[m\] \[\e[35m\]\\$\[\e[m\] "

# Vi keybindings
set -o vi
# Switch between vi insert and command modes
bind '"jk": vi-movement-mode'

# History
# -------
# Infinite history size
HISTSIZE=-1
HISTFILESIZE=-1
# Ignore duplicates and erase them
HISTCONTROL=ignoredups:erasedups
# Timestamp each history entry
HISTTIMEFORMAT='%F %T '
# Append to history, don't overwrite it
shopt -s histappend
# Store multi-line commands as one command
shopt -s cmdhist
# Enable history to be shared across terminals
shopt -s histreedit
# Don't execute immediately upon history expansion
shopt -s histverify
# Bind arrow keys for history search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
# Bind 'j' and 'k' for history search in vi-command mode
bind -m vi-command '"k": history-search-backward'
bind -m vi-command '"j": history-search-forward'

# Completion
# ----------
# Case-insensitive completion
bind 'set completion-ignore-case on'
# Immediately show completions
bind 'set show-all-if-ambiguous on'
# Use menu completion
bind 'TAB:menu-complete'
# Show prefix in menu completion
bind 'set menu-complete-display-prefix on'
# Append slash to directory completions
bind 'set mark-directories on'
# Append slash to symlinked directory completions
bind 'set mark-symlinked-directories on'
# Append character after file completion to indicate file type
bind 'set visible-stats on'
# Case-insensitive map completion
bind 'set completion-map-case on'
# Skip completing words already present on the line
bind 'set skip-completed-text on'

# Aliases
# -------
# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
# Listing
alias ls='ls --color=auto --group-directories-first'
alias la='ls -a'
alias ll='ls -la'
# Grepping
alias grep='grep --color=auto'
# Safety
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# Disable KDE wallet
export KDE_SKIP_WALLET=true

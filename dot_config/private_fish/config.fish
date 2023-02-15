if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias gst="git status"
alias nvf="nvim \$(fzf)"
alias zrc="nvim ~/.config/fish/config.fish"
alias c="clear"
alias sps="sudo pacman -S"
alias spr="sudo pacman -R"
alias spss="sudo pacman -Ss"
alias spqs="sudo pacman -Qs"
alias spsyyu="sudo pacman -Syyu"
alias sprs="sudo pacman -Rs"
alias sprsc="sudo pacman -Rsc"
alias spsyu="sudo pacman -Syu"
alias r="./a.out"
alias sz="source ~/.config/fish/config.fish"
alias vi="nvim"
alias vim="nvim"
alias v="nvim"
alias nvi="nvim"
alias nf="neofetch|lolcat"
alias nfr="neofetch"
alias d2u="find . -type f -print0 | xargs -0 dos2unix --"
alias cat="bat"
alias ud="~/updagent.sh"
alias myip="curl cip.cc"

alias ex=exit
alias q=exit

alias zl="zellij"
alias zls="zellij list-sessions"
alias ls="lsd"
alias la="lsd -la"
alias ra="ranger"
alias ath="alacritty-themes"

starship init fish | source
zoxide init fish | source

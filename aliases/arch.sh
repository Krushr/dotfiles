# Search repos with 'paru' and 'fzf'
alias parus="paru -Slq | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru -S"

# Search locally installed packages with 'paru', 'fzf' and 'bat'
alias parup="paru -Qq | fzf --preview 'paru -Qil {}' --layout=reverse --bind 'enter:execute(paru -Qil {} | bat)'"

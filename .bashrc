user=$(whoami)

alias update='/home/$user/.config/CustomScript/Update.sh'
alias import='/home/$user/.config/CustomScript/GitCloning.sh'
alias localssh='/home/$user/.config/CustomScript/localSSH.sh'

alias sudo='sudo '
alias unmask='/home/$user/.config/CustomScript/allow.sh'
alias ls='ls -la --color --group-directories-first'
alias getpkg='emerge -q --ask --verbose'

eval "$(starship init bash)"
eval "$(direnv hook bash)"

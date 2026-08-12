user=$(whoami)

alias update='/home/$user/.config/CustomScript/Update.sh'
alias import='/home/$user/.config/CustomScript/GitCloning.sh'
alias ls='ls -la'
alias localssh='/home/$user/.config/CustomScript/localSSH.sh'

eval "$(starship init bash)"
eval "$(direnv hook bash)"

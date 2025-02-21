gather_contents() {
    directory=$1
    output_file="collected_files.txt"
    rm -f "$output_file"

    find "$directory" -type f | while read -r file; do
        echo "${file##*/}" >> "$output_file"
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$output_file"
        cat "$file" >> "$output_file"
        echo -e "\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" >> "$output_file"
    done

    echo "All contents collected in $output_file"
}

alias gatherFiles="gather_contents"

eval "$(starship init zsh)"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 


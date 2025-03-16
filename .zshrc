export ZSH="$HOME/.oh-my-zsh"

CASE_SENSITIVE=true


ZSH_THEME="awesomepanda"
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

function fzf_cd() {
    local file
    file=$(fzf --query="$1")
    if [ -n "$file" ]; then
        cd "$(dirname "$file")" || return
    fi
}
alias ff="fzf_cd"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin


export FZF_DEFAULT_COMMAND='fdfind --type f --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

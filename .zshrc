export ZSH="$HOME/.oh-my-zsh"


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

export FZF_DEFAULT_COMMAND='fdfind --type f --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

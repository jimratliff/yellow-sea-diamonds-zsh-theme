# fino-time.zsh-theme

# Use with a dark background and 256-color terminal!
# Meant for people with RVM and git. Tested only on OS X 10.7.

# You can set your computer name in the ~/.box-name file if you want.

# Borrowing shamelessly from these oh-my-zsh themes:
#   bira
#   robbyrussell
#
# Also borrowing from http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

#function prompt_char {
#    git branch >/dev/null 2>/dev/null && echo '\u26a1 🔶' && return
#    echo '○'
#}

function prompt_char {
    echo ' 🔶' && return
}

function box_name {
  local box="${SHORT_HOST:-$HOST}"
  [[ -f ~/.box-name ]] && box="$(< ~/.box-name)"
  echo "${box:gs/%/%%}"
}

# PROMPT="╭─%{$FG[040]%}%n%{$reset_color%} %{$FG[239]%}at%{$reset_color%} %{$FG[033]%}$(box_name)%{$reset_color%} %{$FG[239]%}in%{$reset_color%} %{$terminfo[bold]$FG[226]%}%~%{$reset_color%}\$(git_prompt_info)\$(ruby_prompt_info) %D - %*
# ╰─\$(virtualenv_info)\$(prompt_char) "

#PROMPT="╭─%{$terminfo[bold]$FG[226]%}%~%{$reset_color%}\$(git_prompt_info)\$(ruby_prompt_info)
#╰─\$(virtualenv_info)\$(prompt_char) "

#PROMPT="%F{224}%B${(r:$COLUMNS::~:)}%f%b
#╭─%{$FG[040]%}\$(virtualenv_info)%f %{$FG[226]%}%0~%f%{$FG[033]%} \$(git_prompt_info) %{$FG[033]%}($(git_prompt_short_sha))%f\$(ruby_prompt_info)%{$reset_color%}
#╰─\$(prompt_char) "

#PROMPT="
#╭─%{$FG[040]%}\$(virtualenv_info)%f %{$FG[226]%}%0~%f%{$FG[033]%} \$(git_prompt_info) %{$FG[033]%}$(git_prompt_short_sha)%f\$(ruby_prompt_info)%{$reset_color%}
#╰─\$(prompt_char) "

PROMPT="
╭─%{$FG[040]%}\$(virtualenv_info)%f %{$FG[226]%}%0~%f%{$FG[033]%} \$(git_prompt_info) \$(ruby_prompt_info)%{$reset_color%}
╰─\$(prompt_char) "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[250]%}| git:%f %{$FG[135]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FG[033]%} <$(git_prompt_short_sha)>%f%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%} ✘%f"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%} ✔%f"
ZSH_THEME_RUBY_PROMPT_PREFIX=" %{$FG[239]%}using%{$FG[243]%} ‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"

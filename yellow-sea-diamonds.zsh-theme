# yellow-sea-diamonds.zsh-theme




function prompt_char {
    echo ' 🔶' && return
}

# REPORT RETURN CODE
# The following expression:
#   %(?.$NOERROR.$ERROR_OCCURRED)
# is a ternary conditional, which shows the second argument ($NOERROR) if the condition is true, and show the third
# argument if the condition is false.
# The condition (%?) is the return code. (Zero is true in Zsh.)
# Displays $NOERROR if previous command exited normally
# Displays $ERROR_OCCURRED otherwise
# My personal preference: Display nothing if there was no error. A lack of error isn’t sufficiently informative to
# warrant the additional visual noise.
NOERROR=""
# NOERROR="✅"
# Displays "ERROR n" in White on Red background
ERROR_OCCURRED="$BG[001]$FG[255]ERROR #%?%f%k"

REPORT_RETURN_CODE="%(?.$NOERROR.$ERROR_OCCURRED)"

# REPORT CURRENT WORKING DIRECTORY (CWD)
# Explanation of: %0~
#   If the CWD starts with $HOME, that part is replaced by “~”. Furthermore, if it has a named directory as its prefix,
#   that part is replaced by “~” followed by the name of the directory, but only is the result is shorter than the full
#   path.

CWD_BASE="%0~"
CWD=$FG[226]$CWD_BASE%f

# REPORT VIRTUAL ENVIRONMENT

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`')'
}

VIRTUALENV_REPORT=$FG[040]\$(virtualenv_info)%f

# REPORT GIT BRANCH, STATUS, COMMIT, ETC>
# $(git_prompt_info) is a function built into Oh My Zsh which displays the current branch name.
# It also returns the following, which can be customized.

# Prepended to the beginning of the git info
ZSH_THEME_GIT_PROMPT_PREFIX=" $FG[250]| git:%f $FG[135]"

# Appended to the end of git info
# Appends the hash of the commit
COMMIT_HASH='$FG[033]$(git_prompt_short_sha)%f'
function commit_hash_report {
    [ $COMMIT_HASH ] && echo $COMMIT_HASH
}


# Although ZSH_THEME_GIT_PROMPT_SUFFIX is often used as the vehicle for displaying the commit hash, I ran into 
# a problem I wasn't able to solve when using ZSH_THEME_GIT_PROMPT_SUFFIX for that purpose: the commit hash
# wouldn't update automatically.
# However, by appending it to the prompt myself, I don't have that problem.
# The limitation that creates (as least as of the current state) is that I can't wrap the commit hash in
# delimiters, because those delimiters would display even when there is no commit hash.
ZSH_THEME_GIT_PROMPT_SUFFIX=""

# Conditionally returned if there are any uncommitted changes on your branch
# Returns a ❌ if there are uncommitted changes
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%} ✘%f"

# Conditionally returned if there are no uncommitted changes on your branch
# Returns a ✅ if the are no uncommitted changes on your branch
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%} ✔%f"

GIT_REPORT=$FG[033]\$(git_prompt_info)%f

# NOW CONSTRUCT THE PROMPT
PROMPT="
╭─$VIRTUALENV_REPORT $CWD $GIT_REPORT $COMMIT_HASH %{$reset_color%}
╰─$REPORT_RETURN_CODE\$(prompt_char) "



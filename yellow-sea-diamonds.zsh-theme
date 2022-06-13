# yellow-sea-diamonds.zsh-theme

# I started with the theme fino-time, but I’ve played around with so much that I think there’s probably very little
# still remaining from that theme.

# The best source I’ve stumbled across for the various settings available is:
# Sarah Port, “Writing ZSH Themes: A Quickref,” CarbonFive, March 3, 2020.
#   https://blog.carbonfive.com/writing-zsh-themes-a-quickref/
# In particular, the Quick Reference is amazing:
#   https://jsfiddle.net/seport/shrovLgf/embedded/result/

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
ERROR_OCCURRED="$BG[001]$FG[255]ERROR %?%f%k"

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
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[250]%}| git:%f %{$FG[135]%}"

# Appended to the end of git info
# Appends the hash of the committ, enclosed in “< … >”
COMMIT_HASH='$FG[033]$(git_prompt_short_sha)%f'
function commit_hash_report {
    [ $COMMIT_HASH ] && echo $COMMIT_HASH
}
COMMIT_HASH_REPORT=$FG[033]\$(commit_hash_report)%f

# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FG[033]%} <$(git_prompt_short_sha)>%f%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FG[033]%} <$COMMIT_HASH>%f%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FG[033]%} <$COMMIT_HASH>%f%{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$FG[033]%} <'$(git_prompt_short_sha)'>%f%{$reset_color%}"

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



function git_current_branch_for_prompt() {
    local branch
    branch=`git_current_branch`
    [[ -z $branch ]] && return
    echo "($branch) "
}

export PS1='%(?.%F{green}✓%f.%F{9}X %?%f) %F{5}[%m]%f %B%F{11}%3~ %F{6}$(git_current_branch_for_prompt)%F{11}%#%f%b '

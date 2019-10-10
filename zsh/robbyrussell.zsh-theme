function git_current_branch_for_prompt() {
    local branch
    branch=`git_current_branch`
    [[ -z $branch ]] && return
    echo "$branch "
}

export PS1='%(?.✅.%F{red}🅧 %?%f) %B%F{11}%3~ %F{green}$(git_current_branch_for_prompt)%F{11}%#%f%b '

FG_CONFIG_BRANCH_DELIMITERS[0]="("
FG_CONFIG_BRANCH_DELIMITERS[1]=")"
FG_CONFIG_BRANCH_ICON_CHANGED="✖"   # icons: ✖, x
FG_CONFIG_BRANCH_ICON_UNCHANGED="✔" # icons: ✔

. ~/.fancy-git/aliases
. ~/.fancy-git/fancygit-completion

fg_branch_status() {
    local icon=""
    local branch_status=$(git status -s 2> /dev/null)

    icon=$FG_CONFIG_BRANCH_ICON_UNCHANGED

    if [ "$branch_status" != "" ]; then
        icon=$FG_CONFIG_BRANCH_ICON_CHANGED
    fi

    echo $icon
}

fg_branch_name() {
    local branch_name=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')

    if [ "$branch_name" != "" ]; then
        branch_name="${FG_CONFIG_BRANCH_DELIMITERS[0]}$branch_name${FG_CONFIG_BRANCH_DELIMITERS[1]} $(fg_branch_status)"
    fi

    echo "$branch_name"
}

fancygit_prompt_builder() {
    . ~/.fancy-git/config

    local user
    local at
    local host
    local where

    user="${light_green}\u${none}"
    at="${none}@${none}"
    host="${light_green}\h${none}"
    where="${blue}\w${none}"

    PS1="${bold}$user$at$host:$where\$ $(fg_branch_name)${bold_none} "
}

PROMPT_COMMAND="fancygit_prompt_builder"


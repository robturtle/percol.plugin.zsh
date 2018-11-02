#!/bin/zsh
# Functions

function exists {
    which $1 &> /dev/null
}

if exists percol; then
    ## Searching zsh history
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }
    zle -N percol_select_history
    bindkey '^R' percol_select_history

    function percol_git_checkout() {
        #        recent used                                                     all local branches
        br=`cat <(git reflog| grep checkout: | sed '1d' | awk 'NF>1{print $NF}') <(git branch | sed '/^\*/d' | sed 's/^ *//') | awk '!x[$0]++' | percol`
        test -z $br && return 1
        git checkout $br >/dev/null
        zle -R -c
    }
    bindkey -s '^T' 'percol_git_checkout\n'

    function percol_rake_down() {
        version=`ls db/migrate | tail -r | percol | sed 's/\.rb$//'`
        test -z $version && return 1
        echo "reverting test db..."
        bundle exec rake db:migrate:down VERSION=$version RAILS_ENV=test
        echo "reverting development db..."
        bundle exec rake db:migrate:down VERSION=$version
    }
    bindkey -s '^U' 'percol_rake_down\n'

    function rake_migrate() {
        echo "migrating test db..."
        bundle exec rake db:migrate RAILS_ENV=test
        echo "migrating development db... NOT RUNNING data migration!"
        bundle exec rake db:migrate
    }

    ## use `fg 1` just like under BASH, no need to type `fg %1`
    fg() {
        if [[ $# -eq 1 && $1 = - ]]; then
            builtin fg %-
        else
            builtin fg %"$@"
        fi
    }

    ## Interactively resume background jobs
    function percol_resume_job {
        ID=$(jobs | grep '\[\d\d*\]' | percol | sed -E 's/\[([0-9]+)\].*/\1/')
        if [[ -n ${ID} ]]; then
            fg ${ID}
        fi
        zle -R -c
    }
    zle -N percol_resume_job
    bindkey '^Q' percol_resume_job

    ## browse all aliases
    function browse_aliases() {
        BUFFER=$(alias | percol --query "$LBUFFER" | sed "s/=.*$//")
        CURSOR=$#BUFFER
        zle -R -c
    }
    zle -N browse_aliases
    bindkey '^H' browse_aliases
fi

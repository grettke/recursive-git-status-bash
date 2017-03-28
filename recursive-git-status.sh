#!/usr/bin/env bash
# -*- mode: sh; -*-

declare rgs_owd="$PWD"
declare -a rgs_gitdirs
rgs_gitdirs=($(find $rgs_owd -type d -name '.git' | sort --ignore-case))
for gitdir in "${rgs_gitdirs[@]}"; do
    cd "$gitdir"
    cd ..
    if [[ $(git status --porcelain) || $(git status | grep 'ahead') ]]; then
        echo ">>>>>>>>> $PWD"
    else
        echo "          $PWD"
    fi
done
cd "$rgs_owd"
unset rgs_owd
unset rgs_gitdirs

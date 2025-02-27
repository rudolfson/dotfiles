#
# All Git related stuff
#

# switch to a branch (default "main"), fetch all refs and cleanup deleted branches
gbclean() {
    branch="$1"
    [[ -z $branch ]] && branch="main"
    [[ $branch == "d" ]] && branch="develop"
    git switch "$branch" || return $?
    git fetch --all -p
    git merge || return $?
    git branch -v | grep '\[gone\]' | awk '{print $1}' | xargs -r git branch -D
}


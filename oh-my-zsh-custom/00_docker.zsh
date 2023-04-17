#
# All Docker related stuff
#

docker-clean-all() {
    echo -n 'This will clean up the docker environment except images. Continue? (y/n) '
    read yesno
    [[ $yesno == 'y' ]] || return 1
    echo "running docker system prune…"
    docker system prune -f --volumes=true || return $?
    echo "running docker network prune…"
    docker network prune -f || return $?
    echo "deleting volumes"
    docker volume ls -q | xargs  -r docker volume rm
}

php() {
    run -it php $@
}

composer() {
    run -it composer $@
}

server() {
    port=${1:-80}
    dir=${2:-.}
    run "-p$port:$port" php -S 0.0.0.0:$port -t $dir
}

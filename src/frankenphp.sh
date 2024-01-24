frankenphp() {
    if [ -z "$1" ]; then
        PHPCTL_IMAGE=dunglas/frankenphp run -- frankenphp run --config /etc/caddy/Caddyfile --adapter caddyfile
    else
        PHPCTL_IMAGE=dunglas/frankenphp run -- frankenphp "$@"
    fi
}

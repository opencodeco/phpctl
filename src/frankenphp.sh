frankenphp() {
    if [ -z "$1" ]; then
        PHPCTL_IMAGE=opencodeco/phpctl:frankenphp run -- frankenphp run --config /etc/caddy/Caddyfile --adapter caddyfile
    else
        PHPCTL_IMAGE=opencodeco/phpctl:frankenphp run -- frankenphp "$@"
    fi
}

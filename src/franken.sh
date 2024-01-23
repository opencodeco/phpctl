franken() {
    $PHPCTL_RUNTIME run -v "$PWD:/app" \
        -p 80:80 -p 443:443 -p 443:443/udp \
        dunglas/frankenphp
}

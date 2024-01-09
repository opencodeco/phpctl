bundle() {
    image="$1"
    alias="${image##*/}"
    alias="${2-$alias}"
    command="${3-index.php}"
    entrypoint="${4-php}"
    from="${5-opencodeco/phpctl:php82}"
    cp "$PHPCTL_DIR/bundle/Dockerfile" "$PHPCTL_DIR/bundle/docker-entrypoint.sh" .
    docker build \
        --build-arg FROM="$from" \
        --build-arg ENTRYPOINT="$entrypoint" \
        --build-arg COMMAND="$command" \
        -t "$image" .
    rm Dockerfile docker-entrypoint.sh
    cp "$PHPCTL_DIR/bundle/bin.sh" "$alias"
    sed -i.bak "s#IMAGE#$image#g" "$alias"
    rm "$alias.bak"
    chmod a+x "$alias"
}

<?php

declare(strict_types=1);

require_once __DIR__ . '/vendor/autoload.php';

$srv = new \Swoole\Http\Server(host: '0.0.0.0', port: 9501);

$srv->on(\Swoole\Constant::EVENT_REQUEST, function (\Swoole\Http\Request $req, \Swoole\Http\Response $res) {
    $res->end('Hello, World!');
});

$srv->on(\Swoole\Constant::EVENT_START, function (\Swoole\Http\Server $srv) {
    echo "Server started at http://localhost:{$srv->port}\n";
});

$srv->start();

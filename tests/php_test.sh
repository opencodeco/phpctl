function test_php_version_is_default() {
    assert_contains "Copyright (c) The PHP Group" "$(./bin/phpctl php)"
}

function test_php_accepts_arguments() {
    assert_contains "[PHP Modules]" "$(./bin/phpctl php -m)"
    assert_contains "Configuration File (php.ini) " "$(./bin/phpctl php --ini)"
}

function test_composer() {
    assert_contains "Composer version 2" "$(./bin/phpctl composer)"
}

function test_phpctl_ini() {
    echo "memory_limit=1337M" > phpctl.ini
    assert_contains "memory_limit => 1337M => 1337M" "$(./bin/phpctl php -i | grep memory_limit)"
    rm phpctl.ini
}

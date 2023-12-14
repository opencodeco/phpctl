function test_php_version_is_default() {
    assert_contains "Copyright (c) The PHP Group" "$(./bin/phpctl php)"
}

function test_php_accepts_arguments() {
    assert_contains "[PHP Modules]" "$(./bin/phpctl php -m)"
    assert_contains "Configuration File (php.ini) " "$(./bin/phpctl php --ini)"
}

function test_composer() {
    assert_contains "version" "$(./bin/phpctl composer --version)"
}

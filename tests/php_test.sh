function test_php_version_is_default() {
    assert_contains "Copyright (c) The PHP Group" "$(./phpctl php)"
}

function test_php_accepts_arguments() {
    assert_contains "[PHP Modules]" "$(./phpctl php -m)"
    assert_contains "Configuration File (php.ini) " "$(./phpctl php --ini)"
}

function test_composer() {
    assert_contains "version" "$(./phpctl composer --version)"
}

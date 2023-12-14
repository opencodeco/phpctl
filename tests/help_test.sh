function test_help_is_default() {
    assert_contains "phpctl <command> [arguments]" "$(./bin/phpctl)"
}

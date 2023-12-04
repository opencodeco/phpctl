function test_help_is_default() {
    assert_contains "Usage: phpctl" "$(./phpctl)"
}

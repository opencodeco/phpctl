function test_sh_commands() {
    assert_contains "/usr/local/src" "$(./bin/phpctl sh pwd)"
    assert_contains "test" "$(./bin/phpctl sh echo test)"
}

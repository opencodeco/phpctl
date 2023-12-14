function test_sh_commands() {
    assert_contains "/opt" "$(./bin/phpctl sh pwd)"
    assert_contains "test" "$(./bin/phpctl sh echo test)"
}

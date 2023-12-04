function test_sh_commands() {
    assert_contains "/opt" "$(./phpctl sh pwd)"
    assert_contains "test" "$(./phpctl sh echo test)"
}

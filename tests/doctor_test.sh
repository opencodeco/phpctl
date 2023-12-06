function test_doctor() {
    assert_contains "PHPCTL_IMAGE=" "$(./phpctl doctor)"
}

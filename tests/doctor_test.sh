function test_doctor() {
    assert_contains "PHP_VERSION=" "$(./phpctl doctor)"
    assert_contains "PHPCTL_IMAGE=" "$(./phpctl doctor)"
}

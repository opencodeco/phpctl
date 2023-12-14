function test_doctor() {
    assert_contains "PHPCTL_IMAGE=" "$(./bin/phpctl doctor)"
}

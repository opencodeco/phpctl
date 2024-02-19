function test_box() {
    assert_contains "Box version 4.5" "$(./bin/phpctl box --version)"
}

function test_couscous() {
    assert_contains "Couscous 1.10" "$(./bin/phpctl couscous --version)"
}

function test_exakat() {
    if [ -n "$WITH_EXAKAT" ]; then
        assert_contains "Version : 2.6" "$(./bin/phpctl exakat version)"
    fi
}

function test_infection() {
    assert_contains "Infection - PHP Mutation Testing Framework version 0.27" "$(./bin/phpctl infection --version)"
}

function test_php_cs_fixer() {
    assert_contains "PHP CS Fixer 3.46" "$(./bin/phpctl php-cs-fixer --version)"
}

function test_phpmd() {
    assert_contains "PHPMD 2.15" "$(./bin/phpctl phpmd --version)"
}

function test_phpstan() {
    assert_contains "PHPStan - PHP Static Analysis Tool 1.10" "$(./bin/phpctl phpstan --version)"
}

function test_phpunit() {
    assert_contains "PHPUnit 10.5" "$(./bin/phpctl phpunit --version)"
}

function test_pint() {
    assert_contains "Pint 1.13" "$(./bin/phpctl pint --version)"
}

function test_watchr() {
    if [ -z "$WITHOUT_WATCHR" ]; then
        assert_contains "watchr command-line utility v0.4.1@b1b8dd5" "$(./bin/phpctl watchr --version)"
    fi
}

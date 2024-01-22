function test_box() {
    assert_contains "Box version 4.5.1" "$(./bin/phpctl box --version)"
}

function test_couscous() {
    assert_contains "Couscous 1.10.0" "$(./bin/phpctl couscous --version)"
}

function test_exakat() {
    assert_contains "Version : 2.6.2" "$(./bin/phpctl exakat version)"
}

function test_infection() {
    assert_contains "Infection - PHP Mutation Testing Framework version 0.27.9" "$(./bin/phpctl infection --version)"
}

function test_php_cs_fixer() {
    assert_contains "PHP CS Fixer 3.46.0" "$(./bin/phpctl php-cs-fixer --version)"
}

function test_phpstan() {
    assert_contains "PHPStan - PHP Static Analysis Tool 1.10.55" "$(./bin/phpctl phpstan --version)"
}

function test_phpunit() {
    assert_contains "PHPUnit 10.5.8" "$(./bin/phpctl phpunit --version)"
}

function test_pint() {
    assert_contains "Pint 1.13.7" "$(./bin/phpctl pint --version)"
}

function test_box() {
    assert_matches "Box version 4\." "$(./bin/phpctl box --version)"
}

function test_co_phpunit() {
    assert_contains "Swoole\Coroutine\run" "$(./bin/phpctl sh cat /usr/local/bin/co-phpunit)"
}

function test_composer_require_checker() {
    assert_matches "ComposerRequireChecker 4\." "$(./bin/phpctl composer-require-checker --version)"
}

function test_couscous() {
    assert_matches "Couscous 1\." "$(./bin/phpctl couscous --version)"
}

function test_deptrac() {
    assert_matches "deptrac 1\." "$(./bin/phpctl deptrac --version)"
}

function test_exakat() {
    if [ -n "$WITH_EXAKAT" ]; then
        assert_matches "Version : 2\." "$(./bin/phpctl exakat version)"
    fi
}

function test_infection() {
    [ "$PHP_VERSION" = "81" ] && _expected_version="0\.27\." || _expected_version="0\.29\."
    assert_matches "Infection - PHP Mutation Testing Framework version ${_expected_version}" "$(./bin/phpctl infection --version)"
}

function test_php_cs_fixer() {
    if [[ $PHP_VERSION = "84" ]]; then
        # TODO: remove this when php-cs-fixer becomes stable with php 8.4
        export PHP_CS_FIXER_IGNORE_ENV=yes
    fi
    assert_matches "PHP CS Fixer 3\." "$(./bin/phpctl php-cs-fixer --version)"
}

function test_phpcbf() {
    assert_matches "PHP_CodeSniffer version 3\." "$(./bin/phpctl phpcbf --version)"
}

function test_phpcs() {
    assert_matches "PHP_CodeSniffer version 3\." "$(./bin/phpctl phpcs --version)"
}

function test_phpmd() {
    assert_matches "PHPMD 2\." "$(./bin/phpctl phpmd --version)"
}

function test_phpstan() {
    assert_matches "PHPStan - PHP Static Analysis Tool 1\." "$(./bin/phpctl phpstan --version)"
}

function test_phpunit() {
    if [ "$PHP_VERSION" = "81" ]; then
        assert_matches "PHPUnit 10\." "$(./bin/phpctl phpunit --version)"
    elif [ "$PHP_VERSION" = "84" ]; then
        assert_matches "PHPUnit 12\." "$(./bin/phpctl phpunit --version)"
    else
        assert_matches "PHPUnit 11\." "$(./bin/phpctl phpunit --version)"
    fi
}

function test_pint() {
    assert_matches "Pint 1\." "$(./bin/phpctl pint --version)"
}

function test_watchr() {
    if [ -z "$WITHOUT_WATCHR" ] && ! [ "$PHP_VERSION" = "81" ]; then
        assert_matches "watchr command-line utility v0\.5\." "$(./bin/phpctl watchr --version)"
    fi
}

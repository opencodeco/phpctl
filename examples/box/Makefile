default: main.phar

vendor/autoload.php: composer.json
	phpctl composer install

main.phar: vendor/autoload.php
	phpctl box compile

clean:
	@rm -rf main.phar

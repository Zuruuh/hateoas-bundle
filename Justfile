set shell := ["bash", "-uc"]

vendor_bin  := "./vendor/bin/"
phpstan_bin := vendor_bin + "phpstan"
psalm_bin := vendor_bin + "psalm"
phpcsfixer_bin := vendor_bin + "php-cs-fixer"
phpunit_bin := vendor_bin + "phpunit"

cache_dir:
    @-mkdir .cache 2> /dev/null

fix: cache_dir
    {{phpcsfixer_bin}} fix --config .php-cs-fixer.dist.php

lint: cache_dir
    {{phpcsfixer_bin}} fix --dry-run --config .php-cs-fixer.dist.php

phpstan: cache_dir
    {{phpstan_bin}} analyse --configuration phpstan.dist.neon

psalm: cache_dir
    {{psalm_bin}} --config psalm.dist.xml

analyze: analyse
analyse: phpstan psalm

phpunit *args: cache_dir
    {{phpunit_bin}} --configuration phpunit.dist.xml --coverage-html .cache/coverage --testdox {{args}}

test: phpunit

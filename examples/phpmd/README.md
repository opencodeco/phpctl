# PHP Mess Detector

An example of [PHP Mess Detector](https://phpmd.org/) usage.

Run `phpctl phpmd src text cleancode,controversial,design,naming,unusedcode` to get PHPMD output execution for [Example](./src/Example.php) class.

You should have an output as following:
```shell
/usr/local/src/src/Example.php:6   LongVariable         Avoid excessively long variable names like $thiIsAnAmazingVariable. Keep variable name length under 20.
/usr/local/src/src/Example.php:8   UnusedLocalVariable  Avoid unused local variables such as '$anotherVariable'.
/usr/local/src/src/Example.php:11  CamelCaseMethodName  The method snake_case_method is not named in camelCase.
/usr/local/src/src/Example.php:17  MissingImport        Missing class import via use statement (line '17', column '23').
/usr/local/src/src/Example.php:18  EmptyCatchBlock      Avoid using empty try-catch blocks in uselessCatchBlock.
/usr/local/src/src/Example.php:24  UndefinedVariable    Avoid using undefined variables such as '$age' which will lead to PHP notices.
/usr/local/src/src/Example.php:24  UnusedLocalVariable  Avoid unused local variables such as '$age'.
```
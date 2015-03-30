#My new Package

##Requirements
These packages are needed for testing:

- Kitamura Satoshi's PHP client library for Coveralls API: [satooshi/php-coveralls](https://packagist.org/packages/satooshi/php-coveralls)
- Sebatsina Bergmann's PHPUnit [phpunit/phpunit](https://packagist.org/packages/phpunit/phpunit)


##Installation

First, clone that repo and dive into directory:

```bash

$ git clone git@github.com:tomkyle/package-boilerplate.git <directory>
$ cd <directory>

```

Second, run installer to retrieve the latest .htaccess from HTML5 boilerplate. 
The installer can be deleted after this.

```bash
$ ./installer.sh
```



If you want to work with TravisCI:

```bash 
$ cp .travis.yml.dist .travis.yml
```


Install dependencies and testing software:

```bash
$ composer install --dev
```


##Testing

Go to package root directory and issue `phpunit`.


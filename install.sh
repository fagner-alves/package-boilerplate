#!/bin/bash


INSTALL_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )



echo;
printf "Since this is a boilerplate: delete .git folder in order to detach it from original source repo? (y/n) ";
read DELETE_GIT;
echo ""

if [[ $DELETE_GIT =~ ^[Yy]$ ]]; then

        rm -Rf $INSTALL_DIR/.git
        echo "Done."
fi;





echo;
printf "Create folder structure for a web app (templates, static, htdocs, includes, var/cache)? (y/n) ";
read MKDIR_FOLDERS;
echo ""

if [[ $MKDIR_FOLDERS =~ ^[Yy]$ ]]; then

	printf "Create ${INSTALL_DIR}/templates ... " && mkdir -p $INSTALL_DIR/templates && echo "Done."
	printf "Create ${INSTALL_DIR}/static ... "    && mkdir -p $INSTALL_DIR/templates && echo "Done."
	printf "Create ${INSTALL_DIR}/includes ... "  && mkdir -p $INSTALL_DIR/includes  && echo "Done."
	printf "Create ${INSTALL_DIR}/var/cache ... " && mkdir -p $INSTALL_DIR/var/cache && chmod 0775 $INSTALL_DIR/var && echo "Done."

	printf "Create ${INSTALL_DIR}/htdocs ... " && mkdir -p $INSTALL_DIR/htdocs && echo "Done."



	printf "Create empty .htaccess file in htdocs/ (y/n) ";
	read CREATE_HTACCESS;
	echo ""

	if [[ $CREATE_HTACCESS =~ ^[Yy]$ ]]; then
		printf "Create ${INSTALL_DIR}/htdocs/.htaccess ... "
		echo "# htaccess" > $INSTALL_DIR/htdocs/.htaccess && echo "Done."
	fi;


	echo;
	printf "Put latest .htaccess from HTML5 boilerplate dist into project root? (y/n) ";
	read FETCH_HTACCESS;
	echo ""

	if [[ $FETCH_HTACCESS =~ ^[Yy]$ ]]; then

		curl https://raw.githubusercontent.com/h5bp/server-configs-apache/master/dist/.htaccess > $INSTALL_DIR/.htaccess
		echo "Done."
	fi;


fi;







echo;
printf "Bower: Install front-end dependencies (HTML5 Boilerplate, Bootstrap and jQuery)? (y/n) ";
read INSTALL_BOWER;
echo ""

if [[ $INSTALL_BOWER =~ ^[Yy]$ ]]; then

    bower install html5-boilerplate bootstrap jquery
    echo "Done."
fi;





echo;
printf "Are you planning PHP Unit Testing? Requires phpunit and php-coveralls (y/n) ";
read INSTALL_TESTING;
echo ""

if [[ $INSTALL_TESTING =~ ^[Yy]$ ]]; then

    composer require --dev satooshi/php-coveralls:dev-master phpunit/phpunit:4.*
    echo "Done."




	echo;
	printf "PHPUnit: Create phpunit.xml for local use from phpunit.xml.dist? (y/n) ";
	read COPY_PHPUNIT_XML;
	echo ""

	if [[ $COPY_PHPUNIT_XML =~ ^[Yy]$ ]]; then
	    cp $INSTALL_DIR/phpunit.xml.dist $INSTALL_DIR/phpunit.xml
	fi;




	echo;
	printf "Use Travis CI for PHP Unit Testing? (y/n) ";
	read COPY_TRAVIS;
	echo ""

	if [[ $COPY_TRAVIS =~ ^[Nn]$ ]]; then

		rm $INSTALL_DIR/.travis.yml.dist
	    echo "Done."

	else

		echo;
		printf "Travis CI: Create .travis.yml for local use from .travis.yml.dist? (y/n) ";
		read COPY_TRAVIS;
		echo ""

		if [[ $COPY_TRAVIS =~ ^[Yy]$ ]]; then
		    cp $INSTALL_DIR/.travis.yml.dist $INSTALL_DIR/.travis.yml
		fi;

	fi;
    echo "Done."




fi;







# echo;
# printf "Composer: Install PHP dependencies (y/n) ";
# read COMPOSER_INSTALL;
# echo ""
#
# if [[ $COMPOSER_INSTALL =~ ^[Yy]$ ]]; then
#     composer install
#     echo "Done."
# fi;







echo;
printf "Delete this installer? (y/n) ";
read DELETE_INSTALLER;
echo ""

if [[ $DELETE_INSTALLER =~ ^[Yy]$ ]]; then
    rm $0
    echo "Done."
fi;





unset FETCH_HTACCESS  DELETE_INSTALLER  INSTALL_BOWER  DELETE_GIT  COPY_PHPUNIT_XML  MKDIR_FOLDERS  CREATE_HTACCESS  COPY_TRAVIS  INSTALL_TESTING  COMPOSER_INSTALL;

#!/bin/bash

printf "Fetch latest .htaccess from HTML5 boilerplate dist? (y/n) ";
read FETCH_HTACCESS;
echo ""

if [[ $FETCH_HTACCESS =~ ^[Yy]$ ]]; then

	curl https://raw.githubusercontent.com/h5bp/server-configs-apache/master/dist/.htaccess > .htaccess
	echo "Done."
fi;

echo;
printf "Delete this installer? (y/n) ";
read DELETE_INSTALLER;
echo ""

if [[ $DELETE_INSTALLER =~ ^[Yy]$ ]]; then

        rm $0
        echo "Done."
fi;



unset FETCH_HTACCESS DELETE_INSTALLER;

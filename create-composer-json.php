#!/usr/bin/php
<?php

function getLine()
{
    return trim(fgets(STDIN)); // reads one line from STDIN
}

function endsWith($haystack, $needle) {
    return $needle === "" || (($temp = strlen($haystack) - strlen($needle)) >= 0 && strpos($haystack, $needle, $temp) !== FALSE);
}


$info = new \StdClass;

echo "Package name: ";
$info->name = getLine();

echo "Initial version number (1.0.0-rc): ";
$info->version = getLine() ?: "1.0.0-rc";




echo "Author name: ";
$author_name = getLine();
if ($author_name) {

    $info->authors = array();
    $info->authors[0] = new \StdClass;
    $info->authors[0]->name = $author_name;

    echo "Author email: ";
    if ($author_email = getLine()) {
        $info->authors[0]->email = $author_email;
    }

    echo "Author role: (Developer) ";
    $info->authors[0]->role = getLine() ?: "Developer";

}



echo "\n";
echo "PSR-4 namespace name of package: (leave blank if not needed) ";
$psr4_name = stripslashes(getLine());

if ( $psr4_name ) {

    $autoload = array( "psr-4" => array( $psr4_name => null ) );

    echo "PSR-4 namespace source directory: (src/)";
    $autoload['psr-4'][ $psr4_name ] = getLine() ?: "src/";

    $info->autoload = json_decode(json_encode( $autoload, JSON_UNESCAPED_SLASHES|JSON_PRETTY_PRINT));
}


$output = json_encode( $info, JSON_UNESCAPED_SLASHES|JSON_PRETTY_PRINT ) . "\n";

echo "\n";
echo $output;
echo "\n";
echo "Write to composer.json? (yes|no) ";
if (strtolower(getLine()) === "yes") {
    file_put_contents( "composer.json", $output);
    echo "Written.\n";
}

echo "Done.\n";



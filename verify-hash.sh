#!/bin/bash

RED='\e[31m'
GREEN='\e[32m'
CLOSE='\e[0m'

if [ "$#" -eq 1 ] && ([ $1 == "-h" ] || [ $1 == "--help" ]); then
	echo "Usage: $0 <hash_algo> <file> <source_hash>"
	echo "- hash: One of the 'sum' family, like [sha1, sha224, sha256, sha384, sha512, md5]."
	echo "- file: The filename to compute the hash validity."
	echo "- given_key: The hash key that should match the computed one."
	echo "Please note that the pattern matching is case insensitive."
	exit
fi

if [ "$#" -ne 3 ]; then
	echo "Illegal parameters: run '$0 -h' for usage."
	exit
fi

sha_compute=`$1sum $2 | cut -d " " -f 1 | tr '[A-Z]' '[a-z]'`
sha_generate=`echo $3 | tr '[A-Z]' '[a-z]'`

echo "Computed hash: $sha_compute"
echo "Given hash:    $sha_generate"

if [ "$sha_compute" == "$sha_generate" ]; then
	echo -e "${GREEN}OK${CLOSE}: Keys match correctly."
else
	echo -e "${RED}Failed${CLOSE}: Keys don't match."
fi

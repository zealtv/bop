#! /bin/bash

# cd to the script directory and run this


cd ../
zip -r bop-release`date "+%Y%m%d"`.zip * -x ".*" -x "*/.*"

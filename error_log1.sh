#!/bin/sh
grep -v 'HTTP/1.1" 200' recipe01_access_log.20210715.txt | grep -v 'HTTP/1.0" 200' | grep -v 'HTTP/1.1" 206' | grep -v 'HTTP/1.1" 301' | grep -v 'HTTP/1.1" 302' | grep -v .png | grep -v .jpg | grep -v .jpeg | grep -v .css | grep -v .js >> recipe_error_log.txt 
grep -v 'HTTP/1.1" 200' recipe02_access_log.20210715.txt | grep -v 'HTTP/1.0" 200' | grep -v 'HTTP/1.1" 206' | grep -v 'HTTP/1.1" 301' | grep -v 'HTTP/1.1" 302' | grep -v .png | grep -v .jpg | grep -v .jpeg | grep -v .css | grep -v .js >> recipe_error_log.txt
grep -v 'HTTP/1.1" 200' recipe03_access_log.20210715.txt | grep -v 'HTTP/1.0" 200' | grep -v 'HTTP/1.1" 206' | grep -v 'HTTP/1.1" 301' | grep -v 'HTTP/1.1" 302' | grep -v .png | grep -v .jpg | grep -v .jpeg | grep -v .css | grep -v .js >> recipe_error_log.txt
wc -l recipe_error_log.txt

cut -d + -f 3 recipe_error_log.txt >> recipe_error_log1.txt
wc -l recipe_error_log1.txt

cut -d ')' -f 1 recipe_error_log1.txt >> recipe_error_log2.txt
wc -l recipe_error_log2.txt

sed '/^$/d' recipe_error_log2.txt >> recipe_error_log3.txt
wc -l recipe_error_log3.txt

grep http recipe_error_log3.txt >> recipe_error_log_result.txt
wc -l recipe_error_log_result.txt 



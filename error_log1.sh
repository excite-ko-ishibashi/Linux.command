#!/bin/sh

grep -v 'HTTP/1.1" 200' recipe01_access_log.20210715.txt | grep -v 'HTTP/1.0" 200' | grep -v 'HTTP/1.1" 206' | grep -v 'HTTP/1.1" 301' | grep -v 'HTTP/1.1" 302' | grep -v .png | grep -v .jpg | grep -v .jpeg | grep -v .css | grep -v .js >> error_log_all.txt 
grep -v 'HTTP/1.1" 200' recipe02_access_log.20210715.txt | grep -v 'HTTP/1.0" 200' | grep -v 'HTTP/1.1" 206' | grep -v 'HTTP/1.1" 301' | grep -v 'HTTP/1.1" 302' | grep -v .png | grep -v .jpg | grep -v .jpeg | grep -v .css | grep -v .js >> error_log_all.txt
grep -v 'HTTP/1.1" 200' recipe03_access_log.20210715.txt | grep -v 'HTTP/1.0" 200' | grep -v 'HTTP/1.1" 206' | grep -v 'HTTP/1.1" 301' | grep -v 'HTTP/1.1" 302' | grep -v .png | grep -v .jpg | grep -v .jpeg | grep -v .css | grep -v .js >> error_log_all.txt
wc -l error_log_all.txt

grep http://erecipe.woman.excite.co.jp/search error_log_all.txt >> error_log_recipe.txt
wc -l error_log_recipe.txt

cut -f 4- -d "/" error_log_recipe.txt | cut -f 1 -d "H" >> error_log_recipe_path.txt
wc -l error_log_recipe_path.txt

sort error_log_recipe_path.txt >> error_log_recipe_sortpath.txt
wc -l error_log_recipe_sortpath.txt


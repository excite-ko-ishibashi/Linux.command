#!/bin/sh

grep -E 'HTTP/1\.[0,1]" [4-9]{1}[0-9]{2}' recipe01_access_log.20210715.txt | grep -Ev '\.(js|css|png|jpg|jpeg|gif)' >> error_log_all.txt
grep -E 'HTTP/1\.[0,1]" [4-9]{1}[0-9]{2}' recipe02_access_log.20210715.txt | grep -Ev '\.(js|css|png|jpg|jpeg|gif)' >> error_log_all.txt
grep -E 'HTTP/1\.[0,1]" [4-9]{1}[0-9]{2}' recipe03_access_log.20210715.txt | grep -Ev '\.(js|css|png|jpg|jpeg|gif)' >> error_log_all.txt

cut -d "\"" -f 2 error_log_all.txt | grep 'excite' >> error_log_recipe.txt

cut -f 2- -d "/" error_log_recipe.txt | cut -f 1 -d "H" >> error_log_recipe_path.txt

grep -v 'login' error_log_recipe_path.txt >> error_log_recipe_path1.txt

awk 'BEGIN{FS="&title="}{print $1}' error_log_recipe_path1.txt | awk 'BEGIN{FS="\\?_s="}{print $1}' | awk 'BEGIN{FS="\\?returnUrl"}{print $1}' | awk 'BEGIN{FS="\\?url="}{print $1}' >> error_log_recipe_path2.txt

sort error_log_recipe_path2.txt | uniq -c | sort >> error_log_recipe_sortpath.txt



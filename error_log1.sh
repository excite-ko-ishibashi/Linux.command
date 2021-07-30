#!/bin/sh
grep -E 'HTTP/1\.[0,1]" [4-9]{1}[0-9]{2}' $1 | grep -Ev '\.(js|css|png|jpg|jpeg|gif)' > error_log_all1.txt
grep -E 'HTTP/1\.[0,1]" [4-9]{1}[0-9]{2}' $2 | grep -Ev '\.(js|css|png|jpg|jpeg|gif)' >> error_log_all1.txt
grep -E 'HTTP/1\.[0,1]" [4-9]{1}[0-9]{2}' $3 | grep -Ev '\.(js|css|png|jpg|jpeg|gif)' >> error_log_all1.txt

cut -d "\"" -f 2 error_log_all1.txt | grep 'excite' >> error_log_recipe1.txt

cut -f 2- -d "/" error_log_recipe1.txt | cut -f 1 -d "H" >> error_log_recipe_path1.txt

grep -v 'login' error_log_recipe_path1.txt >> error_log_recipe_path11.txt

awk 'BEGIN{FS="&title="}{print $1}' error_log_recipe_path11.txt | awk 'BEGIN{FS="\\?_s="}{print $1}' | awk 'BEGIN{FS="\\?returnUrl"}{print $1}' | awk 'BEGIN{FS="\\?url="}{print $1}' >> error_log_recipe_path21.txt

sort error_log_recipe_path21.txt | uniq -c | sort >> error_log_recipe_sortpath1.txt

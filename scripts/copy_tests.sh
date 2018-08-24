#!/bin/bash

result=$(echo $1 | sed 's/#/./g')
test_cmd="python manage.py test --keepdb -v 3 --failfast "
echo $test_cmd$result | xclip -selection c

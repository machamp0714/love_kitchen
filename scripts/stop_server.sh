#!/bin/bash
su -l deploy -c 'Kill -KILL -s QUIT `cat /var/www/projects/love_kitchen/tmp/pids/unicorn.pid`'
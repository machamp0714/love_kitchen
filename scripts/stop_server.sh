#!/bin/bash
su -i deploy -c 'Kill -KILL -s QUIT `cat /var/www/projects/love_kitchen/tmp/pids/unicorn.pid`'
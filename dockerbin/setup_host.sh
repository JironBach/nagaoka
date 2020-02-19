#!/bin/sh

sudo apt-get install ruby-railties
bundle install
docker run -it -p 10080:80 -p 13000:3000 -p 13306:3306 -v /home/ubuntu/nagaoka:/root/nagaoka  --add-host=local_dev:192.168.0.51 --cap-add=NET_ADMIN junshimo2/nagaoka


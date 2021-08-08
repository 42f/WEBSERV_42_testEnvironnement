
#! /bin/bash

chmod 00 ./volume/site_data/static_pages/page_no_rights.html
ln ~/.ssh/webserv_testenv.pub ./ssh/webserv_testenv.pub
docker build -t bv/nginx_webserv .

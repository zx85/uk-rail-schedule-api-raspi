#!/bin/bash
run_dir=/opt/uk-rail-schedule-api
schedule_dir=/media/uk-rail-schedule-api
username=$(grep stomp_login ${run_dir}/config.yaml | awk -F\" '{print $2}')
password=$(grep stomp_password ${run_dir}/config.yaml | awk -F\" '{print $2}')
curl -s -L -u "${username}:${password}" -o ${schedule_dir}/schedule.gz 'https://publicdatafeeds.networkrail.co.uk/ntrod/CifFileAuthenticate?type=CIF_ALL_FULL_DAILY&day=toc-full'
gunzip -c ${schedule_dir}/schedule.gz > ${schedule_dir}/schedule.json

curl -s http://192.168.75.4:3333/refresh

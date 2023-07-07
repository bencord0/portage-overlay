#!/bin/bash

export AWS_PROFILE=condi.me_eu-west-1_admin
cd /usr/share/mastodon/public/

aws s3 cp --recursive ./ s3://nfra-club/

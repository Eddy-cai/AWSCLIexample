#!/bin/bash
echo "--------updating--------"
yum update -y
yum install httpd
aws s3 cp s3://aihi/code/analyticsworkflow/ /var/www/ --recursive

# AWSCLIexample
It is an example to run a simple Flask web application allowing users to query S3 buckets on the command line on the EC2 instance by clicking a button.

e.g. `aws s3 ls s3://aihi/`
## lanuch the EC2 instance by using AWS CLI.
The EC2 instance should be launched using AWS command line interface with the pre-configuration file called `build-scripts.sh` in the parameter `user-data`.

## create the scripts
`build-scripts.sh` is the file to send instructions to an instance at launch.

## flask application
It is a simple button which allows users to query S3 on the command line on the EC2 instance.

Python code is stored in the S3 bucket `aihi/code/analyticsworkflow`

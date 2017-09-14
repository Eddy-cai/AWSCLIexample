``` 
 Access key ID: 
 Secret access key:
 Default region name [None]: ap-southeast-2
 Default output format [None]: json
 security-group id: sg-8327f3e5  name=eddy-python
 keypair: MyKeyPair.pem
```
AWS CLI tutorial
================
## Install AWS CLI in Windows
### PRE:
>Install `python` and `pip`

>Add `python` to `Path` in system environment
TO install the AWS CLI with pip
`pip install awscli`

Adding the AWS CLI Executable to your Command Line Path
- Python 3.6 and pip – `%USERPROFILE%\AppData\Local\Programs\Python\Python36\Scripts`
- MSI installer (64-bit) – `C:\Program Files\Amazon\AWSCLI`
- MSI installer (32-bit) – `C:\Program Files (x86)\Amazon\AWSCLI`
	
Check versions of Python, pip and AWS CLI
```
python --version
pip --version
aws --version
```
	
## Configure the AWS CLI
```
aws configure
AWS Access Key ID [None]: 
AWS Secret Access Key [None]: 
Default region name [None]: ap-southeast-2
Default output format [None]: json
```
show the region in table format:

`aws ec2 describe-regions --output table`

## Create a security group
creat a new security group for a specific VPC
```
aws ec2 create-security-group --group-name eddy-python --description "My security group" --vpc-id vpc-abf632cf
{
	"GroupId": "sg-8327f3e5"
	}
```

describe security groups

`aws ec2 describe-security-groups --group-ids sg-8327f3e5`

adding rules into security group

`aws ec2 authorize-security-group-ingress --group-id sg-8327f3e5 --protocol tcp --port 22 --cidr 137.111.13.4/32`

delete the security group

`aws ec2 delete-security-group --group-id sg-3b3bef5d`

## Create a new key pair
create a new key pair

`aws ec2 create-key-pair --key-name MyKeyPair --query 'KeyMaterial' --output text > MyKeyPair.pem`

display the key pair

`aws ec2 describe-key-pairs --key-name MyKeyPair`

delete the key pair

`aws ec2 delete-key-pair --key-name MyKeyPair`
## launch the EC2 instance in AWS CLI
use this command:
```
aws ec2 run-instances --image-id ami-30041c53 --count 1 --instance-type m4.4xlarge --key-name MyKeyPair --security-group-ids sg-8327f3e5 --subnet-id subnet-58d9722e --associate-public-ip-address --user-data file://bootscripts
```
add a Name Tag to existing Instance

`aws ec2 create-tags --resources i-0c4ecee903946d3ba --tags Key=Name,Value=eddy-python`

display the instance:
```
aws ec2 describe-instances --filters "Name=image-id,Values=ami-x0123456,ami-y0123456,ami-z0123456"
aws ec2 describe-instances --filters "Name=instance-type,Values=m4.4xlarge"
```

terminate the instance

`aws ec2 terminate-instances --instance-ids i-092c78fae22f2470b`
	

	
	
	
 

# AFTP


To create a basic web server, you will first need to create an EC2 in AWS
of type,

	Amazon Linux AMI 2016.03.3 (HVM), SSD Volume Type - ami-7172b611

The script aftp.sh assumes the AWS privilege required to open port 80 by
means of adding a rule. This privilege can be obtained by assiging a
sufficient role in the "IAM Role" field of the EC2 launch wizard.
(I only tested with Power User privileges).

The easiest way to obtain the aftp.sh script is through a git command.

First install git:

	# yum install git -y

After logging in to your EC2, download the aftp.sh script with this command,

	# git clone https://github.com/jwmtllc/AFTP.git

Then run the script either as root or with sudo:

	# sudo ./aftp.sh

The final line of output will inform you what URL you can use to connect
to your web server.




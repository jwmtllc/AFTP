#!/bin/bash


id=`whoami`

if [ ! $id == 'root' ] ; then
	echo '    ' aftp.sh requires root privilege. Try,
	echo '    ' % sudo ./aftp.sh
	exit 1
fi 



public_hostname=`curl -s http://169.254.169.254/latest/meta-data/public-hostname`
echo public hostname == $public_hostname

region=`curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone/`
echo '        ' region == $region

security_group=`curl -s http://169.254.169.254/latest/meta-data/security-groups/`
echo '' security group == $security_group


## open port 80
echo ''
echo opening port 80 ...
echo aws ec2 authorize-security-group-ingress --group-name $security_group --region $region --protocol tcp --port 80 --cidr 0.0.0.0/0


echo ''
echo installing apache ...
yum install httpd -y

echo ''
echo starting apache ...
service httpd restart

## create index.html
cat > index.html <<EOF
<HTML>
<BODY>
Automation for the People!
</BODY>
</HTML>
EOF

cp index.html /var/www/html

echo ''
echo check output of http://$public_hostname
curl http://$public_hostname

echo Web server is ready: http://$public_hostname
exit 0

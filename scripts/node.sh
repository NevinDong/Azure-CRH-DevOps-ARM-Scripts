#!/bin/sh
NodeNum=$1
MasterIp="10.0.0.254"
UserName="crhuser"

mkdir script

echo "ambari.repo ..."
echo "[Ambari]
name=ambari-2.2.1
baseurl=http://archive.redoop.com/ambari/redhat/6/x86_64/ambari/2.2.1/
enabled=1
gpgcheck=0 
[CRH-4.9]
name=CRH-4.9
baseurl=http://archive.redoop.com/crh4/redhat/6/x86_64/crh/4.9/
path=/
enabled=1" >> script/ambari.repo

echo "jdk.sh ..."
echo "export JAVA_HOME=/opt/install/jdk
export JRE_HOME=/opt/install/jdk/jre
export CLASSPATH=.:\$JAVA_HOME/lib:\$JRE_HOME/lib:\$CLASSPATH
export PATH=\$JAVA_HOME/bin:\$JRE_HOME/bin:\$PATH" >>script/jdk.sh

echo "wget jdk ..."
wget http://archive.redoop.com/crh4/redhat/6/x86_64/crh/package/jdk-oracle/1.7.0_79/jdk-7u79-linux-x64.tar.gz >/dev/null 2>&1

service iptables stop
chkconfig iptables off

service ip6tables stop
chkconfig ip6tables off
setenforce 0

sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

chmod 755 script/*

echo $MasterIp master >> script/master_ip

Segment=${MasterIp%"."*}

ip_num=3
for ((i=1;i<=$NodeNum;i++))
do
let ip_num+=$i
echo $Segment"."$ip_num node$i >> script/node_ip
let ip_num-=$i
done

echo "edit /etc/hosts ..."
cat < script/master_ip >> /etc/hosts
cat < script/node_ip >> /etc/hosts

mkdir /opt/install
tar -zxf jdk*.tar.gz
rm -fr jdk*.tar.gz
mv jdk* jdk
mv jdk/ /opt/install

mv script/ambari.repo /etc/yum.repos.d/
yum clean all

mv script/jdk.sh /etc/profile.d/
source /etc/profile

echo "yum install ambari-agent ..."
yum install -y ambari-agent >/dev/null 2>&1

sed -i "s/hostname=localhost/hostname=master/g" /etc/ambari-agent/conf/ambari-agent.ini

echo "yum update openssl ..."
yum update openssl -y >/dev/null 2>&1
echo "start ambari-agent ..."
ambari-agent start >/dev/null 2>&1
source /etc/profile
rm -fr script
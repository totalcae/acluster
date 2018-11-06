
# TotalCAE CONFIDENTIAL
#
#
# 2018 TotalCAE
# All Rights Reserved.
#
# NOTICE: All information contained herein is, and remains
# the property of TotalCAE
#
# The intellectual and technical concepts contained
# herein are proprietary to TotalCAE
# and may be covered by U.S. and Foreign Patents,
# patents in process, and are protected by trade secret or copyright law.
# Dissemination of this information or reproduction of this material
# is strictly forbidden unless prior written permission is obtained
# from TotalCAE
#

export ADMIN_USER=$1
export ADMIN_PASSWORD=$2
export LICENSE_KEY=$3
export APPLICATION=$4
export INSTANCE_COUNT=$5

printenv > /tmp/ENVIRONMENT

mkdir -p /srv/ 
cd /srv
/bin/wget https://totalcaeapplications.blob.core.windows.net/totalcaeapps/totalcaeansible.tar.gpg
echo ${LICENSE_KEY} |  gpg --batch --output totalcaeansible.tar --passphrase-fd O  --decrypt totalcaeansible.tar.gpg
tar xfv totalcaeansible.tar
cd totalcaeansible/azure
yum -y install ansible
./make-head.sh > /var/log/totalcaedeploy.log 2>&1
exit 0

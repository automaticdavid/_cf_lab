
subscription-manager register --auto-attach
yum -y install redhat-access-insights
redhat-access-insights --register

subscription-manager repos --enable rhel-7-server-extras-rpms
subscription-manager repos --enable rhel-7-server-optional-rpms
subscription-manager repos --enable rhel-7-server-optional-rpms
subscription-manager repos --enable rhel-server-rhscl-7-rpms
subscription-manager repos --enable="rhel-7-server-ose-3.1-rpms"
yum -y update
yum -y install python27-python-pip
yum -y install ansible 
# yum -y install git
# yum -y install atomic-openshift-clients

export LD_LIBRARY_PATH=/opt/rh/python27/root/usr/lib64
/opt/rh/python27/root/usr/bin/pip install git+https://github.com/ManageIQ/manageiq-api-client-python.git

ansible-galaxy install -r requirements.yml

rm -f ~/.ssh/known_hosts
hostlist="cf.example.com cfui.example.com cfwork1.example.com cfwork2.example.com cfwork3.example.com cfwork4.example.com cfwork5.example.com"
for host in $hostlist; do ssh-copy-id -o StrictHostKeyChecking=false $host;done

cp /root/VMware-vix-disklib-5.5.0-1284542.x86_64.tar.gz ./files/VMware-vix-disklib-5.5.0-1284542.x86_64.tar.gz



ansible-playbook -i hosts/ -e @vault.yml --ask-vault-pass upgrade.yml -vvv
ansible-playbook -i hosts/ -e @vault.yml --ask-vault-pass pre-zone.yml --skip-tags updates -v
ansible-playbook -i hosts/ -e @vault.yml --ask-vault-pass post-zone.yml --skip-tags updates 


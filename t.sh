
# subscription-manager register --auto-attach
yum install redhat-access-insights
redhat-access-insights --register

subscription-manager repos --enable rhel-7-server-extras-rpms
subscription-manager repos --enable rhel-7-server-optional-rpms
subscription-manager repos --enable rhel-7-server-optional-rpms
subscription-manager repos --enable rhel-server-rhscl-7-rpms
yum install ansible 

yum install python27-python-pip
yum update
yum install git
         
git clone https://github.com/adamgoossens/cf-ansible.git cloudforms
 
ansible-galaxy install -r requirements.yml

 
# ansible
 ansible-playbook -i hosts/ -e @vault.yml --ask-vault-pass playbook.yml --skip-tags updates --tags new -v

# register cloudforms appliance


subscription-manager register --activationkey=rhn-vs-ehrman --org=5318211


# Do CF zones 

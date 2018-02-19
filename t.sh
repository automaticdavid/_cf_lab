
subscription-manager register --auto-attach
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
 
ansible

# register cloudforms appliance

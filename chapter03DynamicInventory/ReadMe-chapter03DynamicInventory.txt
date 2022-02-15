To pass login into via enviroment .
AZURE_CLIENT_ID

AZURE_SECRET

AZURE_SUBSCRIPTION_ID

AZURE_TENANT



u can export them or store it in file $HOME/.azure/credentials
subscription_id=xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
client_id=xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
secret=xxxxxxxxxxxxxxxxx
tenant=xxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx



set  AZURE_CLOUD_ENVIRONMENT incase - To use an Azure Cloud other than the default public cloud (eg, Azure China Cloud, Azure US Government Cloud, Azure Stack), pass the “cloud_environment” argument to modules, configure it in a credential profile, or set the “AZURE_CLOUD_ENVIRONMENT” environment variable. The value is either a cloud name as defined by the Azure Python SDK (eg, “AzureChinaCloud”, “AzureUSGovernment”; defaults to “AzureCloud”) 


wget https://raw.githubusercontent.com/ansible-collections/community.general/main/scripts/inventory/azure_rm.py
chmod 755 azure_rm.py
Note - bug in file azure_rm.py, to fix to fix change Line number 207 from
207     from azure.mgmt.compute import __version__ as azure_compute_versionton 
to
207     from azure.mgmt.compute import _version as azure_compute_version


export ANSIBLE_HOST_KEY_CHECKING=False



# ansible-playbook -i dynamicInventory_myazure_rm.yml pingall.yml
# ansible-inventory -i dynamicInventory_myazure_rm.yml --graph
# ansible-inventory -i dynamicInventory_myazure_rm.yml --list
# ansible-playbook -i dynamicInventory_myazure_rm.yml pingall.yml --limit=tag_Ansible_nginx


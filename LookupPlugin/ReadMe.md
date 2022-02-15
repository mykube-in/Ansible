<b>Lookup plugins:</b><br>
Lookup plugins are designed to read data from different sources and feed them to Ansible. <br>
The data source can be either from the local filesystem on the controller node or from an external data source.<br>
These may also be for file formats that are not natively supported by Ansible.<br>
<br>
If you decide to write your own lookup plugin, you need to drop it in one of the following directories for Ansible to pick it up during the execution of an Ansible playbook.<br>
<br><b>
At ~/.ansible/plugins/lookup_plugins/ <br>
At /usr/share/ansible_plugins/lookup_plugins/ <br>
</b>OR<b></br>
with ANSIBLE_LOOKUP_PLUGINS environment variable <br>
</b>
OR <br>
<b>A lookup_plugins directory adjacent to your play<br>
inside a role<br>
By putting it in one of the lookup directory sources configured in ansible.cfg.<br>
<hr>


<b> List inbuilt plugin: </b> <br>
ansible-doc -t lookup -l <br>
ansible-doc -t lookup PLUGINi_NAME <br>



```
[unix@AMITSUNEJA ~]$  ansible-doc -t lookup -l
avi                   Look up ``Avi`` objects
aws_account_attribute Look up AWS account attributes
aws_secret            Look up secrets stored in AWS Secrets Manager
aws_service_ip_ranges Look up the IP ranges for services provided in AWS such as EC2 and S3
aws_ssm               Get the value for a SSM parameter or all parameters under a path
cartesian             returns the cartesian product of lists
chef_databag          fetches data from a Chef Databag
config                Lookup current Ansible configuration values
conjur_variable       Fetch credentials from CyberArk Conjur
consul_kv             Fetch metadata from a Consul key value store
cpm_metering          Get Power and Current data from WTI OOB/Combo and PDU devices
cpm_status            Get status and parameters from WTI OOB and PDU devices
credstash             retrieve secrets from Credstash on AWS
csvfile               read data from a TSV or CSV file
cyberarkpassword      get secrets from CyberArk AIM
dict                  returns key/value pair items from dictionaries
dig                   query DNS using the dnspython library
dnstxt                query a domain(s)'s DNS txt fields
env                   read the value of environment variables
etcd                  get info from an etcd server
file                  read file contents
fileglob              list files matching a pattern
filetree              recursively match all files in a directory tree
first_found           return first file found from list
flattened             return single list completely flattened
gcp_storage_file      Return GC Storage content
grafana_dashboard     list or search grafana dashboards
hashi_vault           retrieve secrets from HashiCorp's vault
hiera                 get info from hiera data
indexed_items         rewrites lists to return 'indexed items'
ini                   read data from a ini file
inventory_hostnames   list of inventory hosts matching a host pattern
items                 list of items
k8s                   Query the K8s API
keyring               grab secrets from the OS keyring
laps_password         Retrieves the LAPS password for a server
lastpass              fetch data from lastpass
lines                 read lines from command
list                  simply returns what it is given
manifold              get credentials from Manifold.co
mongodb               lookup info from MongoDB
nested                composes a list with nested elements of other lists
nios                  Query Infoblox NIOS objects
nios_next_ip          Return the next available IP address for a network
nios_next_network     Return the next available network range for a network-container
onepassword           fetch field values from 1Password
onepassword_raw       fetch an entire item from 1Password
password              retrieve or generate a random password, stored in a file
passwordstore         manage passwords with passwordstore.org's pass utility
pipe                  read output from a command
rabbitmq              Retrieve messages from an AMQP/AMQPS RabbitMQ queue
random_choice         return random element from list
redis                 fetch data from Redis
sequence              generate a list based on a number sequence
shelvefile            read keys from Python shelve file
skydive               Query Skydive objects
subelements           traverse nested key from a list of dictionaries
template              retrieve contents of file after templating with Jinja2
together              merges lists into synchronized list
url                   return contents from URL
varnames              Lookup matching variable names
vars                  Lookup templated value of variables
[unix@AMITSUNEJA ~]$
```


<br>
<hr>


<b>Method to invoke lookup plugins: </b> <br>
<b>Method 1 – using lookup:</b>The default behavior of lookup is to return a string of comma separated values. lookup can be explicitly configured to return a list using wantlist=True<br>
<b>Method 2 – Using query:</b>query will always return a list<br>
<hr>
<hr>
<b>file lookup plugin:</b><br>
 It reads through the file content on the controller node. The data read from the file can then be fed to the Ansible playbook as a variable<br>
<b> example: fileLookupPluginExample1.yml</b> <br>
<br>
Now lets cover more examples. <br>
1. fileLookupPluginExample1.yml <br>
2. fileLookupPluginExample2.yml <br>
3. csvfileLookupPluginExample.yml <br>
4. digLookupPluginExample1.yml <br>
5. iniLookupPluginExample1.yml <br>
6. envLookupPluginExample1.yml <br>
7. urlLookupPluginExample1.yml <br>


<b> Important Tips for Ansible :</b><br>
<b>1. condition check : </b> when we check the variable has value True or False. We put something like.<br>
<b> when: myvar is defined and myvar == True </b> <br>
OR <br>
<b> when: <br>
      - myvar is defined <br>
      - myvar == True
</b><br>
We can use any of above format and it is fine. But of we drop condition - myvar is defined then it will not work.<br> 
Even you have variable myvar defined and its value is True. <br>
<b> So better way of writing the same is : <br>
when: foo|default(False) == True or bar|default(False) == True <br>
OR <br>
when: foo|d(False) == True or bar|d(False) == True <br>
<br>
<hr>

yaml Syntax: 
------------------------------------------------------------------------------
</b>

script: < <br>
  this is multiline comment <br>
  and can flow on multi <br>
  lists , remember there is no /n in above lines when we parse this yml. <br>

script: | <br>
  this is also multiline , used in script but it has /n in end. <br>
  this is second line of script and have /n in end. <br>
  this is third line of script and have /n in end. <br>

<br>
<hr>


<b> become: True </b><br>
become can be defined at 2 levels , playbook level or task level. <br>
 <br>
 <hr>

<b> raw module in ansible: </b> <br>
If you remote device does not have python install then you can use raw module. 
<b> Note: </b> If using raw from a playbook, you may need to disable fact gathering using gather\_facts: no if youare using raw to bootstrap python onto the machine. <br>
<br>
<hr>

<b> local_action : </b> <br>
local\_action to execute command on local server.
<br>
<hr>


-------------------------------------------------------------------------------
Template Design Link:
--------------------

https://jinja.palletsprojects.com/en/2.11.x/templates/


------------------------------------------------------------------------------
Roles
-----

---
- hosts: webservers

roles:

- { role: foo, when: "ansible_os_family == 'RedHat'" }



-------------------------------------------------------------------------------
Reading inventory file
---------------------
ansible -i path_to_inventory groupname --list-hosts -v ( -v show Ansible.cfg file its using )

ansible -i inventory.txt all  --list-hosts

ansible -i inventory.txt ungrouped --list-hosts

------------------------------------------------------------------------------
Ansible.cfg File
---------------

Using /etc/ansible/ansible.cfg

Using ~/.ansible.cfg

Using ./ansible.cfg (RECOMMENDED WAY)

using ANSIBLE_CONFIG in .bashrc file 


------------------------------------------------------------------------------
Vault Commands
--------------

ansible-vault create secret.yml -> create file

ansible-vault view secret.yml -> view file

ansible-vault edit secret.yml -> edit file

ansible-vault encrypt someexisting1.yml someexisting2.yml  -> encrypt existing file

ansible-vault encrypt inPutfile.yml --output=secretOutputfile.yml -> create encrypted secretOutputfile.yml from inputfile.

ansible-vault decrypt secretOutputfile.yml  --output=plainfile.yml -> create dencrypted plainfile.yml from  encrypted secretOutputfile.yml

ansible-vault rekey secretOutputfile.yml -> change password

-----------------------------------------------------------------------------------------------------
Example:
--------


ansible-vault encrypt playbookwithsecretpassword.yml

New Vault password:

Confirm New Vault password:


ansible-playbook playbookwithsecretpassword.yml

ERROR! Attempting to decrypt but no vault secrets found


ansible-playbook --vault-id @prompt playbookwithsecretpassword.yml

Vault password (default):


ansible-playbook --vault-password-file=./vault_passwd_file.txt  playbookwithsecretpassword.yml

OR

ANSIBLE_VAULT_PASSWORD_FILE enviroment variable

------------------------------------------------------------------------------







# CENTOS
# ENABLE EPEL REPO
yum install epel-release
# RHEL
# ENABLE EXTRAS REPO
subscription-manager repos --enable rhel-7-server-extras-rpms
Ou
subscription-manager repos --enable=rhel-7-server-ansible-2-rpms

Note:The modules that ship with Ansible all are written in Python, but modules
can be written in any language.

Note: List of all modules.
https://docs.ansible.com/ansible/2.9/modules/list_of_all_modules.html

# LIST ALL MODULES
ansible-doc -l
# VIEW MODULE DOCUMENTATION
ansible-doc <module_name>
# dry run
[centos@centos7-1 ansible]$ ansible-playbook play.yml -i inventory --check


[centos@centos1 ~]$ mkdir ansible ; cd ansible
[centos@centos1 ~]$ vim inventory
[all:vars]
ansible_ssh_user=centos
[web]
web1 ansible_ssh_host=centos2
[admin]
ansible ansible_ssh_host=centos1
[centos@centos1 ~]$ ansible all -i inventory -m command -a "uptime"






TAGS:
ansible-playbook example.yml --tags “configuration”
ansible-playbook example.yml --skip-tags "notification"
ansible-playbook example.yml --tags “tagged”
ansible-playbook example.yml --tags “untagged”
ansible-playbook example.yml --tags “all”
tasks:
- yum: name={{ item }} state=installed
with_items:
- httpd
- memcached
tags:
- packages
- template: src=templates/src.j2 dest=/etc/foo.conf
tags:
- configuration



-----------------------------------------------------------------------------------------
Many types of general and special purpose loops

➔ with_nested

➔ with_dict

➔ with_fileglob

➔ with_together

➔ with_sequence

➔ until

➔ with_random_choice

➔ with_first_found

➔ with_indexed_items

➔ with_lines


-------------------------------------------------------------------------------------------


VARIABLE PRECEDENCE
Ansible v2
1. role defaults
2. inventory file or script group vars
3. inventory group_vars/all
4. playbook group_vars/all
5. inventory group_vars/*
6. playbook group_vars/*
7. inventory file or script host vars
8. inventory host_vars/*
9. playbook host_vars/*
10. host facts
11. play vars
12. play vars_prompt
13. play vars_files
14. role vars (defined in role/vars/main.yml)
15. block vars (only for tasks in block)
16. task vars (only for the task)
17. role (and include_role) params
18. include params
19. include_vars
20. set_facts / registered vars
21. extra vars (always win precedence





https://github.com/erjosito/ansible-azure-lab

https://docs.microsoft.com/en-us/azure/developer/ansible/dynamic-inventory-configure?tabs=ansible

https://labs.cd2h.org/gitforager/repository/repository.jsp?id=76604856
https://www.shudnow.io/2019/12/16/ansible-dynamic-inventories-in-azure-part-3/



-------------------------------------------------------------------------------------------------------
MAGIC VARIABLES
---------------
Ansible creates and maintains information about it’s current state and  other hosts through a series of “magic" variables.

★ hostvars[inventory_hostname] : Show all ansible facts

{{ hostvars['test.example.com']['ansible_distribution'] }} : Specific variable for specific host

★ group_names : is a list (array) of all the groups the current host is in

★ groups: is a list of all the groups (and hosts) in the inventory



------------------------------------------------------------------------------------------------------------
JINJA2 Testing consitions
------------------------
{% if variable is defined %}
{% if variable is none %}
{% if variable is even %}
{% if variable is string %}
{% if variable is sequence %}




JINJA2 more filters
-------------------
# Combine two lists
{{ list1 | union(list2) }}
# Get a random number
{{ 59 | random }} * * * * root /script/from/cron
# md5sum of a filename
{{ filename | md5 }}
# Comparisons
{{ ansible_distribution_version | version_compare('12.04', '>=') }}
# Default if undefined
{{ user_input | default(‘Hello World') }}
# replace
{% set my_var='this-is-a-test' %}
{{ my_var | replace('-', '_') }}
# Example
{% set servers = "server1,server2,server3" %}
{% for server in servers.split(",") %}
{{ server }}
{% endfor %}
#
# Combine two lists
{{ list1 | union(list2) }}
# Get a random number
{{ 59 | random }} * * * * root /script/from/cron
# md5sum of a filename
{{ filename | md5 }}
# Comparisons
{{ ansible_distribution_version | version_compare('12.04', '>=') }}
# Default if undefined
{{ user_input | default(‘Hello World') }}
# 
Web Servers<br>
{% for server in groups.web %}
{{ server }} {{ hostvars[server].ansible_default_ipv4.address }} - free memory: {{ hostvars[server].facter_memoryfree
}}<br>
{% endfor %}
#


------------------------------------------------------------------------------------------------------------



Setting Facts Example
---------------------
# Example setting the Apache version
- shell: httpd -v|grep version|awk '{print $3}'|cut -f2 -d'/'

  register: result

- set_facts:

    apache_version: ”{{ result.stdout }}"

------------------------------------------------------------------------------------------------------------

lineinfile:

the regexp option tells the module what will be the content to replace.

The line option replaces the previously found content with the new content of your choice.

The backrefs option guarantees that if the regexp does not match, the file will be left unchanged.

--------------------------------------------------------------------------------------------------------------

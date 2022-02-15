Day2: <br>
https://www.youtube.com/watch?v=ba62ZTu-1Zk  --> ansible class 2 part 1 1 <br>
https://www.youtube.com/watch?v=zJ1U44LSK84  --> ansible class 2 part 1 2 <br>
https://www.youtube.com/watch?v=8OU0bm_GhUY  --> ansible class 2 part 2 1 <br>
https://www.youtube.com/watch?v=uM7eKjLXmPo  --> ansible class 2 part 2 2 <br>
https://www.youtube.com/watch?v=cX4esgFP4FI  --> ansible class 2 part 2 3 <br>
https://www.youtube.com/watch?v=GqT-9kYvab0  --> ansible class 2 part 3 1 <br>
https://www.youtube.com/watch?v=mW_Czlk0xvQ  --> ansible class 2 part 3 2 <br>
https://www.youtube.com/watch?v=dIiAZzeg_co  --> ansible class 2 part 3 3 <br>
<br>
<hr>
<b> How to use gather_fact to fetch remote machine ip address ? </b><br>
<b> -----------------------------------------------------------</b> <br>
create directory named as lab and create required files for this project?

```
[unix@AMITSUNEJA labDay2]$  tree lab
lab
├── LocalAndRemoteAllAndDefaultIPAddress.yaml
├── ansible.cfg
├── hosts
└── logs
    └── ansible.log

1 directory, 4 files
[unix@AMITSUNEJA labDay2]$


[unix@AMITSUNEJA labDay2]$  cd lab


[unix@AMITSUNEJA lab]$  cat ansible.cfg
[defaults]
inventory         = hosts
host_key_checking = False
log_path          = ./logs/ansible.log
[ssh_connection]
control_path_dir  = /dev/shm/ansible_control_path




[unix@AMITSUNEJA lab]$  cat hosts
# All Unix Server Group
[unixservers:children]
centosgrp
ubuntugrp

[unixservers:vars]
ansible_user=amit

# All Centos Server Group
[centosgrp]
centos01  ansible_python_interpreter=/usr/libexec/platform-python3.6
centos02  ansible_python_interpreter=/usr/libexec/platform-python3.6

# All ubuntu Server group
[ubuntugrp]
ubuntu0[1:2]



[unix@AMITSUNEJA lab]$  cat LocalAndRemoteAllAndDefaultIPAddress.yaml
---
- hosts: localhost
  connection: local
  gather_facts: true
  tasks:
    - debug: var=ansible_all_ipv4_addresses
    - debug: var=ansible_default_ipv4.address

- hosts: all
  gather_facts: true
  tasks:
    - debug: var=ansible_all_ipv4_addresses
    - debug: var=ansible_default_ipv4.address
[unix@AMITSUNEJA lab]$
```

<b> using jinja templates configure vsftpd on all the centos servers </b><br>
<b> ---------------------------------------------------------------- </b><br>
<b> Note:</b><br>
Before we start working on configureing it using ansible . It is important to understand the vsftpd application<br>without using ansible . Once we have application up and running without using ansible then we will proceed with ansible on multiple servers. <br>So lets login to centos01 server and manually understand the application and take some notes like:-<br>
1. rpm name and how to install it ? <br>
2. what are configuration files involved ? <br>
3. what are the variables present in configuration files and their configuration impact ? <br>
4. How to stop and start the service ? <br>
5. what all things we can define in jinja template ? <br>
To Answer all these above questions lets refer to one file vsftpd.md file present here only. 
6. create directory struceture.

<br>
<hr>
<b>Testing ftp server: </b><br>
To test our project we have  ftpdata.shi will open ftp session and copy file on ftp server and close the connection.<br>

```
[unix@AMITSUNEJA labDay2]$  cat ftpdata.sh
#!/bin/bash
HOST='centos01'
USER='amitftp'
PASSWD='amit@123'

ftp -n -v $HOST << EOT
ascii
user $USER $PASSWD
pass
prompt
bin
put testfile.txt
bye
EOT
[unix@AMITSUNEJA labDay2]$
```

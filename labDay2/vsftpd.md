<b>Installation :</b><br>
yum install vsftpd i.e we will use yum module in ansible.

<b> Application username and password :</b>
we decided to user amitftp as username and amit@123 as a password for our application user.  

<b>config file: /etc/vsftpd/vsftpd.conf </b><br>
We will use jinja2 template do define few of things below as variable. 
Also we will fetch IP address of remote machine using gather facts and we will use it as listen_address via jinja2 template only. 

```
[root@centos01 vsftpd]# cat /etc/vsftpd/vsftpd.conf
local_enable=True
write_enable=True
local_umask=022
anon_upload_enable=NO
dirmessage_enable=YES
message_file=/etc/vsftpd/message.txt
xferlog_enable=YES
connect_from_port_20=NO
pasv_enable=YES
port_enable=YES
pasv_max_port=50000
pasv_min_port=50999
xferlog_std_format=YES
listen=YES
listen_address=192.168.1.3
listen_ipv6=NO
pam_service_name=vsftpd
userlist_enable=YES
userlist_file=/etc/vsftpd/user_list
userlist_deny=NO
```

<b> config file :/etc/vsftpd/ftpusers :</b><br> 
This file contain users which are not allowed to connect via ftp . It has some default list.<br>
We need to ensure that out application user amitftp is not present in this file.<br>
which means we need to use user module of ansible to create user. <br>
We will read this page while defining properties of our user as per out rrequirment.<br>
https://docs.ansible.com/ansible/latest/collections/ansible/builtin/user_module.html <br>
if by mistake user exist in this file /etc/vsftpd/ftpusers then we need to remove him .<br>
We will use lineinfile module. https://docs.ansible.com/ansible/latest/collections/ansible/builtin/lineinfile_module.html this module support regex which we may or may not use depends on out requirment. 

```
[root@centos01 vsftpd]# cat ftpusers
root
bin
daemon
adm
lp
sync
shutdown
halt
mail
news
uucp
operator
games
nobody
[root@centos01 vsftpd]#
```


<br>
<b> config file :/etc/vsftpd/user_list </b><br>
This file also contain user name and behaviour of this file configured by parameter <br>
if userlist_deny=YES (which is default YES if not defined) means if user name is mentioned in /etc/vsftpd/user_list then he is denied to do ftp. <br>
if userlist_deny=NO which means only user present in this file will be able to do ftp. <br>
Our Decision is set this file to NO. and remove all users from this file and add our application user amitftp to this file. <br>
We will be using firstly copy module to ensure that we create this empty file and then we will use lineinfile module to add out user amitftp to this file .<br>
This will create 100%  secure enviroment for my application. <br>
to use this file we need to set userlist_deny=No in /etc/vsftpd/vsftpd.conf. we will discuss this file in next section. <br>
<br>
<br>

<b> Explanation if /etc/vsftpd/vsftpd.conf:</b><br>
Main configuration file on vsftpd . and we need to understand few parameters for this file.<br>
anonymous_enable=NO -> No anonymous user can login <br>
local_enable=YES -> yes i am ok if local user say ftp 127.0.0.1 <br>
write_enable=YES -> yes let authenticated user write data <br>
local_umask=022 --> ok new file created with this umask <br>
anon_upload_enable=NO -> No anonymous can upload file <br>
dirmessage_enable=YES  -> if enabled, users of the FTP server can be shown messages when they first enter a new directory. By default, a directory is scanned for the file .message, but that may be overridden with the configuration setting message_file. <br>
message_file=/etc/vsftpd/message.txt <br>
xferlog_enable=YES  -> logs upload and download info in  /var/log/vsftpd.log, but this location may be overridden using the configuration setting vsftpd_log_file.We will be using this default file /var/log/vsftpd.log <br> 
connect_from_port_20=YES -> not sure lets decide latera <br>
xferlog_std_format=YES -> If enabled, the transfer log file will be written in standard xferlog format, as used by wu-ftpd.  log file is /var/log/xferlog, but you may change it with the setting xferlog_file.We will be using default file. <br>
listen=YES -> set this to YES Only if listen_ipv6 is NO.  <br>
listen_address=192.168.1.3 -> Set interface of ipv4 on which ftp will run. <br>
listen_ipv6=NO -> NO . Set this to YES if if yount to use ipv6 , but then you need to set listen=NO. <br>
pam_service_name=vsftpd  <br>
userlist_enable=YES  -> discussed above in 3rd point. <br>
userlist_file=/etc/vsftpd/user_list -> discussed above in 3rd point. <br>
userlist_deny=NO -> discussed above in 3rd point. <br>
<br>

we tested this configuration is working on centos01 which is good. means we are ok to proceed with this configuration. 
<br>
We also need to create /etc/vsftpd/message.txt while triting playbook keep it in mind. 















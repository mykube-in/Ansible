#!/bin/bash
USER='amitftp'
PASSWD='amit@123'
UNIXHOST="centos01 centos02 ubuntu01 ubuntu02"

for HOST in `echo $UNIXHOST`
do
echo 
echo "******* $HOST ********"
	ftp -n -v $HOST <<-'EOT'
        ascii
        user $USER $PASSWD
        pass
        prompt
        bin
        put testfile.txt
        bye
EOT
done

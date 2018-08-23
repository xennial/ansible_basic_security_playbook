# Ansible Basic Security Playbook

#### Tripwire

Setup is based on this tutorial:
https://www.digitalocean.com/community/tutorials/how-to-use-tripwire-to-detect-server-intrusions-on-an-ubuntu-vps

It is recommended that you also set up a cron to make copies of the Tripwire 
database and store these remotely somewhere. Such as in a AWS S3 bucket so that
if the system becomes corrupted you can use these to help restore your server. 
Of course if you are taking regular snapshots of your instance then this may not 
be necessary, as you can just use them to restore your system.

#### RKHunter
Warning! This configuration for rkhunter will automatically disallow SSH V1. If you need SSH1 please edit the 
RKHunter role before running.

#### Opendkim and Postfix

Once the role has created the DKIM keys please copy and paste them to a dns 
txt record with the following commands:
**
cat /etc/opendkim/keys/name_of_your_domain/mail.txt
**
More indepth instructions can be found in this excellent tutorial (roughly halfway down the page): 
https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-dkim-with-postfix-on-debian-wheezy

# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

# update Student Workstation host for the specific lab
# only if need a simpler /etc/hosts file do the following 2 steps

# add static routes to training server and jump host
sudo ssh 192.168.1.31 -t ssh 172.16.20.1 /etc/f5_routes/routes.3dns.172
sudo ip route add 172.16.0.0/16 via 10.10.1.33

# NOTHING specific for this lab - only the common lab files from common-tasks.sh

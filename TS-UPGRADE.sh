# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

# set scf name
iApp=TS_iApp--station_v15.1.tmpl

# confirm bigip1 is active
for i in {1..12}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done
#touch /home/student/Desktop/bigip1_ready

# download config from GitHub, copy to bigip1 and load/merge onto bigip1
curl --silent https://raw.githubusercontent.com/learnf5/ts/main/$iApp --output /home/student/Downloads/$iApp
rm /home/student/Downloads/TS_iApp--station_v17.1.tmpl

# confirm bigip1 is active
for i in {1..12}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done

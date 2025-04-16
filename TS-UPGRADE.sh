# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

# confirm bigip1 is active
for i in {1..12}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done
#touch /home/student/Desktop/bigip1_ready

# download config from GitHub, copy to bigip1 and load/merge onto bigip1
curl --silent https://raw.githubusercontent.com/learnf5/ts/main/TS_iApp--station_v15.1.tmpl --output /home/student/Downloads/TS_iApp--station_v15.1.tmpl
rm /home/student/Downloads/TS_iApp--station_v17.1.tmpl
curl --silent https://raw.githubusercontent.com/learnf5/ts/main/*.md5 --output /home/student/tmp/*.md5

# confirm bigip1 is active
for i in {1..12}; do [ "$(sudo ssh root@192.168.1.31 cat /var/prompt/ps1)" = "Active" ] && break; sleep 5; done
